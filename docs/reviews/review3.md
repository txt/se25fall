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



# Review 3 : Requirements Engineering and RAG

## RE Glossary
- Stakeholder types
  - Users
  - Clients/Sponsors
  - Domain Experts
  - Developers/Engineers
  - Regulators/Legal
  - Indirect/Negative
- Power–Interest Grid
- Functional Requirements (give examples)
- Non-Functional Requirements (can you define...)
  - Availability
  - Compliance
  - Interoperability
  - Maintainability
  - Performance
  - Portability
  - Reliability
  - Scalability
  - Security
  - Usability
  - Traceability
- Waterfall (why is a "Plan-Driven" Model?)
- Agile (why is a "Feedback" model)
- Scrum
  - **Scrum**: An agile framework using short, iterative cycles with defined  
    roles (Product Owner, Scrum Master, Development Team) and frequent  
    feedback to refine requirements.  
  - **Sprint**: A fixed-length development loop (often 1–4 weeks) where a  
    subset of backlog items is selected, implemented, and reviewed for  
    incremental delivery.  
  - **Backlog**: A prioritized list of features, fixes, or tasks expressed as  
    user stories, maintained by the Product Owner, from which sprint work  
    is chosen. 
- CRC Cards
  - **CRC Cards**: Index cards used in design sessions, each representing a  
    class with its **Responsibilities** (what it does) and **Collaborators**  
    (who it interacts with).  
  - Lightweight, handwritten, and often torn up/revised during sessions to  
    encourage exploration and discard bad designs quickly.  
  - Support brainstorming by having participants "act out" object behavior,  
    revealing responsibilities, collaborations, and design flaws early.   

## RE Review Questions
1. Define "stakeholders" and list two types. Explain how power–interest 
   affects how you would engage different groups in a project.
2. Define "functional requirement." Using the airline example, explain a 
   positive and a negative interaction between requirements.
3. Define "non-functional requirement." Discuss why maintainability and 
   reliability are harder to test than functionality.
4. Define "traceability." Design a simple traceability chain linking a 
   requirement, a test, and a stakeholder.
5. Define "waterfall model." Contrast it with agile in terms of feedback 
   and adaptation during requirements engineering.
6. Define "CRC card." Outline how a CRC card session might expose hidden 
   design issues in a bar or airline system.
7. Define "repertory grid." Write out how the triadic method helps elicit 
   new bipolar constructs from stakeholders.


 
## RAG Glossary
- Context Window
- Preprocessing
  - Page File (what does it store?)
  - Chunks (From where? how long?)
  - Embeddings (mention "synonymn space")
  - Sentence Transformer (connection chunks and embeddings?)
- L2 Distance
- Query (how does Query use the preprocessing results?)
- Hyperparameters (what config params effects the  above? what are best config for some new domain?)

## RAG Review Questions
8. Define "context window." Explain how the OS analogy of RAM and disk 
   clarifies how RAG selects information.
9. Define "embedding." Using the lecture analogy, explain how words like 
   "king" and "queen" are brought closer in vector space.
10. Define "chunk." Discuss trade-offs in choosing chunk size and number 
    of retrieved items when building a RAG system.
 
