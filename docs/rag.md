<p align="center">
  <a href="https://github.com/txt/se25fall/blob/main/README.md#top"><img src="https://img.shields.io/badge/Home-%23ff5733?style=flat-square&logo=home&logoColor=white" /></a>
  <a href="/docs/syllabus.md#top"><img src="https://img.shields.io/badge/Syllabus-%230055ff?style=flat-square&logo=openai&logoColor=white" /></a>
  <a href="https://docs.google.com/spreadsheets/d/1E7H6IiFEV0WIooE1biPB7VVrdaEtBh6yXC-2nrwPKCY/edit?gid=0#gid=0"><img src="https://img.shields.io/badge/Teams1-%23ffd700?style=flat-square&logo=users&logoColor=white" /></a>
  <a href="https://docs.google.com/spreadsheets/d/1i0fNqKea0LzqmB-h8gtOrnF0MM-qt560goU4QkRw8BA/edit?usp=sharing"><img src="https://img.shields.io/badge/Teams2-%23ffcc00?style=flat-square&logo=users&logoColor=white" /></a>
  <a href="https://moodle-courses2527.wolfware.ncsu.edu/course/view.php?id=4690&bp=s"><img src="https://img.shields.io/badge/One-%23dc143c?style=flat-square&logo=moodle&logoColor=white" /></a>
  <a href="https://moodle-courses2527.wolfware.ncsu.edu/course/view.php?id=4691&bp=s"><img src="https://img.shields.io/badge/Two-%23b22222?style=flat-square&logo=moodle&logoColor=white" /></a>
  <a href="https://discord.gg/YnAw7uZxAD"><img src="https://img.shields.io/badge/Chat-%23008080?style=flat-square&logo=discord&logoColor=white" /></a>
  <a href="https://ncsu.hosted.panopto.com/Panopto/Pages/Sessions/List.aspx?folderID=7b1bbb56-937c-42a1-96b4-b33e0134710f"><img src="https://img.shields.io/badge/Vids-%23ffa500?style=flat-square&logo=youtube&logoColor=white" /></a>
  <a href="/LICENSE.md"><img src="https://img.shields.io/badge/©%20timm%202025-%234b4b4b?style=flat-square&logoColor=white" /></a></p>
<h1 align="center">:cyclone: CSC510: Software Engineering<br>NC State, Fall '25</h1>
<p align="center"><em>Q1: does <a href="https://x.com/karpathy/status/1886192184808149383?lang=en">vibe code</a> == <a href="https://docs.google.com/presentation/d/1O6fZa0MbuNPVfbQV0eENzuYL-2YdIr-LRawhC92gSJE/present?slide=2">pain maintain</a>?</em><br>
<em> Q2: How much could/should AI change this "standard model"?</em><br>
<img width="400" alt="image" src="https://github.com/user-attachments/assets/acde700e-1d4d-4002-94a2-1d8aa08914e2"></p>
<p align="center"><b>This subject:</b> work in groups; write <b>quality</b> code;
maintain alien code; use SE + AI; establish on-line profile.
(For more on above pic, see Fig3 of <a href="https://doi.org/10.1109/TSE.2023.3339383">Long et.al, TSE'23</a>.)</p>


# RAG as Virtual Memory: "Semantic Paging" for LLMs

Think OS paging: RAM is tiny, disk is huge, so the OS **pages in** just the working
set. RAG does the same: the LLM’s context is tiny, your PDF corpus is huge, so we
**page in** only the most relevant text chunks.

## Project setup

```
myproject/
  ├─ rag.py        # your code
  ├─ page.file     # cached embeddings + FAISS index + manifest
  └─ docs/         # source PDFs
       ├─ doc1.pdf
       ├─ doc2.pdf
       └─ ...
```

* `docs/` holds raw PDFs.
* `page.file` is a serialized cache: FAISS index + embeddings + chunks + manifest.
* `rag.py` loads from cache if it exists; otherwise builds index fresh and saves.

## Minimal RAG workflow (with caching + updates)

### 1) Config

Paths live in variables for clarity.

```python
import os, io, hashlib, pickle, faiss, numpy as np
from sentence_transformers import SentenceTransformer

PDF_DIR = "docs"
PAGE_FILE = "page.file"
CHUNK_WORDS = 180       # ≈ short paragraph (150–220 works well)
TOPK = 6                # sensible default (5–8)

model = SentenceTransformer("all-MiniLM-L6-v2")
```

### 2) Ingest & chunk

```python
from pathlib import Path
from PyPDF2 import PdfReader

def file_sig(path):
    p=Path(path); h=hashlib.md5()
    h.update(str(p.stat().st_mtime_ns).encode()); h.update(str(p.stat().st_size).encode())
    return h.hexdigest()

def load_texts_with_meta(pdf_path):  # -> list[(text, meta)] where meta has doc/page
    out=[]; p=Path(pdf_path)
    try:
        reader = PdfReader(str(p))
        for i, pg in enumerate(reader.pages, start=1):
            t = pg.extract_text() or ""
            if t.strip():
                out.append((t, {"doc": p.name, "page": i}))
    except Exception as e:
        print(f"warn: failed to read {p}: {e}")
    return out

def chunk_text(text, n=CHUNK_WORDS):
    w=text.split(); return [" ".join(w[i:i+n]) for i in range(0,len(w),n)]

def build_chunks(pdf_dir):
    chunks, metas = [], []
    for pdf in Path(pdf_dir).glob("*.pdf"):
        for t, meta in load_texts_with_meta(pdf):
            cs = chunk_text(t)
            chunks.extend(cs)
            metas.extend([{**meta, "chunk": j+1} for j in range(len(cs))])
    return chunks, metas
```

### 3) Distance & embedding note (why synonyms cluster)

Embeddings place **synonyms and related phrases close together** in a high-dimensional
space (e.g., *car* ≈ *automobile*).
We use **squared Euclidean distance** to measure closeness between vectors:

$$
D(q, x) = \sum_{i=1}^{d} (q_i - x_i)^2
$$

No square root needed (ranking is unchanged), so it’s faster.

### 4) Build / load / update the page file

```python
def encode(arr):
    return np.asarray(model.encode(arr, convert_to_numpy=True), dtype="float32")

def build_index(chunks):
    X = encode(chunks)
    ix = faiss.IndexFlatL2(X.shape[1])  # squared L2 distance
    ix.add(X)
    return ix, X

def save_pagefile(ix, X, chunks, metas, manifest, path=PAGE_FILE):
    with open(path, "wb") as f:
        pickle.dump({"ix": ix, "X": X, "chunks": chunks, "metas": metas,
                     "manifest": manifest}, f)

def load_pagefile(path=PAGE_FILE):
    with open(path, "rb") as f: return pickle.load(f)

# Build fresh (first run)

def build_pagefile(pdf_dir=PDF_DIR, path=PAGE_FILE):
    chunks, metas = build_chunks(pdf_dir)
    ix, X = build_index(chunks)
    manifest = {str(p): file_sig(p) for p in Path(pdf_dir).glob("*.pdf")}
    save_pagefile(ix, X, chunks, metas, manifest, path)
    return ix, X, chunks, metas, manifest

# Update (incremental add/modify). If deletions detected → rebuild for simplicity.

def update_pagefile(pdf_dir=PDF_DIR, path=PAGE_FILE):
    if not os.path.exists(path):
        return build_pagefile(pdf_dir, path)
    pf = load_pagefile(path)
    old_manifest = pf["manifest"]
    current = {str(p): file_sig(p) for p in Path(pdf_dir).glob("*.pdf")}

    deleted = set(old_manifest) - set(current)
    added_or_changed = [p for p,s in current.items() if old_manifest.get(p) != s]

    if deleted:
        # IndexFlatL2 lacks easy deletions; simplest: full rebuild to stay correct.
        return build_pagefile(pdf_dir, path)

    if not added_or_changed:
        return pf["ix"], pf["X"], pf["chunks"], pf["metas"], current

    # Append new/changed content
    new_chunks, new_metas = [], []
    for p in added_or_changed:
        for t, meta in load_texts_with_meta(p):
            cs = chunk_text(t)
            new_chunks.extend(cs)
            new_metas.extend([{**meta, "chunk": j+1} for j in range(len(cs))])

    if new_chunks:
        X_new = encode(new_chunks)
        pf["ix"].add(X_new)
        pf["X"] = np.vstack([pf["X"], X_new])
        pf["chunks"].extend(new_chunks)
        pf["metas"].extend(new_metas)

    pf["manifest"] = current
    save_pagefile(pf["ix"], pf["X"], pf["chunks"], pf["metas"], pf["manifest"], path)
    return pf["ix"], pf["X"], pf["chunks"], pf["metas"], pf["manifest"]
```

### 5) Query RAG (page-in working set)

```python
import openai

def query_rag(query, index, chunks, k=TOPK):
    qvec = encode([query])
    D, I = index.search(qvec, k)           # D: squared distances, I: indices
    retrieved = [chunks[i] for i in I[0]]
    context = "\n\n".join(retrieved)
    prompt = f"Answer based on context:\n{context}\n\nQuestion: {query}\nAnswer:"
    resp = openai.ChatCompletion.create(
        model="gpt-4",  # or gpt-5 if exposed
        messages=[{"role":"user","content":prompt}]
    )
    return resp.choices[0].message["content"], list(zip(D[0].tolist(), I[0].tolist()))
```

### 6) Helper: print a Semantic Page Table (auditability)

```python
def show_page_table(chunks, metas, scores):
    print("# Semantic Page Table (top-k)")
    for r,(d, idx) in enumerate(scores, 1):
        m = metas[idx]
        snip = chunks[idx][:80].replace('\n',' ')
        print(f"{r:>2}. idx={idx:>6}  L2^2={d:.4f}  {m['doc']}#p{m['page']}  '{snip}'")
```

### 7) Main entrypoints

```python
def ensure_pagefile():
    return update_pagefile(PDF_DIR, PAGE_FILE)

if __name__ == "__main__":
    ix,X,chunks,metas,manifest = ensure_pagefile()
    ans, scores = query_rag("What is COCOMO?", ix, chunks, k=TOPK)
    show_page_table(chunks, metas, scores)
    print("\n---\n", ans)
```

## Why this works (paging metaphor)

* **Context window = RAM** → tiny; must be curated.
* **Chunks = pages** → small, swappable units.
* **Retriever = pager** → brings in the working set.
* **Embedding space = virtual address space** → synonyms & related concepts cluster.
* **Squared L2** gives a simple, fast closeness measure.
* **`page.file` = swap** → cache of precomputed embeddings + index + manifest.
* If answers wobble, suspect **thrash**: poor chunks paged in; fix retrieval first
  (better chunking, adjust `k`, add metadata filters).

## Sensible defaults (so you ship)

* Chunk size: **150–220 words** per chunk.
* Retrieval: **k = 5–8**.
* Index: start with **`IndexFlatL2`**; switch to ANN only at larger scales.
* Cache: keep **`page.file`** under version control *ignore* (e.g., add to `.gitignore`).
* Audit: always print a **Semantic Page Table** when debugging.

## How to update the page file

* **New/modified PDFs**: `update_pagefile()` encodes just new chunks and **appends**
  to the index.
* **Deleted PDFs**: simple path is **full rebuild** (IndexFlatL2 can’t easily delete).
* Want true deletions without rebuild? Use **`faiss.IndexIDMap2`** and manage IDs;
  otherwise keep it simple and rebuild when files are removed.

## Runtime expectations (ballpark for 100 PDFs × 100 pages ≈ 10,000 pages)

Assumptions: avg 300 words/page, `CHUNK_WORDS = 180` → \~1.6–1.8 chunks/page
≈ **16,000–18,000 chunks**.

* **PDF text extraction** (PyPDF2): I/O bound, content-dependent

  * Typical laptop CPU: **10–30 minutes** for 10k pages.
* **Embedding** (`all-MiniLM-L6-v2`)

  * CPU (batched): roughly **30–150 chunks/sec** → **2–10 minutes** for \~18k chunks
    on high-end; **10–30 minutes** on modest laptops.
  * GPU (consumer): **1,000–5,000 chunks/sec** → **\~4–18 minutes** becomes **\~4–60 s**
    for 18k chunks depending on VRAM/batch size. (Big variance; batch wisely.)
* **Index add (FAISS FlatL2)**: fast; **seconds** for 18k vectors.
* **Incremental update** (few new PDFs): minutes proportional to new chunks only.

Tip: measure on 1–2 PDFs first, then extrapolate. Enable batching (`encode` already
batches internally); larger batches help GPU most.
