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

  
 <div align=center>

# Review Questions – SBSE

## 1. SBSE Foundations
1.1) Define Search-Based Software Engineering (SBSE).  
1.2) Explain why many SE problems are considered NP-hard and how SBSE reframes them as optimization problems.  
1.3) Contrast SBSE with brute-force search in terms of feasibility and scalability.  
1.4) Give an example of a software engineering decision (e.g., test prioritization, release planning) and explain how SBSE could improve it.  

---

## 2. SBSE Recipe
2.1) Define the three “ingredients” of SBSE: representation, objectives, and search strategy.  
2.2) Explain when multi-objective optimization is preferable to single-objective search.  

---

## 3. Lifecycle Applications
3.1) List three phases of the software lifecycle where SBSE can be applied.  
3.2) Give examples of SBSE applications in testing (e.g., prioritization) and maintenance (e.g., refactoring).  
3.3) Evaluate the trade-offs of using SBSE in operations (e.g., performance tuning) where the costs of experiments are high.  
3.4) Explain how multi-objective search helps in balancing **cost**, **value**, and **risk** in project planning.  

---

## 4. Research Challenges
4.1) Compare human interpretability in SBSE results vs. raw statistical metrics.  
4.2) Discuss the trade-off between optimization accuracy and explanation clarity.  Why does it matter in SBSE?
  
---

## 5. Decision-Making with Data (SBSE in Practice)

Below is a simplified dataset from a fictional **test suite prioritization problem**.  
The goal is to decide which tests to run first in a CI/CD pipeline, under the constraint  
that **only 3 tests can be executed before release** (due to time limits).

| Test ID | Execution Time (sec) | Fault Detection Probability (0–1) | Code Coverage (%) |
|---------|-----------------------|-----------------------------------|-------------------|
| T1      | 12                    | 0.75                              | 40                |
| T2      | 8                     | 0.50                              | 25                |
| T3      | 15                    | 0.90                              | 55                |
| T4      | 6                     | 0.30                              | 20                |
| T5      | 10                    | 0.80                              | 35                |

### Questions

**5.1)** Define what it means to “prioritize” test cases in a CI/CD environment.  
(*Connects to Week 4 Process questions about CI/CD pipelines.*)

**5.2)** Contrast this dataset-based optimization problem with the **pipe-filter** pattern (Week 4) and explain how SBSE extends beyond simple deterministic flows.  

**5.3)** Using the dataset, compare two prioritization strategies:  
- (a) Maximize total **fault detection probability**  
- (b) Maximize **coverage per unit time**  

Select the **3 tests** under each strategy and show your reasoning.  

**5.4)** Evaluate which strategy would be more beneficial in a *safety-critical system* versus a *consumer web application*.  
(*Connects to earlier evaluation-style questions, like Agile vs. Waterfall trade-offs.*)

**5.5)** Critique whether the metrics in this dataset (execution time, probability, coverage) are sufficient for **real-world test prioritization**.  
What additional objectives might you add? (e.g., criticality of features, defect severity)  
(*Connects to non-functional requirements from Week 3.*)

**5.6)** Create a narrative-style explanation for a manager who is *not technical*:  
- Which tests would you recommend running first?  
- Why should they trust the recommendation?  
(*Connects to the SBSE lecture’s emphasis on “actionable narratives.”*)

---
## 6. Labeling Cost Challenge

In SBSE research and practice, **labeling cost** refers to the expense of evaluating candidate solutions —  
This could mean running long test suites, conducting performance experiments, or even requiring human judgment.  
When evaluation is costly, we cannot label every candidate, so we must **choose wisely**.

### Example Dataset: Performance Tuning

You are tuning the configuration of a web server. Each candidate configuration has 3 parameters (threads, cache size, compression). Running the server with a configuration and measuring its throughput/latency takes **1 hour per run** — so you can only afford **2 runs** this week. (higher Throughput and lower latency are favored)

| Config ID | Threads  |Cache Size | Compression | Throughput (req/s) | Latency (ms) |
|-----------|----------|-----------|-------------|--------------------|-------------------------|
| C1        | 2        | 128       | on          | 950                | 220                     |
| C2        | 16       | 128       | on          | 1000               | 250                     |
| C3        | 4        | 512       | off         | 1200               | 100                     |
| C4        | 12       | 128       | off         | 1000               | 140                     |
| C5        | 8        | 512       | on          | 1250               | 200                     |

Looking back to previous systems and other companies' experiences, you have access to the above dataset. Now, based on the restrictions of your system, you can choose two of the following configurations that you think may perform well and test them on your system to find the best one.

| Config ID | Threads  | Cache Size | Compression | Throughput (req/s) | Latency (ms) |
|-----------|----------|-----------|-------------|--------------------|-------------------------|
| P1        | 8        | 128       | on          | ?                  | ?                       |
| P2        | 16       | 64        | on          | ?                  | ?                       |
| P3        | 4        | 256       | on          | ?                  | ?                       |
| P4        | 12       | 64        | off         | ?                  | ?                       |
| P5        | 20       | 512       | off         | ?                  | ?                       |
| P6        | 12       | 128       | off         | ?                  | ?                       |
| P7        | 10       | 256       | off         | ?                  | ?                       |

---

### Questions

**6.1)** Define the "labeling cost" in this example and explain why it matters.  

**6.2)** Which three configurations would you choose? Explain why.



