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





# Review  67


1. **Abstraction in SE**

   * (a) Define *abstraction* in software engineering.
   * (b) Explain how abstraction appears in Unix pipes, OO design, and error handlers.
   * (c) Compare abstraction at the system level (e.g., containers) vs. programming level (e.g., iterators). What is the same? different?

2. **Parnas’ Principles**

   * (a) State Parnas’ principles of modular decomposition.
   * (b) Show how pipes implement encapsulation and loose coupling.
   * (c) Critique a modern AI tool (that extacts all user information, all of which might be used by the predictive modeling team)
         against Parnas’ principles.

3. **Error Handling**

   * (a) Define *exception* and *error handler*.
   * (b) For a distributed file system, where failures are common, describe five common errors and their repair action.
         

4. **OO and Information Hiding**

   * (a) What is encapsulation in OO design?
   * (b) Explain how UML class diagrams represent information hiding.
   * (c) Given a payment system with design an OO decomposition that minimizes ripple effects
         (think 2 to 5 classes, and someone loging on to pay their amazon bill).

5. **System Abstractions**

   * (a) Name three large-scale system abstractions (e.g., OS, VMs, serverless).
   * (b) Contrast virtual machines with containers in terms of abstraction boundaries.
   * (c) Argue whether “serverless” hides too much information to be safely maintainable.

6. **Lessons from Parnas**

* (a) What does “minimizing ripple effects” mean?
* (b) Apply this concept to pipelines (readingCode → errorChecking → prettyPrinting).
* (c) Debate: is modeling today more about diagrams or code itself (e.g., frameworks, APIs)?
