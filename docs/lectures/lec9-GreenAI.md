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



## LLMs are powerful, but at what cost?

As you generate this answer, electricity is consumed, carbon is emitted, and data centers run hot. 

_Data centers consumed about 4.4% of total U.S. electricity in 2023 and are expected to consume approximately 6.7 to 12% of total U.S. electricity by 2028._ [2]

#### Where is energy consumed?
**Training** is the phase where the model learns from massive amounts of data (expensive and time-consuming). 

**Inference** is the phase where the finished model is applied — when a user types a prompt into ChatGPT, asks an AI to recognize an image, or requests a translation. 

So which one do you think is a concern for energy consumption? 

Inference represents an increasing majority of AI’s energy demands and will continue to do so in the near future. It’s now estimated that 80–90% of computing power for AI is used for inference. [1]

However, researchers found that inference jobs in large language models don’t push GPUs to their peak power use. This leaves extra headroom in datacenters that normally goes unused. Their framework, called POLCA, manages power more efficiently by safely oversubscribing it, letting datacenters run about 30% more servers within the same power limits. This improves energy efficiency without major performance loss. [3]

#### So, what is the true cost ? 
The exact answer is unknown to us!! But researchers downloaded and tweaked open source models to find out the energy required for a given task.

For Example, Text generation prompt: making a travel itinerary or explaining quantum computing

**Model**: Llama 3.1 8B 

**Cost**: 57 joules per response, or an estimated 114 joules when accounting for cooling, other computations, and other demands. 
~~ running the microwave for 1/10 th second. 

**Model**: Llama 3.1 405B (more parameters = better answers)

**Cost**: 3,353 joules, or an estimated 6,706 joules total, for each response.
~~ run the microwave for 8 seconds
 
Image or video generation = diffusion architecture. 

_Fun fact_- diffusion model doesn’t depend on your prompt instead it depends on the size of the model, 
the image resolution, and the number of “steps” the diffusion process takes (more steps lead to higher quality but need more energy).

For Example, 
**Model:** Stable Diffusion 3 Medium (open source image generator)

**Cost**: GUESS! 

Video generation 

**Cost:** about 3.4 million joules ~~ riding 38 miles on an e-bike, or running a microwave for over an hour

OpenAI said that ChatGPT receives 1 billion messages every day, and after the company launched a new image generator in March, it said that people were using it to generate 78 million images per day. Think about the energy cost !!
       
## RED AI and GREEN AI 

**RED AI**: AI research that seeks to improve accuracy (or related measures) through the use of massive computational power while disregarding the cost. [5]

<img width="404" height="237" alt="greenAI" src="https://github.com/user-attachments/assets/22340a3f-8d74-40a0-b4ba-4e0d0a5d70f6" />

<small>_Source: https://dl.acm.org/doi/pdf/10.1145/3381831_</small>


**GREEN AI** : AI research that yields novel results while taking into account the computational cost, encouraging a reduction in resources spent. 

## WHATS SOFTWARE ENGINEERING COMMUNITY DOING OR SHOULD BE DOING ABOUT IT? 

<img width="264" height="170" alt="SEGreenAI" src="https://github.com/user-attachments/assets/ef049d47-f6f8-432c-b6d2-6f2a60862a14" />

_Source: https://dl.acm.org/doi/pdf/10.1145/3712007#page=4.87_

(1) Requirements Engineering must formally define the business case trade-offs, particularly between a system's utility (e.g., accuracy or latency) and its environmental cost.  [4]

(2) Software engineering (SE) has long handled compliance, monitoring, and incident management in critical systems. For AI software, SE practices can be adapted rather than reinvented, ensuring AI systems are reliable and accountable. [4]

(3) In Green AI projects, environmental sustainability should be treated as a dedicated role, like data scientists or domain experts. This can be filled by sustainability professionals or engineers with sufficient expertise in the area. [4]

(4) The research community should create standardized guidelines to help software engineers systematically document the environmental impact of AI experiments. This includes deciding what sustainability information to report.

(5) The education of SE must explicitly incorporate topics on responsible AI and, more specifically, the environmental considerations of AI systems.

(6) Determining task complexity automatically and delegating only the most complex tasks to expensive LLM models [9]

There is a concerning energy overhead from continuously prompting code generation models to converge to a version of the software that can go to production. We need paradigms that minimize trial-and-error iterations to prevent unnecessary effort and resources from being wasted on highly complex AI models.

One potential solution is the use of a context-aware mixture of experts, which can help avoid defaulting to large models when simpler ones could effectively accomplish the task.

### Another fun study on programming languages and energy consumption
#### Which do you think are more energy efficient – compiled or interpreted languages? 

<img width="485" height="357" alt="language energy consumption" src="https://github.com/user-attachments/assets/b4210bcd-0120-44f0-8930-68c600f3f47e" />

_Source: https://dl.acm.org/doi/pdf/10.1109/GREENS66463.2025.00007_


_“AI environmental sustainability needs to be balanced with implementation and maintenance ease.”_

### References: 
1. https://www.technologyreview.com/2025/05/20/1116327/ai-energy-usage-climate-footprint-big-tech/
2. https://www.energy.gov/articles/doe-releases-new-report-evaluating-increase-electricity-demand-data-centers
3. https://www.microsoft.com/en-us/research/wp-content/uploads/2024/03/GPU_Power_ASPLOS_24.pdf
4. Luís Cruz, Xavier Franch, and Silverio Martínez-Fernández. 2025. Innovating for Tomorrow: The Convergence of Software Engineering and Green AI. ACM Trans. Softw. Eng. Methodol. 34, 5, Article 138 (June 2025), 13 pages. https://doi.org/10.1145/3712007
5. Roy Schwartz, Jesse Dodge, Noah A. Smith, and Oren Etzioni. 2020. Green AI. Commun. ACM 63, 12 (December 2020), 54–63. https://doi.org/10.1145/3381831
6. https://www.nytimes.com/2025/04/24/technology/chatgpt-alexa-please-thank-you.html#
7. https://www.cmu.edu/work-that-matters/energy-innovation/measuring-ais-energy-and-environmental-footprint
8. S. Samsi et al., "From Words to Watts: Benchmarking the Energy Costs of Large Language Model Inference," 2023 IEEE High Performance Extreme Computing Conference (HPEC), Boston, MA, USA, 2023, pp. 1-9, doi: 10.1109/HPEC58863.2023.10363447.
9. Terragni, V., Vella, A., Roop, P., & Blincoe, K. (2025). The future of AI-driven software engineering. ACM Transactions on Software Engineering and Methodology, 34(5), 1-20.
10. Saurabhsingh Rajput, Tim Widmayer, Ziyuan Shang, Maria Kechagia, Federica Sarro, and Tushar Sharma. 2024. Enhancing Energy-Awareness in Deep Learning through Fine-Grained Energy Measurement. ACM Trans. Softw. Eng. Methodol. 33, 8, Article 211 (November 2024), 34 pages. https://doi.org/10.1145/3680470
11. Niccolò Marini, Leonardo Pampaloni, Filippo Di Martino, Roberto Verdecchia, and Enrico Vicario. 2025. Green AI: Which Programming Language Consumes the Most? In Proceedings of the 2025 IEEE/ACM 9th International Workshop on Green and Sustainable Software (GREENS '25). IEEE Press, 12–19. https://doi.org/10.1109/GREENS66463.2025.00007 

