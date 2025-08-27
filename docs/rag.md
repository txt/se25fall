 # RAG as Virtual Memory: "Semantic Paging" for LLMs

Think OS paging: RAM is tiny, disk is huge, so the OS **pages in** just the working
set. RAG does the same: the LLM’s context is tiny, your PDF corpus is huge, so we
**page in** only the most relevant text chunks.

---

## Minimal RAG: tiny but serviceable

> We (1) chunk PDFs → (2) embed + index → (3) page-in top-k chunks → (4) generate.

### 1) Ingest & chunk

Small, fixed-size word chunks = “pages.” Fewer knobs, fewer bugs.

```python
from pathlib import Path
from PyPDF2 import PdfReader

def load_texts(pdf_dir):  # -> list[str]
    out=[]
    for p in Path(pdf_dir).glob("*.pdf"):
        for pg in PdfReader(str(p)).pages:
            t=pg.extract_text() or ""
            if t.strip(): out.append(t)
    return out

def chunk(texts, n=180):  # words per chunk ≈ a short paragraph
    C=[]
    for t in texts:
        w=t.split()
        for i in range(0,len(w),n): C.append(" ".join(w[i:i+n]))
    return C
```

### 2) Embed & index (“build the page file”)

Embeddings place **synonyms and related phrases close together** in a high‑dimensional
space. Example: *“car”* and *“automobile”* → nearby vectors.

We use squared Euclidean distance:

$$
D(q, x) = \sum_{i=1}^{d} (q_i - x_i)^2
$$

No square root needed, since ranking is the same.

```python
import numpy as np, faiss
from sentence_transformers import SentenceTransformer

model=SentenceTransformer("all-MiniLM-L6-v2")

def build_index(chunks):
    X=np.asarray(model.encode(chunks, convert_to_numpy=True), dtype="float32")
    ix=faiss.IndexFlatL2(X.shape[1])        # squared L2 distance
    ix.add(X)
    return ix, X
```

### 3) Retrieval (“page in” the working set)

Top‑k neighbors = your semantic working set. Each hit comes with its distance.

```python
def retrieve(ix, X, chunks, query, k=5):
    q=np.asarray(model.encode([query], convert_to_numpy=True), dtype="float32")
    D,I=ix.search(q, k)                     # D: squared distances, I: indices
    return [(chunks[i], float(D[0][j]), int(i)) for j,i in enumerate(I[0])]
```

### 4) Generate (or just show the “paged” context)

Plug retrieved chunks into your LLM. Stubbed here for clarity.

```python
def synthesize(query, hits):
    ctx="\n\n".join(t for t,_,_ in hits)
    return f"Q: {query}\n\n{ctx[:1500]}..." # demo: clipped context
```

 

## Glue it together (with a “semantic page table”)

```python
def ask(pdf_dir, query, k=5):
    C=chunk(load_texts(pdf_dir))
    ix,X=build_index(C)
    hits=retrieve(ix,X,C,query,k)
    print("# Semantic Page Table (top-k)")
    for rank,(txt,dist,idx) in enumerate(hits,1):
        print(f"{rank:>2}. idx={idx:>6}  L2^2={dist:.4f}  snippet={txt[:80]!r}")
    return synthesize(query,hits)
```

 

## Why this works (paging metaphor)

* **Context window = RAM** → tiny; must be curated.
* **Chunks = pages** → small, swappable units.
* **Retriever = pager** → brings in the working set.
* **Embedding space = virtual address space** → synonyms and related concepts are
  close together.
* **Squared L2 distance** measures closeness: small $D(q, x)$ = high similarity.
* **Ranking = replacement policy** → keeps the most useful k pages.

> If answers wobble, suspect **thrash**: poor chunks paged in. Fix retrieval before
> touching the generator (better chunking, better k, add metadata filters).

 

## Sensible defaults (so you ship)

* Chunk \~150–220 words; `k=5..8`.
* Keep a “page table” printout for auditability.
* Start with `IndexFlatL2`; upgrade to ANN only if scale truly demands it.
