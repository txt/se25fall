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



# Review Questions 5


## Question 1


**1.1)** Define Encapsulation.  
**1.2)** Contrast Encapsulation with Information Hiding.  
**1.3)** Explain when to use Encapsulation vs. Pipes and Filters.  
**1.4)** A banking application has an `Account` class that stores a user’s balance. Instead of making `balance` a public variable, the class provides methods `deposit(amount)` and `withdraw(amount)`, which check for overdrafts before modifying `balance`.  
Does  ths encapsulation protect the integrity of the bank’s account data?  How can it hurt the software?


 


## Question 2


**2.1)** Define Pipes and Filters.  
**2.2)** Contrast Pipes and Filters with Design patters.  
**2.3)** Explain when to use Pipes and Filters vs. Function Calls.  
**2.4)** A data processing company needs to clean and transform CSV logs before analysis. They design a pipeline:  


- Extract data from raw files.  
- Transform data (convert timestamps, clean missing values).  
- Filter logs to keep only relevant records.  
- Load data into a database.  


Each step is implemented as an independent script that passes data through a Unix pipe (`cat logs.csv | clean.py | filter.py | load.py`).  
Does this pattern make the system more flexible?  How can it hurt the software?


## Question 3


**3.1)** Define Information Hiding.  
**3.2)** Contrast Information Hiding with Desgin Patterns.  
**3.3)** Explain when to use Information Hiding vs. Design Patterns.  
**3.4)** A software engineer is building a car rental system. The `Car` class has an internal function `_calculateDepreciation()` that determines how the car’s value changes over time.  
What does this  method hidden from external access, and what are the benefits of this approach?   How can it hurt the software?


## Question 4


**4.1)** Define Design Patterns.  
**4.2)** Contrast Design Patterns with Object-Oriented Design.  
**4.3)** Explain when to use Design Patterns vs. Procedural Approaches.  
**4.4)** A software team is designing a GUI application. To ensure consistency, they use the **Model-View-Controller (MVC)** pattern, separating data (`Model`), logic (`Controller`), and UI (`View`).  
Does this design pattern improve flexibility and maintainability?  How can it hurt the software? 
