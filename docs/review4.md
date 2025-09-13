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


# Review4 : Process, COBOL, Architecture

## Process Glossary
- Waterfall Model  
- Agile / Scrum  
- Release Cycles (short vs long)  
- Git Flow Branching  
- Trunk-Based Development  
- Team Boundaries (zero-internal vs specialized)  
- Process–Product–Personnel Triangle  
- Contractors vs In-House Staff  
- Analysis Paralysis  
- Continuous Integration / Continuous Deployment  

## Process Review Questions
1. (a) Define the Waterfall model.  
   (b) Contrast its planning style with Agile’s iteration.  
   (c) Evaluate where Waterfall is still superior in modern SE.  
2. (a) Define Agile.  
   (b) Explain how feedback cycles reduce risk.  
   (c) Critique Agile in large distributed teams.  
3. (a) Define a release cycle.  
   (b) Compare advantages of short vs long cycles.  
   (c) Recommend a cycle strategy for safety-critical avionics.  
4. (a) Define Git Flow.  
   (b) Explain how branching delays integration.  
   (c) Judge if Git Flow fits a high-velocity startup.  
5. (a) Define trunk-based development.  
   (b) Compare test suite needs in trunk vs Git Flow.  
   (c) Evaluate its sustainability in a 200-person project.  
6. (a) Define team boundaries.  
   (b) Analyze trade-offs of zero-internal vs specialized.  
   (c) Propose a boundary model for a multinational bank team.  
7. (a) Define the process–product–personnel triangle.  
   (b) Explain how imbalance causes failures.  
   (c) Critique which corner is hardest to control in SE.  
8. (a) Define contractor use in projects.  
   (b) Analyze benefits and risks for mission-critical work.  
   (c) Argue when contractors are justified despite risks.  
9. (a) Define analysis paralysis.  
   (b) Explain how it undermines requirements gathering.  
   (c) Recommend prevention methods in graduate projects.  
10. (a) Define CI/CD.  
    (b) Explain how post-commit hooks enforce process.  
    (c) Judge when automation harms rather than helps.  


## Architecture Glossary
- Layered Architecture  
- Event-Driven Architecture  
- Microkernel  
- Microservices  
- Pipe-Filter  
- Client–Server  
- Service Mesh  
- Encapsulation / Information Hiding  

## Architecture Review Questions
1. (a) Define layered architecture.  
   (b) Explain how it isolates database from UI.  
   (c) Evaluate risks of excessive layering.  
2. (a) Define event-driven systems.  
   (b) Analyze benefits for IoT.  
   (c) Propose debugging strategies for nondeterminism.  
3. (a) Define a microkernel.  
   (b) Compare with monolithic kernels.  
   (c) Recommend use cases in modern SE.  
4. (a) Define microservices.  
   (b) Explain their impact on deployment.  
   (c) Critique them in terms of latency.  
5. (a) Define pipe-filter.  
   (b) Give a text processing example.  
   (c) Argue its pros/cons for streaming analytics.  
6. (a) Define client–server model.  
   (b) Explain how it evolved to cloud.  
   (c) Evaluate limits for mobile-first systems.  
7. (a) Define encapsulation.  
   (b) Compare with information hiding.  
   (c) Evaluate when strict hiding hinders debugging.  

## COBOL Glossary
- Readability over Brevity  
- Portability (500+ platforms)  
- Recruitment Crisis (aging workforce)  
- Salary Premiums  
- Legacy System Maintenance  
- Replacement Failures (CBA, TSB)  
- Government IT Spend  
- Y2K and Maintenance Lessons  
- COVID-19 Unemployment Crisis  
- Core Banking Dependence  

## COBOL Review Questions
1. (a) Define COBOL’s design goal of readability.  
   (b) Explain how it shaped long-term adoption.  
   (c) Evaluate readability’s costs for modern dev teams.  
2. (a) Define portability in COBOL.  
   (b) Explain how 500+ platforms enabled survival.  
   (c) Critique whether portability outweighs technical debt.  
3. (a) Define the recruitment crisis.  
   (b) Analyze risks for financial institutions.  
   (c) Evaluate solutions: retraining vs migration.  
4. (a) Define COBOL’s role in core banking.  
    (b) Explain transaction percentages it supports.  
    (c) Judge whether banking can abandon COBOL.  

