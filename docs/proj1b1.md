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



# Project 1b1  

**Due**: Monday, Sept 8  
**What**: Problem amplification  

**What to do**:  
  - Read web-based supplemental materials relating to health, tax regulations pertaining to food:  
    - [Spreadsheet link](https://docs.google.com/spreadsheets/d/1jn8bz5E7RaAFuLjlwO486Xmi-z0yO9cq/edit?gid=324604352#gid=324604352)  
  - Ask two LLMs to find what is missing in your 1a1 deliverables.  
    - Default focus: ChatGPT and Claude  
    - Other options: Gemini Pro, DeepSeek, LLaMA, Mistral, Falcon, etc.  
    - ⚠️ Note: Some cost $$$, which may limit the number of queries.  
  - Be aware of **context window issues** (Claude’s is smaller than ChatGPT’s).  
  - For each LLM:  
    - First, offer prompts training them in what is a *use case* (see below).  
    - Work from a directory containing the relevant docs you downloaded.  
    - Compare results from **zero-shot prompting** vs **careful prompting**.  

**What to hand in**:  
  - Reflection document (max half page): differences you see in the LLM reports.  
  - Report the **total cost of LLM usage** (note: up to $80 is acceptable,  
    divided 4 ways between 4 team members = $25 each).  

## Appendix:Prompts to train an LLM about “what is a use case”

Show   an LLM example of the use case format (see slide 64 to 75 of these slides). 
Hints:
- Structure the prompt in markdown
- Separate sections with

“””.e.g 


a use case Divides into predictions, main flow, subflows, alternatives. For example:


Preconditions=”””
The driver approaches the intersection.
The driver checks the status [Check Status].
The driver clears the intersection [Go].”””


Subflows = 
...
```

