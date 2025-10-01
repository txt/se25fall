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


## ⚡ LLMs are powerful, but at what cost?

As you read this, electricity is consumed, carbon is emitted, and data centers run hot.  

> 🏭 **Fact:** Data centers consumed **4.4% of U.S. electricity in 2023** and are projected to reach **6.7–12% by 2028**. [2]  

---

### 🔍 Where is energy consumed?

- **Training** → the phase where the model *learns* from massive datasets.  
  *(Very costly & time-consuming)*  
- **Inference** → the phase where the model is *used* (e.g., a ChatGPT prompt, translation, image recognition).  

💡 **Concern:** Inference is the real energy hog → now **80–90% of AI’s compute power** is spent here. [1]  

> 📉 But good news: inference doesn’t max out GPU power. Microsoft’s **POLCA framework** oversubscribes datacenter power safely → letting **30% more servers run within the same limits**, boosting efficiency. [3]  

---

### 💰 The True Cost (Examples)

Researchers tested open-source models to measure energy per response:  

| Model | Task | Energy (raw) | Energy (full, with cooling) | Everyday Equivalent |
|-------|------|--------------|------------------------------|----------------------|
| **Llama 3.1 8B** | Text gen (e.g., itinerary) | 57 J | 114 J | Microwave for 0.1s |
| **Llama 3.1 405B** | Same task, larger model | 3,353 J | 6,706 J | Microwave for 8s |
| **Stable Diffusion 3 Medium** | Image generation | 4,402 joules | (depends on steps/resolution) | Microwave for 5.5s|
| **Video Gen (diffusion)** | 3D animation/video | ~3.4M J | — | 🚴 Ride 38 miles on e-bike / Microwave for 1h+ |

> ⚠️ OpenAI reports **1B messages/day on ChatGPT** and **78M images/day** after launching its generator. Imagine the energy bill! [6]  

---

## 🔴 RED AI vs. 🟢 GREEN AI

- **RED AI** → Maximizes accuracy/performance without caring about computational cost. [5]  
- **GREEN AI** → Achieves good results *while minimizing resources* and tracking carbon footprint.  

<p align="center">
  <img width="500" alt="Green AI diagram" src="https://github.com/user-attachments/assets/22340a3f-8d74-40a0-b4ba-4e0d0a5d70f6">
</p>

<sub>Source: [ACM](https://dl.acm.org/doi/pdf/10.1145/3381831)</sub>  

---

## 🛠️ What the SE Community Can / Should Do

<p align="center">
  <img width="600" alt="SE + Green AI" src="https://github.com/user-attachments/assets/ef049d47-f6f8-432c-b6d2-6f2a60862a14">
</p>

<sub>Source: [ACM](https://dl.acm.org/doi/pdf/10.1145/3712007#page=4.87)</sub>  

1. **Requirements Engineering** → must formally define the business case trade-offs, particularly between a system's utility (e.g., accuracy or latency) and its environmental cost [4].  
2. **Compliance & Monitoring** → adapt existing SE incident-management practices to AI. [4]  
3. **New Roles** → Environmental Sustainability Expert (like data scientists in AI teams). [4]  
4. **Standardized Reporting** → Guidelines & description sheets for sustainability metrics.  
5. **Education** → SE curricula must cover *responsible + green AI*.  
6. **Smarter Task Allocation** → Delegate only complex tasks to large LLMs, use lightweight ones otherwise. [9]  

There is a concerning energy overhead from continuously prompting code generation models to converge to a version of the software that can go to production. We need paradigms that minimize trial-and-error iterations to prevent unnecessary effort and resources from being wasted on highly complex AI models.

💡 One solution → **Context-Aware Mixture of Experts** → avoids overusing giant models unnecessarily.  

---

### 🧪 Fun Study: Programming Languages & Energy Use

> **Which is greener: Compiled or Interpreted languages?**  

<p align="center">
  <img width="800" alt="Language energy consumption" src="https://github.com/user-attachments/assets/b4210bcd-0120-44f0-8930-68c600f3f47e">
</p>

<sub>Source: [IEEE GREENS’25](https://doi.org/10.1109/GREENS66463.2025.00007)</sub>  

---

### 📌 **“AI sustainability must be balanced with ease of implementation and maintenance.”**  

---

## 📚 References
1. [MIT Tech Review (2025): AI’s Energy Usage & Climate Footprint](https://www.technologyreview.com/2025/05/20/1116327/ai-energy-usage-climate-footprint-big-tech/)  
2. [DOE Report on Data Center Electricity Demand](https://www.energy.gov/articles/doe-releases-new-report-evaluating-increase-electricity-demand-data-centers)  
3. [Microsoft (2024): GPU Power & POLCA Framework](https://www.microsoft.com/en-us/research/wp-content/uploads/2024/03/GPU_Power_ASPLOS_24.pdf)  
4. Luís Cruz et al. (2025). *Innovating for Tomorrow: SE + Green AI*. ACM TOSEM. https://doi.org/10.1145/3712007  
5. Roy Schwartz et al. (2020). *Green AI*. CACM. https://doi.org/10.1145/3381831  
6. [NYT (2025): ChatGPT + Alexa Usage](https://www.nytimes.com/2025/04/24/technology/chatgpt-alexa-please-thank-you.html)  
7. [CMU: Measuring AI’s Energy & Environmental Footprint](https://www.cmu.edu/work-that-matters/energy-innovation/measuring-ais-energy-and-environmental-footprint)  
8. Samsi, S. et al. (2023). *From Words to Watts*. IEEE HPEC. https://doi.org/10.1109/HPEC58863.2023.10363447  
9. Terragni, V. et al. (2025). *Future of AI-Driven SE*. ACM TOSEM.  
10. Rajput, S. et al. (2024). *Fine-Grained Energy Measurement in DL*. ACM TOSEM. https://doi.org/10.1145/3680470  
11. Marini, N. et al. (2025). *Which Programming Language Consumes the Most?* IEEE GREENS’25. https://doi.org/10.1109/GREENS66463.2025.00007  

