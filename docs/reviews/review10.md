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

# Review 10

This document has review questions related to (a)legal issues and 
(b)testing.


## Part1: Legal and Testing Lectures (Bloom's Taxonomy)


### Question 1: Transformative Use and System Architecture

**(a) [Remember - 1 mark]** Define "transformative use" in the context of copyright law and AI/ML systems.

**(b) [Understand - 2 marks]** Explain why both judges in the Bartz v. Anthropic and Kadrey v. Meta cases concluded that training ML models constitutes transformative use. Describe the technical difference between how copyrighted works function in their original form versus how they're processed during ML training.

**(c) [Analyze - 3 marks]** Compare two system architectures: (A) a streaming training pipeline that processes copyrighted data and discards it, versus (B) a RAG system that stores copyrighted documents and retrieves them for user queries. Analyze the legal risk profile of each architecture across all four fair use factors, and explain which design choices make one safer than the other.


### Question 2: Market Dilution and Product Design

**(a) [Remember - 1 mark]** Define "market dilution" as introduced by Judge Chhabria and explain why it represents a new legal risk for AI products.

**(b) [Understand - 2 marks]** Explain the difference between traditional copyright infringement (copying protected works) and market dilution (flooding markets with non-infringing content). Describe which types of AI products face higher dilution risk according to Judge Chhabria's reasoning.

**(c) [Create - 3 marks]** Design a content generation API product that provides value to users while mitigating market dilution liability. Your design should include: (i) technical rate limiting controls, (ii) user tier structure (personal vs commercial), (iii) output monitoring systems, and (iv) terms of service provisions. Justify how each element reduces legal risk while maintaining product viability.


### Question 3: Output Filtering Implementation

**(a) [Remember - 1 mark]** List three technical approaches to output filtering that prevent verbatim reproduction of training data.

**(b) [Apply - 2 marks]** Given this scenario: Your LLM occasionally reproduces exact sentences from its training data. Implement pseudocode for a filter that detects when generated text matches training corpus with more than N consecutive tokens. Include how you would handle edge cases like common phrases.

**(c) [Evaluate - 3 marks]** Meta successfully defended against copyright claims partly due to their output filtering system. Evaluate the tradeoffs between aggressive filtering (high legal protection, potentially worse outputs) versus minimal filtering (better outputs, higher legal risk). Propose a filtering strategy that balances these concerns, and critique whether technical filters alone provide sufficient legal protection or if other controls are necessary.

## Review Questions: Testing Fundamentals (Bloom's Taxonomy)


### Question 1: Fault vs Failure and Pre-Release Testing

**(a) [Remember - 1 mark]** Define "fault" and "failure" in software engineering and explain the key difference between them.

**(b) [Understand - 2 marks]** Using the Fenton & Neil causal model discussed in lecture, explain this paradox: System A undergoes extensive testing, discovers 500 pre-release faults, and experiences 10 post-release failures. System B has minimal testing, discovers 20 pre-release faults, and experiences 200 post-release failures. Why don't pre-release faults predict post-release failures?

**(c) [Evaluate - 3 marks]** A startup releases software with minimal testing, observes few bug reports in the first month, and concludes their code quality is excellent. Critique this reasoning using concepts from the fault vs failure discussion. What alternative explanations might account for the low bug reports, and what risks does this assessment approach create?


### Question 2: The V-Diagram and Testing Economics

**(a) [Remember - 1 mark]** Sketch the V-diagram showing the relationship between planning phases (left side) and testing phases (right side). Label at least four phases on each side.

**(b) [Understand - 2 marks]** Brooks' *Mythical Man Month* suggests software effort divides as: 1/3 planning, 1/6 coding, 1/4 unit testing, 1/4 system testing. Explain why coding represents a relatively small fraction and why testing consumes half the total effort. What does this imply about where optimization efforts should focus?

**(c) [Analyze - 3 marks]** Compare two development approaches: Team A jumps straight to coding without planning, while Team B follows the V-diagram with upfront planning. For each team, analyze: (i) their ability to write effective tests, (ii) likely defect detection timing, (iii) rework costs, and (iv) long-term maintainability. Use the V-diagram's feedback loops in your analysis.


### Question 3: Testing Types and Scale

**(a) [Remember - 1 mark]** Define and distinguish between: unit testing, integration testing, system testing, and acceptance testing. Provide the primary goal of each.

**(b) [Apply - 2 marks]** You're building an e-commerce checkout system with components: shopping cart, payment gateway API, inventory database, and email service. Design one specific test for each testing type (unit, integration, system, acceptance) that would be appropriate for this system. Explain what each test validates.

**(c) [Evaluate - 3 marks]** In 2013, Google ran 3 billion regression tests taking 2-3 weeks for feedback, which "stopped Google being mobile/agile." The Elbaum/Rothermel/Penix solution achieved 50% failure detection in the first hour through test prioritization. Evaluate the tradeoffs involved: What are the risks of not running all tests? What assumptions does prioritization make? Under what conditions might the full test suite still be necessary despite the time cost?


### Question 4: Grammar-Based Fuzzing

**(a) [Remember - 1 mark]** Explain what a grammar is in the context of testing, and describe how it can be used to generate test inputs automatically.

**(b) [Apply - 2 marks]** You're testing a date validator that should accept formats like "MM/DD/YYYY" where MM is 01-12, DD is 01-31, and YYYY is 1900-2099. Write a simple grammar (using any notation) that could generate valid test dates. Show at least 3 example outputs your grammar would produce.

**(c) [Create - 3 marks]** During testing, you discover that phone numbers with area code 919 (Raleigh) and 212 (New Jersey) have more bugs than other area codes. Design a weighted grammar-based fuzzing strategy that: (i) biases test generation toward these problematic regions, (ii) can adapt weights automatically based on observed crashes, and (iii) can be reconfigured to avoid known-buggy regions when testing other code paths. Show your weighting scheme and explain the adaptation mechanism.


### Question 5: State Machine Testing

**(a) [Remember - 1 mark]** Explain what "doodling state machines" means in the context of testing systems you don't fully understand. Why is this a useful testing strategy?

**(b) [Apply - 2 marks]** Draw a state machine for an elevator door system with states: CLOSED, OPENING, OPEN, CLOSING. Include transitions for: button press, timeout (2 seconds), obstruction detected, and completion of movement. Identify any loops in your state machine.

**(c) [Analyze - 3 marks]** The lecture mentioned NASA testing the Juno spacecraft's flight guidance system with minimal domain knowledge. Given a state machine you've sketched from documentation, analyze what test patterns you should look for: (i) What makes loops potentially problematic? (ii) What are dead ends and why do they matter? (iii) How would you generate a test suite that covers all transitions at least once? (iv) The lecture mentioned "test cases need not loop more than once"—explain the reasoning and when this heuristic might be insufficient.


### Question 6: Search-Based Software Engineering and Testing Economics

**(a) [Remember - 1 mark]** Explain the "great secret" mentioned in lecture: why are X values (configuration choices) cheap to collect while Y values (performance goals) are expensive?

**(b) [Understand - 2 marks]** Using the used car analogy from lecture: You can observe car color, brand, doors, and mileage (X values) by walking around a lot. But determining miles-per-gallon requires driving for hours (Y value). Explain how this economic asymmetry applies to software testing, using an example like database configuration testing where X = buffer sizes/security protocols and Y = query speed/memory usage.

**(c) [Create - 3 marks]** Design an active learning strategy for testing a system with 50 binary configuration options (2^50 = 1 quadrillion combinations) where each test execution takes 10 minutes. Your approach should: (i) start with a small initial sample, (ii) use test results to guide selection of next configurations to test, (iii) stop after a reasonable budget (e.g., 40 evaluations), and (iv) achieve "99% of optimal" performance. Explain your selection criteria and stopping condition. How does this differ from random testing or exhaustive testing?


### Question 7: Real-World Testing Challenges

**(a) [Remember - 1 mark]** Describe the LexisNexis testing challenge mentioned in lecture: Why didn't they collect line numbers from regression test failures?

**(b) [Understand - 2 marks]** The lecture explained that at LexisNexis, "the line number is where the bug surfaces, but not where it's caused" due to complex interconnected services. A Philippine team performs "blame" assignment to determine which programmer should fix each bug. Explain why blame assignment is non-trivial in large distributed systems and what information the Philippine team likely uses instead of line numbers.

**(c) [Analyze - 3 marks]** Compare three testing scenarios: (A) a 1000-line Python script with clear stack traces, (B) LexisNexis's microservices with delayed/cascading failures, (C) NASA's Juno spacecraft with minimal domain knowledge. For each, analyze: What testing strategy is most appropriate (unit/integration/system/black-box/white-box)? What information helps with fault localization? What are the primary challenges? How would you approach each differently?


