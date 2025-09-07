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





# COBOL: The Language That Refused to Die
*A comprehensive analysis of the 65-year-old programming language that powers the global economy*

## The Staggering Reality: By the Numbers

**800 billion lines of COBOL code** are currently running in production systems worldwide as of 2024—nearly quadruple the 220 billion estimated by Reuters in 2017. This massive codebase supports over $3 trillion in daily global commerce through transaction processing, making COBOL arguably the most economically vital programming language on Earth.

As of 2020, COBOL runs background processes 95% of the time a credit or debit card is swiped. In the United States alone, 43% of core banking systems are built on COBOL, handling 95% of ATM swipes and 80% of in-person transactions. About 70% of global financial transactions happen on applications powered by COBOL.

## Origins and Design Philosophy

Created in 1959 for business computing, COBOL (COmmon Business-Oriented Language) was designed with one primary goal: readability over brevity. The language was created to be self-documenting and highly readable, using English-like syntax such as "MOVE x TO y" rather than mathematical symbols.

COBOL materialized thanks to inspired thinking by 3 pioneering women, with Grace Hopper receiving much of the credit. The language was built for portability—COBOL has been engineered to work on over 500 recognized unique platforms, making it the original "write once, run anywhere" technology.

## The Recruitment Crisis: A Numbers Game

### The Aging Workforce
The average age of a COBOL developer is between 45 and 55, with only an estimated 24,000 COBOL programmers in the US. In 2017, Reuters reported that COBOL programmers were most likely to be between 45-55 years old. This demographic reality creates an urgent skills crisis as these professionals approach retirement.

### Salary Premiums: The Market Speaks

The scarcity of COBOL talent has created significant wage premiums:

- **Average COBOL programmer salaries** range from $81,516 to $107,620 annually
- Glassdoor reports average COBOL programmer salaries of $93,187, with top earners making up to $157,282
- Senior COBOL programmers average $116,034, with total compensation ranging from $85k to $165k
- In premium markets like San Jose, CA, COBOL programmers can earn $212,483—97% greater than the US average

Hourly rates range from $40.38 to $95.43, with the average at $58.25 per hour. Looking at mid-range dev salaries in the UK, the potential savings from automated documentation tools could reach around £100k minimum per project, and realistically two to three times higher for senior COBOL developers.

## The Cost of Change: Why Replacement Is Economically Prohibitive

### Real-World Replacement Disasters

The few organizations that have attempted complete COBOL system replacements provide sobering cost lessons:

**Commonwealth Bank of Australia**: Replaced its core banking platform in 2012 with help from Accenture and SAP. The project took five years and cost more than 1 billion Australian dollars ($749.9 million)—almost double the original budget of AU $580 million and nearly two years behind schedule.

**TSB Bank**: In 2018, TSB attempted to upgrade its computer system while migrating a billion customer records. The upgrade failed catastrophically, preventing customers from accessing accounts and causing some to see other people's account information. The migration cost ended up being 330 million pounds, plus TSB lost 49.1 million pounds from financial fraud during the system meltdown.

**New York Times**: Successfully rewrote its COBOL-based newspaper-circulation system in Java, but the project took longer than expected due to the "vexing" challenge of ensuring the new system replicated every function of the old one.

### Government Maintenance Costs

The federal government spent roughly $90 billion in 2017 maintaining legacy systems—approximately 80% of its entire IT budget. While the Y2K crisis ended up being less catastrophic than feared, roughly $320 billion was spent worldwide evaluating and fixing systems.

A single example: Dave Brown, Systems Architect at The Bank of New York Mellon, reported in 2012 that his bank had 343 million lines of COBOL code to maintain.

## Real-World Examples: COBOL in Crisis and Recovery

### The COVID-19 Unemployment Insurance Meltdown

The 2020 pandemic exposed the critical dependency on COBOL systems in dramatic fashion:

**New Jersey's Crisis**: Governor Phil Murphy made headlines when he publicly appealed for COBOL programmers to help fix the state's unemployment insurance system, which runs on 40-year-old mainframes. The state experienced a 1,600% surge in unemployment claims, overwhelming systems written in COBOL.

The systems were so outdated that they couldn't quickly implement the CARES Act's $600 weekly unemployment boost. Congress would have preferred to raise the percentage of lost wages covered, but states said it would take five months or longer to change the reimbursement percentage due to their ancient systems.

**National Impact**: At least a dozen states were found to still be using COBOL in some capacity, including California, Rhode Island, Iowa, Connecticut, and Kansas. States like Connecticut had backlogs of five weeks, and systems hadn't been modernized for decades.

### The COBOL Cowboys to the Rescue

75-year-old Bill Hinshaw founded a company called COBOL Cowboys in northern Texas, maintaining a roster of 350 IT veterans ready to deploy for COBOL crises. Their client list includes at least five banks, and their company slogan is "Not our first rodeo."

Hinshaw told Reuters: "Some of the software I wrote for banks in the 1970s is still being used." During the pandemic, Hinshaw reported that recent press coverage brought visitors from 125 countries to their website and over 300 requests to join their group.

## Why COBOL Survives: The Business Case for Stability

### Strategic Importance

A 2024 survey found that 92% of respondents said their organizations' COBOL applications are "strategic with future IT strategy." 52% of those surveyed expect their COBOL systems to last another 10 years.

50% of companies surveyed believe they will be using more COBOL code in 12 months than they currently do. This isn't stagnation—it's active investment in proven technology.

### Technical Advantages

**Performance**: COBOL's fixed-format syntax optimizes code generation, enabling execution with minimal overhead. Its comprehensive file handling and indexed access support facilitate rapid data retrieval, delivering superior batch-processing performance.

**Security**: COBOL's resilient design enforces strict data typing rules and extensive data validation processes, mitigating the risk of data corruption and security breaches. It ensures transaction atomicity and consistency, protecting sensitive information in critical systems.

**Reliability**: There are 200 times as many COBOL transactions that take place each day than Google searches—a figure which puts the influence of Web 2.0 into stark perspective.

### The Hidden Economics

One programmer commented: "What you have to remember is that when the COBOL code was written, it replaced hundreds, maybe thousands of people doing manual data entry and manipulation, maybe even pen-on-paper. That gives you a fantastic return on investment. After that's been done, replacing one computer system with a newer one is completely different, a spectacular case of diminishing returns."

A financial invoice processing system built on COBOL that's responsible for processing €4.5 billion in revenue represents the kind of mission-critical infrastructure that companies cannot afford to risk during modernization.

## The Modernization Paradox

### Why "Modern" Isn't Always Better

COBOL experts argue that the programming language itself isn't the problem—it's the aging hardware it runs on. Derek Britton, product director at Micro Focus, states: "COBOL is not the issue. COBOL is famously highly portable, which means most of the application code can move platform without issue."

COBOL has never left the charts of popular programming languages based on internet traffic. In January 2024, it ranked number 20 on the TIOBE index of most popular languages by internet traffic.

### The AI Solution

Generative AI is emerging as a potential solution for COBOL modernization. New tools can analyze, understand, and automatically document legacy systems, reducing the risk and cost of modernization projects. This approach could remove many of the current blockers for transitioning away from COBOL.

## The Bottom Line: Economic Reality

COBOL isn't surviving because of nostalgia or bureaucratic inertia—it's thriving because it works, and replacing it is prohibitively expensive and risky. As one veteran programmer noted, COBOL was "optimized for precisely that task: processing gazillions of transactions."

The language that was supposed to be a "stop-gap measure" has become the invisible foundation of the global economy. Philip Teplitzky, who's programmed COBOL for decades across U.S. banks, puts it bluntly: "The second most valuable asset in the United States—after oil—is the 240 billion lines of COBOL."

With 800 billion lines of code supporting $3 trillion in daily commerce, COBOL has achieved something remarkable: it has become too big to fail, too expensive to replace, and too critical to ignore. The language that refused to die has instead become immortal—at least until something dramatically better, cheaper, and safer comes along.

*And given the track record of attempted replacements, that day may be further away than anyone imagines.*
