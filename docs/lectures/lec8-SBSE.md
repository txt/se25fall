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



# Search-Based Software Engineering (SBSE)

  

## Why SBSE?

Software engineering involves many **hard decisions**:

- Which tests to run first?
- How to plan releases under constraints?
- What refactorings reduce technical debt with minimal risk?
- How to tune service configs for cost vs. performance?

These problems are often **NP-hard**, **multi-objective**, and **too large** for brute force.

**SBSE reframes them as optimization problems:**

1. **Representation (search space)**: candidate solutions.
2. **Fitness function(s)**: measurable objectives.
3. **Search strategy**: heuristic/metaheuristic algorithm to explore the space.

  
---

## SBSE Recipe (Three Ingredients)

- **Representation**: encoding of solutions

→ *test orders, refactoring sequences, story selections, parameter vectors*

- **Objectives**: what to optimize

→ *maximize test coverage, minimize runtime, reduce bug smells, balance risk/cost/performance*

- **Search Strategy**: how to explore

→ *Genetic Algorithms, Simulated Annealing, Particle Swarm, NSGA-II, Hyper-heuristics*




## Where SBSE Fits in the Lifecycle

- **Requirements/Planning** → Release planning, Effort estimation, Cost estimation
- **Design** → architecture optimization
- **Coding** → automated repair, code synthesis
- **Testing** → test generation, prioritization, selection
- **Maintenance** → refactoring & software debt reduction
- **Operations** → performance tuning, CI/CD optimization

**Examples**:
- Regression Test Prioritization (CI/CD)
- Refactoring for Maintainability (reduce technical debt, preserve behavior)
- Performance/Cost Tuning in Production

# Datasets and Industry Implications

In this section we introduce some real-world datasets from the [moot/optimize](https://github.com/timm/moot/tree/master/optimize) repository.  
These datasets allow researchers and practitioners to model and evaluate optimization problems in software engineering. They provide realistic search spaces and objective functions, making them excellent teaching and experimental tools.

---

## 1. `SS-*`  — Software System Configuration Tuning

**Use-case:** Tune software/system configs to optimize performance and cost.

⚙️ **Configurable Parameters**: thread pools, memory sizes, cache options, I/O settings  
🚦 **Constraints**: valid ranges and inter-parameter dependencies  
 🎯 **Objectives**: maximize **Throughput+** and minimize **Latency-** (and often cost/reliability)  
🌌 **Search Space**: high-dimensional → infeasible to brute-force; ideal for SBSE

#### Sample Rows (from `SS-I.csv`)
*Arrows remind which direction is better for each objective.

| Spout | Split | Count | Buffer_size | Heap | **Throughput+ ↑** | **Latency- ↓** |
|---:|---:|---:|---:|---:|---:|---:|
| 2 | 1 | 9 | 1,050,000 | 512  | **13,293.0** | 143.77 |
| 2 | 3 | 1 | 5,240,000 | 2,048 | 9,575.8 | **199.41** |
| 3 | 1 | 1 | 10,500,000 | 2,048 | 7,999.9 | **384.80** |
| 2 | 3 | 6 | 1,050,000 | 512  | 12,518.0 | 154.39 |
| 3 | 6 | 9 | 262,000   | 1,024 | **17,206.0** | 186.35 |

**Reading the table:**  
- **Spout/Split/Count** are topology/workload controls.  
- **Buffer_size/Heap** are memory settings.  
- **Throughput+** (maximize) vs. **Latency-** (minimize) defines the core tension → perfect for multi-objective search (e.g., NSGA-II, MO-PSO, Bayesian optimization with constraints).

---

## 2. `pom3` — Agile Project Management

**Use-case:** Model agile project trade-offs: scope, value, risk, effort, cost.

 📦 **Scope / Size**: number of features, requirements to deliver  
 💰 **Cost**: effort/resources consumed (person-months, budget)  
 ⚠️ **Risk**: probability of defects, schedule slips, delivery issues  
 🕒 **Schedule Pressure**: speed vs. quality trade-off  
 🎯 **Value**: customer/business impact of delivered features  

---

### Features ↔ Industry Implications

| **Features** | **Industry Implications** |
|---|---|
| 📦 Scope/Size | 🗂️ Helps teams decide *how many features* to take into a sprint/release |
| 💰 Cost (effort multipliers, resource use) | 💵 Budget estimation & trade-offs between staffing vs. delivery speed |
| ⚠️ Risk (criticality, dependency, uncertainty) | 🔍 Assess which features might introduce technical or delivery risk |
| 🕒 Schedule Pressure & Dynamism | 🚀 Balancing time-to-market vs. technical debt / quality |
| 🎯 Value (score/benefit) | 🎯 Prioritize high-value features under limited capacity |
---

### Sample Rows (from `pom3d.csv`)
| Culture | Criticality | Size | Team Size | **Cost- ↓** | **Score- ↑** | **Idle- ↓** |
|---:|---:|---:|---:|---:|---:|---:|
| 0.841 | 0.399 | 0.289 | 0.878 | **0.205** | 0.024 | 0.220 |
| 0.132 | 0.783 | 0.115 | 0.752 | 0.396 | **0.061** | **0.000** |
| 0.199 | 0.043 | 0.545 | 0.160 | 0.293 | **0.083** | 0.433 |
| 0.638 | 0.775 | 0.870 | 0.713 | 0.714 | **0.209** | 0.380 |
| 0.172 | 0.530 | 0.533 | 0.795 | **0.181** | 0.030 | **0.000** |

**Reading the table:**  
- **Culture, Criticality, Dependencies, Dynamism**: project environment characteristics.  
- **Size, Team Size**: workload and resources.  
- **Cost-**: lower is better (effort).  
- **Score-**: higher is better (delivered value).  
- **Idle-**: lower is better (unused capacity).  

---


## 3. `xomo` — Effort Estimation and Project Planning

**Origin:** Developed by Dr. Tim Menzies using NASA JPL project models (extensions of Boehm’s COCOMO).  
**Goal:** Simulate software project outcomes to **reduce risk, effort, defects, and schedule length**.

👩‍💻 **Project Attributes**: team capability, analyst/programmer experience, tool usage  
🧩 **Complexity Factors**: size (KLOC), requirements volatility, platform complexity  
⚙️ **Effort Multipliers**: domain knowledge, team cohesion, schedule compression  
📊 **Outputs**: predicted effort (person-months), schedule (months), defect counts, risk metrics  

---

### Features ↔ Industry Implications

| **Features** | **Industry Implications** |
|---|---|
| 👩‍💻 Team capability, experience (ACAP, PCAP, AEXP) | 🧑‍🤝‍🧑 Hiring/training trade-offs vs. productivity |
| 🧩 Complexity factors (KLOC, CPLX, TIME) | 📈 Larger, more complex systems → higher cost and risk |
| ⚙️ Effort multipliers (TOOL, SITE, TEAM) | 🛠️ Better tools and cohesion reduce cost/schedule pressure |
| 📊 Outputs (EFFORT-, MONTHS-, DEFECTS-, RISKS-) | 🧮 Data-driven planning for budget, staffing, and delivery |

---

### Sample Rows (from `xomo_flight.csv`)
| KLOC | ACAP (Analyst Capability) | PCAP (Programmer Capability) | TOOL | **EFFORT- ↓** | **MONTHS- ↓** | **DEFECTS- ↓** | **RISKS- ↓** |
|---:|---:|---:|---:|---:|---:|---:|---:|
| 308.2 | 4.379 | 2.515 | 2.0 | 1193.3 | 32.8 | 15,986 | **0.000** |
| 392.9 | 4.969 | 3.431 | 2.0 | 2331.5 | 40.8 | 18,362 | 0.268 |
| 301.0 | 3.592 | 3.051 | 2.0 | 1613.5 | 36.1 | 24,004 | **0.000** |
| 325.7 | 3.341 | 3.813 | 2.0 | 1029.1 | 29.7 | 21,914 | **0.000** |
| 159.6 | 4.118 | 2.393 | 2.0 | **531.7** | **23.9** | **4,741** | **0.000** |

**Reading the table:**  
- **Inputs**: size (KLOC), capability factors, tool support.  
- **Outputs**: effort (person-months), months, predicted defects, risk.  
- More complexity/size generally → ↑ effort, ↑ schedule, ↑ defects.

---

# 💡 Methods in SBSE [^1]

| **Category** | **Examples** | **When Used in SE** |
|--------------|--------------|----------------------|
| 🔍 Local Search | Hill Climbing, Simulated Annealing | Quick improvements, small-scale refactoring, CI/CD tuning |
| 🧬 Evolutionary Algorithms | Genetic Algorithms, Genetic Programming | Test prioritization, automated program repair, config tuning |
| 🐦 Swarm Intelligence | Particle Swarm Optimization, Ant Colony Optimization | Project scheduling, test suite/path optimization |
| ⚖️ Multi-objective Optimization | NSGA-II, SPEA2 | Trade-offs: value vs. cost, coverage vs. time |
| 🧠 Hybrids & Surrogates | Hyper-heuristics, Bayesian Optimization | Expensive evaluations (e.g., performance tuning), adapting methods |



-----



# 🔬 My Research Direction


**💰 Challenges:**

👉 **Labeling is expensive** → each evaluation = long test runs, costly experiments, or human judgment.  
👉 **Explainability is essential** → adoption only happens if engineers & managers can *see why* a decision makes sense.  

🎯 **My focus:**  
Make SBSE **practical and adoptable** by  
👉 reducing the *labeling burden* and  
👉 increasing *decision clarity*.  

## 🧭  A New Heuristic for SBSE

 **1. 📉 Less-but-Better Data**
- Don’t measure everything.  
- **Actively choose** the most informative cases.  
- Result → faster loops, fewer wasted labels.

**2. 🗣️ Actionable Narratives**
- Explanations must map to real levers:  
  - “↑ Heap, ↓ Buffer”  
  - “Trim low-value stories”  
- Short, operational guidance beats long model internals.


👉 Interested in labeling & explainability in SBSE?   *Check out my latest work* [^2]



[^1]: Miqing Li and Tao Chen. 2024. Methodology and Guidelines for Evaluating Multi-Objective Search-Based Software Engineering. In Companion Proceedings of the 32nd ACM International Conference on the Foundations of Software Engineering (FSE 2024). Association for Computing Machinery, New York, NY, USA, 707–709. https://doi.org/10.1145/3663529.3663819
[^2]: Rayegan, Amirali, and Tim Menzies. "Minimal Data, Maximum Clarity: A Heuristic for Explaining Optimization." (https://arxiv.org/abs/2509.08667) (2025).
