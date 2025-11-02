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



## 🟦 Background Notes (for Question 4: Tarantula Fault Localization)

To understand Question 4, recall how Tarantula visualizes testing outcomes.

Tarantula (Jones et al., ICSE 2002) assigns **colors and suspiciousness scores**
to each line/block of code using data from passed and failed test cases.

### 🔹 How Tim Described Taranula

> “Imagine the code as a big tree. As tests run, branches light up green when tests pass, red when they fail.  
> The interesting part? Not the pure red, not the pure green — but that *zone of confusion* where half tests pass, half fail. That's where you learn the most.”


### 🔹 Figure 3 (from the 2002 Tarantula  paper) – Key Ideas

<img width="571" height="405" alt="image" src="https://github.com/user-attachments/assets/b35a33f6-7ba3-4a9b-a8c3-c815bd6c0aa2" />

Figure 3 shows a visualization like this:

| Code Region | Passed Tests | Failed Tests | Color / Suspiciousness |
|-------------|--------------|--------------|--------------------------|
| Region A    | Many         | 0            | **Bright Green** (safe) |
| Region B    | 0            | Many         | **Bright Red** (likely bug) |
| Region C    | Some         | Some         | **Orange / Yellow** (uncertain, “confusion zone”) |

- Each statement/block is colored from **green → yellow → red**.
- Color is based on ratio:  
  **Suspiciousness = (failed/total_failed) / (failed/total_failed + passed/total_passed)**
- **Figure 3 visually shows a code tree with:**
  - **Green paths:** always passed tests → “good code”  
  - **Red paths:** always failed tests → “bug hotspots”  
  - **Orange region between them:** where results are mixed → *most informative for future testing*

Here is Tarantual applied to a 4K of code:

<img width="1050" height="844" alt="image" src="https://github.com/user-attachments/assets/7a57b3da-6a65-4434-ab86-f1a71e7a2836" />


### 🔹 Why This Matters

- Bright red = likely where bug manifests → candidate for **repair**  
- Bright green = safe regions → can copy code from here (plastic surgery repair)  
- Orange (mixed) = best place for **more testing**, contrast learning, fault localization

## Review Questions

Questions a,b,c are worth 1,2,3 marks.

### **1. Fault vs Failure**
(a) Define *fault* and *failure*.  
(b) Why can many pre-release faults lead to few post-release failures?  
(c) A startup gets no bug reports and declares success. Critique.

---

### **2. V-Diagram & Testing Effort**
(a) Describe the V-diagram (4 stages per side).  
(b) Why is coding only 1/6 of effort while testing is 1/2 (Brooks)?  
(c) If you must cut 20% schedule time, which phase(s) do you reduce, and why?

---

### **3. Coverage Metrics**
(a) Define statement coverage and branch coverage.  
(b) Give an example where 100% coverage still misses a bug.  
(c) How does mutation testing address this limitation?

---

### **4. Tarantula Fault Localization**
(a) What does Tarantula compute for each line of code?  
(b) Why is the orange “half-pass/half-fail” region most valuable?  
(c) If Region A is 100% failing and Region B is 50/50, which do you:
 - test more?  
 - repair first? Explain.

---

### **5. Regression Testing & APFD**
(a) What is regression testing?  
(b) What does APFD measure?  
(c) CI tests take 6 hours. Propose a prioritization strategy.

---

### **6. Grammar-Based Fuzzing**
(a) What is grammar-based fuzzing?  
(b) Give an example (e.g., US phone number grammar).  
(c) How does *coverage-guided fuzzing* improve it?

---

### **7. Delta Debugging**
(a) What is the objective of delta debugging (ddmin)?  
(b) How does ddmin shrink failing input?  
(c) How would you reduce a 1000-line failing test case to a minimal set?

---

### **8. Metamorphic Testing**
(a) Define metamorphic testing.  
(b) Give one metamorphic relation example.  
(c) Why is it useful when no test oracle exists (e.g., ML systems)?

---

### **9. Automatic Program Repair**
(a) What is automatic program repair?  
(b) What does “bugs are social animals” mean?  
(c) Explain the plastic surgery hypothesis. What is one risk?

---

### **10. Non-Functional Testing (Availability)**
(a) Define availability testing.  
(b) Give one example where security conflicts with availability.  
(c) Design a simple test to measure cloud service availability under CPU spikes.


