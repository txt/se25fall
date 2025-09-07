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
  - Benefits: efficiency, predictable costs, payment milestones  
  - Weaknesses: rigidity, costly pivots, analysis paralysis  

- **Agile (Scrum as Example)**  
  - Short cycles called *sprints* (weeks, not years)  
  - Teams review backlog, pick tasks of highest value, deliver fast  
  - Daily stand-ups with 3 questions: done, planned, blocked?  
  - Benefits: flexibility, early feedback, visible progress  
  - Weaknesses: risk of losing direction, messy architecture, budget creep  

**When to pick**  
- Waterfall: big gov/military contracts; well-defined requirements; staged payments.  
- Agile: small trusted teams; evolving requirements; when feedback can change goals.  

**Warning signs**  
- Waterfall failing: mid-project pivots require re-engineering; late test shows major flaws.  
- Agile failing: endless churn, architecture collapsing under too many fast changes.  

![image](https://github.com/txt/se23/assets/29195/78ceea76-1e54-44fa-9cbd-b333870545b2)


## Section 2: Release Cycles (10 minutes)

### Short vs Long

Release cadence is another process trade-off.  

- **Short release cycles**  
  - Frequent updates, quick feedback, agile alignment  
  - Customers see progress often  
  - Danger: rushed code, tech debt, breaking APIs  

- **Long release cycles**  
  - Years between major versions  
  - Big integrated features, careful planning  
  - Danger: late feedback, buggy “big bang” releases, market drift  

**When to pick**  
- Short: when requirements evolve, users want frequent updates.  
- Long: when requirements are fixed, or system is safety-critical.  
- Mixed: frequent internal releases, slower external milestones.  

**Warning signs**  
- Short failing: debt piles up, no refactoring time, brittle design.  
- Long failing: feedback arrives too late, giant buggy releases, users lose interest.  

**Adaptation for safety-critical**  
- Use careful release branches, strong pre-commit hooks, broad test environments.  
- Canary/training releases for new devs.  
- Slow external releases to minimize risk.  


## Section 3: Git Flow vs Commit to Main (10 minutes)

### Branching Choices

Version control also reflects choices about control vs speed.  

![image](https://user-images.githubusercontent.com/29195/130551409-89d30647-a72f-4321-b58f-f519c77235ce.png)

- **Git Flow**  
  - Each branch promises a feature, merged only after vetting  
  - Protects main branch from mistakes  
  - Benefits: trust but verify, clear history  
  - Weaknesses: bottlenecks, slow iteration  

- **Commit to Main (Trunk-Based)**  
  - All work merges quickly into main branch  
  - Automated testing guards stability  
  - Benefits: fast iteration, reduced merge hell  
  - Weaknesses: requires strong discipline + test culture  

**When to pick**  
- Git Flow: large open-source projects, many contributors.  
- Main: fast-moving companies with strong testing pipelines.  

**Warning signs**  
- Git Flow failing: stalled pull requests, slow progress.  
- Main failing: flaky builds, unstable releases.  

---

## Section 4: Team Boundaries (5 minutes)

### Zero-Internal vs Specialized Teams

- **Zero-internal boundaries**  
  - Everyone uses same tools, can modify any code  
  - Great for open projects, shared responsibility  
  - Danger: confusion if tools/configs aren’t consistently available  

- **Specialized teams**  
  - Deep experts on small subsystems  
  - Efficient when teams don’t need to cross boundaries  
  - Danger: devs blocked fixing other parts just to make their own work  

**When to pick**  
- Zero-boundaries: public/open projects, shared tools, flexible contributors.  
- Specialized: when super-specialists exist, and interfaces are stable.  

**Warning signs**  
- Zero-boundaries failing: tools missing, config chaos, cross-team frustration.  
- Specialized failing: progress stalls because of cross-dependencies.  


## Section 5: Strange but Sensible Process Decisions (10 minutes)

### When Bad Ideas Survive

- **AgileFall**: companies *say* agile, but *do* waterfall.  
- **Payment milestones**: accountants demand staged sign-offs.  
- **Paperwork overload**: contracts, accountability, not engineering love.  

Lesson: process often follows politics, money, and risk.  


## Section 6: The Strange Survival of COBOL (10 minutes)

### COBOL: The Language That Refused to Die

- **Origins**: created 1959, for business, readable English-like syntax.  
- **Now**: still runs banks, airlines, government; billions of lines in use.  
- **Why not replace**: stable, proven, replacement too costly and risky.  
- **Recruitment crisis**: old devs retiring; firms pay premiums for COBOL skills.  

Why it makes sense: boring but reliable; cost of change outweighs novelty.  


## Wrap-Up and Reflection (5 minutes)

- Waterfall vs Agile → control vs flexibility  
- Release cycles → speed vs stability  
- Git Flow vs Main → collaboration safety vs iteration speed  
- Boundaries → generalist openness vs specialist efficiency  
- Strange processes survive for money, politics, risk  
- COBOL shows legacy tech can outlast trends  

**Final Question for Students:**  
- Which "crazy" process decisions of today might still be with us in 50 years?

