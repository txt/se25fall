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



<hr>
 
# Study Guide: LLMs in Software Engineering

##   Glossary

### LLM Concepts & Capabilities
- Models (list 3 common ones)
- Core Functionality (what is..._
  - Context Window
  - Tokenization 
  - Embeddings

### Prompt Engineering
- Prompt Crafting 
  - Meta-Prompting
  - Few-Shot Prompting
  - Chain-of-Thought Prompting
- Response Quality
  - Hallucination
  - Structured Output (why? can you name at lease one format?)
  - Granularity (hint: forest vs trees, architecture vs engineering)

### Software Engineering Integration
- Standard model
  - Planning Phase
  - Coding Phase
  - Testing Phase
  - Requirements Engineering 
- Traceability (what? why?)
- Functional Requirements (define, give examples)
- Non-Functional Requirements (define, give examples)

## Review Questions

### Question 1: Prompt Engineering
a) Define "few-shot prompting" as discussed in the materials.
b) Explain why few-shot prompting leads to more granular and accurate 
responses compared to zero-shot prompting.
c) When booking an airline ticket, discuss how chain-of-thought prompting might be 
more effective than few-shot prompting and justify your choice.

### Question 2: LLM Limitations
a) List two areas where LLMs consistently underperform according to the
lecture.
c) Critique the statement: "LLMs can replace human expertise in 
specialized disciplinary writing." Support your critique with examples 
from the materials.

### Question 3: Software Development Integration
a) Name the three phases of the "Standard Model" of software 
engineering.
b) Compare the benefits of using LLMs in the planning phase versus the 
testing phase.
c) Design a workflow that integrates two different LLMs to address both 
planning and testing challenges simultaneously.

### Question 4: Data Processing
a) Identify two key reasons for pre-processing data before sending it to
an LLM.
b) Apply the concept of pre-processing to a scenario involving natural 
language requirement documents.
c) Evaluate the trade-offs between using batch API processing versus 
real-time API calls for large-scale data analysis.

### Question 5: Technical Architecture
a) Define what a RAG (Retrieval Augmented Generation) system does.
b) Explain how vector databases enable more effective querying of 
complex documentation.
c) Propose a RAG-based solution for managing hundreds of pages of 
technical and legal documentation for a food delivery system.

(Aside: we did not actually answer this in class. So...

- A **RAG** (Retrieval Augmented Generation) system retrieves relevant information from a knowledge base and provides it to a large language model to generate a contextually accurate, sourced response.
- **Vector databases** enable more effective querying by converting text into numerical representations (embeddings) and storing them. Queries are also converted into vectors, and the database performs a similarity search to find the most semantically relevant text chunks, rather than relying solely on keyword matching.
- A RAG-based solution for the food delivery system documentation would involve the following steps:
  - **Pre-processing** & **Embedding**: Chunk the hundreds of pages of technical manuals and legal terms into manageable segments. Convert each segment into a vector embedding      using a model like OpenAI's text-embedding-ada-002.
  - **Vector Database Population**: Store all generated embeddings and their corresponding text chunks in a vector database (e.g., ChromaDB, Pinecone). This creates a
    searchable knowledge base.
  - **Query Interface**: Build an interface where a user can ask a question (e.g., "What are the liability clauses for spoiled food?").
  - **Retrieval & Generation**: The system queries the vector database to find the most relevant chunks of text from the documentation based on semantic similarity. These
    chunks are then fed as context into an LLM (e.g., GPT-4), which synthesizes the retrieved information to generate a precise, well-sourced answer, citing the relevant
    documentation. This ensures responses are grounded in fact and reduces hallucination.)

### Question 6: Requirements Engineering
a) Define "traceability" in the context of software requirements and 
testing.
b) Explain how LLMs could assist in establishing traceability between 
requirements and test cases.
c) Critique the potential risks of using LLMs for automated 
classification of functional versus non-functional requirements.

### Question 7: Project Scaling
a) Define "batch API processing" and its primary advantage.
b) Explain why batch processing is particularly valuable for research 
projects involving large text corpora.
c) Design a cost-effective processing pipeline for a project that must 
analyze 40,000+ lines of JSON data weekly.

(Aside: we did not actually answer this in class. So...

- **Batch API processing** is a method of sending multiple requests in a
single operation to an API. Its primary advantage is significantly
reduced cost and increased efficiency.
  - Batch processing is valuable for large-text research because it is
    far cheaper than individual API calls and enables practical, automated
    analysis of thousands of data segments that would be infeasible to
    process manually or sequentially.

- **Cost-Effective Weekly Pipeline:**
  1.  **Pre-processing:** Script chunks weekly JSON data into optimized
      segments for LLM context.
  2.  **Batch Creation:** Automatically generate a JSONL file with prompts
      and data chunks.
  3.  **API Processing:** Submit the entire batch to an asynchronous,
      low-cost API (e.g., OpenAI Batch API).
  4.  **Storage:** Retrieve results and append to a cloud-based database
      or weekly Parquet files.
  5.  **Automation:** Orchestrate with a weekly cron job or scheduler for
      minimal manual effort. This design minimizes operational cost and
      overhead.)

### Question 8: Ethical Considerations
a) List two ethical concerns mentioned or implied in the materials 
regarding LLM use.
b) Analyze why humanities faculty might be particularly concerned about 
incorporating LLMs into their research.
c) Develop a set of guidelines for responsible LLM use in academic 
software engineering projects.

(Aside: we did not actually answer this in class. So...

- Two ethical concerns regarding LLM use are:
  1.  **Hallucination & Inaccuracy:** Models "always give you a damn answer"
      even when incorrect, posing a risk for generating authoritative-
      sounding but false information.
  2.  **Replacement of Human Expertise:** The concern that over-reliance
      could devalue specialized disciplinary knowledge and critical
      thinking.
- **Guidelines for Responsible LLM Use in Academic SE Projects:**
  1.  **Transparency:** Mandate clear documentation of all LLM use,
      specifying the model, prompt, and purpose for every task.
  2.  **Validation & Accountability:** All LLM-generated code, text, or
      designs must be  validated by a human expert who is
      ultimately accountable for the output.
  3.  **Bias & Ethical Review:** Projects must include a review for
      potential biases encoded in model outputs and adhere to ethical
      research standards.
  4.  **Cost Management:** Establish and monitor a project budget for API
      costs to prevent unexpected financial burdens.
  5.  **Knowledge Preservation:** Ensure LLMs augment rather than replace
      the development of foundational engineering skills and critical
      problem-solving abilities.)
