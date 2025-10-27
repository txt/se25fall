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



## **Question 1: Fault vs Failure**

**(a) [1 mark]**
Define “fault” and “failure” and explain the key difference between them.

**(b) [2 marks]**
Using the Fenton & Neil causal model, explain how a system with extensive pre-release testing could show many pre-release faults but few post-release failures. Sketch the causal factors involved.

**(c) [3 marks]**
A startup releases software with minimal testing, observes few reported bugs in the first month, and concludes their code quality is excellent. Critique this reasoning using concepts from reliability engineering. What alternative explanations might account for the low bug reports? 

---

## **Question 2: Coverage Metrics**

**(a) [1 mark]**
For the following code, explain why one test achieving 100% line coverage might still have 50% branch coverage:

```python
def func(x):
    if x > 0:
        return x * 2
    return x
```

**(b) [2 marks]**
Write a function with 2 if-statements where achieving 100% branch coverage requires 4 tests, but 100% line coverage requires only 2 tests. Show your test cases.

**(c) [3 marks]**
Research shows statement coverage best predicts mutation kills (Gopinath 2014), yet coverage alone poorly correlates with test effectiveness (Inozemtseva & Holmes 2014). Reconcile these findings. When is coverage useful and when is it misleading? 

---

## **Question 3: Mutation Testing**

**(a) [1 mark]**
What is a “mutation operator,” and list three types (AOR, ROR, CR, etc.) with examples.

**(b) [2 marks]**
Given this code:

```python
def discount(price, rate):
    if price > 100:
        return price - (price * rate)
    return price
```

Generate 3 mutants using different operators and explain whether your test suite `[discount(50, 0.1), discount(150, 0.2)]` kills each mutant.

**(c) [3 marks]**
A test suite has 90% line coverage but only 60% mutation score. Another has 70% coverage but 85% mutation score. Which indicates higher quality testing? Justify your reasoning considering what each metric measures and their practical implications for fault detection. 

---

## **Question 4: Test Case Prioritization**

**(a) [1 mark]**
Define APFD (Average Percentage of Faults Detected) and explain why it’s more informative than simply measuring “time to find first fault.”

**(b) [2 marks]**
You have 4 tests: A (passed 10 runs ago, execution time 5 s), B (failed yesterday, 10 s), C (new test, 2 s), D (passed yesterday, 15 s). Apply the Elbaum heuristic to prioritize these tests. Show your reasoning.

**(c) [3 marks]**
Ling et al. (2022) found optimal TCP strategies differ for open-source vs closed-source projects (diversity-based optimal for closed-source, history-based for open-source). Propose three hypotheses explaining why this difference exists. Design an experiment to test one hypothesis. 

---

## **Question 5: Delta Debugging**

**(a) [1 mark]**
Explain what “1-minimal” means in the context of delta debugging’s `ddmin` algorithm.

**(b) [2 marks]**
You have a 16-character input `"ABCDEFGHIJKLMNOP"` that crashes a program. Walk through the first 3 steps of `ddmin` assuming removing `"ABCDEFGH"` still crashes, but removing `"IJKLMNOP"` passes. What does `ddmin` try next?

**(c) [3 marks]**
The “oracle problem” requires distinguishing the target failure from other failures. Design a test oracle for a compiler that should detect “segmentation fault” as the target failure while ignoring “syntax error” and “type error.” Show code and explain how it handles ambiguous cases. 

---

## **Question 6: Black-Box Testing**

**(a) [1 mark]**
Write a simple grammar (in any notation) that generates arithmetic expressions with numbers 1–9 and operators `+`, `–`, `*`.

**(b) [2 marks]**
Extend your grammar with probability weights such that `+` is chosen 50% of the time, while `–` and `*` are each chosen 25%. Show Python code implementing weighted random selection.

**(c) [3 marks]**
Coverage-guided fuzzing automatically reweights grammar rules to explore uncovered code paths. Compare this to manual weighting (where domain experts specify weights). Under what circumstances would each approach be more effective? Consider factors like domain knowledge availability, code complexity, and testing budget. 

---

## **Question 7: Formal Verification**

**(a) [1 mark]**
What is the difference between formal verification and traditional testing, and why might formal verification provide stronger correctness guarantees?

**(b) [2 marks]**
AWS rewrote their authorization engine in Dafny rather than verifying the existing Java code. Explain two technical reasons why rewriting might be more practical (consider proof brittleness, legacy code complexity, tool limitations).

**(c) [3 marks]**
The AuthV2 project performed 10¹⁵ shadow tests despite having formally verified code. Explain the relationship between proof and testing: what errors does each approach catch, why are both necessary, and what does this tell us about the role of specifications in formal methods? 

---

## **Question 8: ARIMA Forecasting**

**(a) [1 mark]**
Describe the three components of ARIMA (AutoRegressive, Integrated, Moving Average) in the context of time-series forecasting.

**(b) [2 marks]**
A project has these weekly issue counts for 4 weeks: [10, 15, 12, 18]. Using a simple moving average (MA(2)), forecast the next week. Then explain how ARIMA’s “integrated” component would handle a non-stationary trend.

**(c) [3 marks]**
Research found issue counts predict bugs as accurately as bug history itself. Evaluate the practical implications for organizations: what does this enable, what are the risks/limitations, and under what conditions might this approach fail (project maturity, issue quality, labeling accuracy). 

---

## **Question 9: Active Learning (TERMINATOR)**

**(a) [1 mark]**
Explain the difference between “uncertainty sampling” and “certainty sampling” in active learning.

**(b) [2 marks]**
TERMINATOR uses uncertainty sampling early (|LR| < 30 failures) then switches to certainty sampling. Explain the rationale for this adaptive strategy. What would go wrong if it used only uncertainty sampling throughout?

**(c) [3 marks]**
TERMINATOR frames test prioritization as a “Total Recall” problem. Evaluate this framing: what assumptions does it make about the testing goal, how does this differ from traditional coverage-based approaches, and when might this framing be inappropriate (i.e., when is finding all failures quickly not the right objective)? 

