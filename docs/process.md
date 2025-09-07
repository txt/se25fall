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







# Lecture: Process, Version Control, and Strange Survivals


## Section 1: Waterfall vs Agile (15 minutes)

### Two Extremes of Process

Waterfall and Agile are often seen as opposites.  
One emphasizes *planning and control*, the other *adaptation and feedback*.  

![image](https://github.com/txt/se23/assets/29195/52c259a7-f480-422e-8f0a-b0acb33cfc8f)

- **Waterfall**  
  - Linear sequence: requirements → analysis → design → code → test  
  - Feedback flows only backward one step at a time  
  - Strong fit for long, predictable projects  
  - Used in government, military, and large hardware–software contracts  
  - Benefits: efficiency, predictable costs, payment milestones  
  - Weaknesses: rigidity, costly pivots, analysis paralysis  

- **Agile (Scrum as Example)**  
  - Short cycles called *sprints* (weeks, not years)  
  - Teams review backlog, pick tasks of highest value, deliver fast  
  - Daily stand-ups with 3 questions: done, planned, blocked?  
  - Benefits: flexibility, early feedback, visible progress  
  - Weaknesses: risk of losing direction, messy architecture, budget creep  

![image](https://github.com/txt/se23/assets/29195/78ceea76-1e54-44fa-9cbd-b333870545b2)

### Discussion Prompt
- Ask: Which approach would you choose for a space mission?  
- Ask: Which for a student team building a prototype in one semester?  

---

## Section 2: Git Flow vs Commit to Main (10 minutes)

### Branching Choices

Version control also reflects choices about control vs speed.  

![image](https://user-images.githubusercontent.com/29195/130551409-89d30647-a72f-4321-b58f-f519c77235ce.png)

- **Git Flow**  
  - Each branch promises a feature, merged only after vetting  
  - Protects main branch from mistakes  
  - Fits slow-moving open-source projects with many contributors  
  - Benefits: trust but verify, clear history  
  - Weaknesses: pull request bottlenecks, slow iteration  

![image](https://user-images.githubusercontent.com/29195/130552057-1891deda-3328-43c7-8fab-c139cff3d1ff.png)

- **Commit to Main (Trunk-Based)**  
  - All work merges into main (or master) branch quickly  
  - Short-lived branches, automated testing to avoid breaking builds  
  - Used at Google, Facebook, Amazon  
  - Benefits: fast iteration, reduced merge hell  
  - Weaknesses: requires discipline, strong testing culture  

![image](https://user-images.githubusercontent.com/29195/130552454-aa8c1fc0-7927-4072-b31a-263677c5ca86.png)

### Discussion Prompt
- Ask: Which would you prefer if your team has 3 experts?  
- Ask: What if you have 30 interns?  

---

## Section 3: Strange but Sensible Process Decisions (10 minutes)

### When Bad Ideas Survive

Sometimes decisions that *look crazy* make sense in context.  

- **AgileFall**: Companies *say* agile, but *do* waterfall.  
  - Example: hardware–software projects need long cycles  
  - Hardware teams want stable targets, not shifting sprint goals  
  - So they mix agile rhetoric with waterfall practice  

- **Waterfall Payment Milestones**  
  - Accountants demand checkpoints before releasing funds  
  - Even if waterfall is rigid, staged sign-offs keep the cash flowing  

- **Paperwork Overload**  
  - Military and government often require thick documents  
  - Not because developers love paperwork, but because  
    it creates contracts, accountability, and traceability  

Key lesson: sometimes process is less about *engineering* and more  
about *politics, money, and risk management*.  

---

## Section 4: The Strange Survival of COBOL (10 minutes)

### COBOL: The Language That Refused to Die

- **Origins**  
  - Created in 1959 for business computing  
  - Designed for readability: “common business-oriented language”  

- **Current Reality**  
  - Still runs banks, airlines, government systems  
  - Billions of lines of COBOL in daily use  
  - Why not replace it?  
    - Stable, proven, deeply embedded  
    - Replacing would cost billions and risk failure  

- **Recruitment Crisis**  
  - Few universities teach COBOL today  
  - Skilled programmers are retiring  
  - Companies now train new hires or pay premiums  
  - Example: some firms offering six-figure salaries  
    for developers willing to work in COBOL  

### Why It Makes Sense
- COBOL is boring but reliable  
- Mission-critical systems need stability over novelty  
- The cost of change outweighs the benefits  

---

## Wrap-Up and Reflection (5 minutes)

- Waterfall vs Agile shows the tension between control and flexibility  
- Git Flow vs Main shows trade-offs in collaboration speed and safety  
- Strange processes may survive because of money, contracts, or risk  
- COBOL teaches us that legacy decisions can outlive expectations  

**Final Question for Students:**  
- Which "crazy" process decisions of today might still be with us in 50 years?

