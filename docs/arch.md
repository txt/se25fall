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




# Lecture 1: Architectural Patterns

---

## Glossary of Terms
Layered Architecture  
Event-Driven Architecture  
Microkernel  
Microservices  
Space-Based Architecture  
Client-Server  
Manager-Agent  
Pipe-Filter  
LAMP  
MEAN   
Serverless  
Micro-Frontends  
Hybrid Rendering  
Encapsulation  
Information Hiding  
Service Mesh  

---

## Introduction
Architectural patterns describe recurring structures in software
systems. Each pattern solves a class of problems while introducing
trade-offs. This lecture walks through eight classic patterns and
modern evolutions. I’ll not just describe them, but also highlight
war stories and lessons from decades of practice.

---

## Section 1: Layered Architecture
Layered architecture is the bread and butter of enterprise systems.
It separates code into tiers: presentation, business logic, data
access, and database. Each layer hides its internals behind a stable
interface. This reduces ripple effects when one part changes.

**Case Study:**  
The **LAMP stack** (Linux, Apache, MySQL, PHP) was dominant in the
2000s. Every layer was replaceable. PHP could be swapped with Python,
MySQL with PostgreSQL. I recall projects where we changed database
engines midstream — painful, but possible because the data layer was
well-isolated.

<img width="1176" height="653" alt="image" src="https://github.com/user-attachments/assets/941bd091-d12a-4182-a8c3-fe3b82cdba0d" />


**Lessons Learned:**  
Layering adds clarity but can ossify. Too many layers slow delivery.
At one Fortune 500, I saw a layered insurance app with 13 tiers.
Changing a customer address required edits in 7 of them. This taught
me that abstraction is not free — it can paralyze.

---

## Section 2: Event-Driven Architecture
Event-driven systems decouple producers from consumers. Producers
publish events; consumers react. The pattern thrives where latency
matters.

**Examples:**  
- **Stock trading**: systems like Nasdaq stream trades as events.  
- **IoT health monitors**: wearables send alerts when thresholds
  exceed.  
- **Uber dispatch**: rider requests broadcast to drivers nearby.

<img width="1317" height="685" alt="image" src="https://github.com/user-attachments/assets/71e7893a-cc3d-46d0-93f2-d2553ceaa0fe" />

**Pitfalls:**  
Debugging is hard. Once, we traced a bug in a logistics system for
weeks. The problem was an event handler firing twice under rare load.
Logs showed nothing — events had no global ordering. This scarred me
enough to insist on correlation IDs in every event stream.

**Takeaway:**  
Events scale, but testing and reasoning demand discipline. Without
good observability, event-driven systems rot.

---

## Section 3: Microkernel
A microkernel is a minimal core with plug-in services. Think of it as
a small stage where actors enter and leave.

**Examples:**  
- **Mach kernel**: small OS core, drivers as modules.  
- **Eclipse IDE**: core editor with endless plug-ins.  
- **VS Code**: modern descendent of the same idea.

<img width="737" height="387" alt="image" src="https://github.com/user-attachments/assets/7f7bbe64-3c41-4eda-abb0-c01f02c730ec" />

**Voice of Experience:**  
I once built a GIS tool with a microkernel. It started lean. But
within two years, plug-ins multiplied, each slightly different in API
style. Integrating them was chaos. Microkernels can become plugin
jungles if governance is weak.

---

## Section 4: Microservices
Microservices extend modularity to deployment. Each service is small,
independently deployable, with its own database.


<img width="1391" height="946" alt="image" src="https://github.com/user-attachments/assets/b046a763-93f8-482f-b3eb-e89ba7ed95e6" />

**Case Study: Netflix**  
Netflix migrated from a monolith to hundreds of microservices. Video
encoding, personalization, billing — all separate. This enabled
independent scaling. On a Friday night, recommendation services
saturate while billing idles.

**But:**  
Microservices shift complexity. Networks fail. APIs drift. At a bank
I consulted, the move to microservices ballooned latency. A single
loan application triggered 47 service calls. Debugging required
spanning 10 teams.

**Lesson:**  
Microservices are not a free lunch. They demand DevOps maturity:
monitoring, CI/CD, service meshes. Without that, they collapse under
their own weight.

---

## Section 5: Space-Based Architecture
Here computation happens across a distributed "tuple space," a shared
memory visible to all nodes.

**Use Case:**  
Retailers use it to handle **Black Friday spikes**. A cart update
writes to a space replicated across nodes. No single database choke.

**Pitfalls:**  
State divergence is brutal. Two replicas disagree — who wins? I saw
an e-commerce cart where items vanished if two nodes wrote at once.
Customers screamed. We fixed it with CRDTs, but performance fell.

**Lesson:**  
Space-based shines in extreme scale, but testing and debugging are
expensive. If you don't *need* it, avoid it.

---

## Section 6: Client-Server and Manager-Agent
Client-server is simple: centralized server, many clients. Early email
(POP3, IMAP) and file sharing worked this way.

Client–server describes a distributed system where:

- A client program runs on the user’s machine (browser, mobile app, desktop app, IoT device, etc.).
- A server program runs on another machine, usually more powerful, managing data and shared services.

They talk over a network protocol (HTTP for web apps, but also gRPC, WebSocket, MQTT, raw TCP/UDP, etc.).

The server usually:
- Holds the shared state (databases, files, computation engines).
- Provides APIs or endpoints.
- Serves multiple clients at once, enforcing security, concurrency, and consistency.


Manager-agent extends it. A manager delegates to many agents. Example:
**SNMP** for network monitoring — routers as agents, manager polls
them. 

---

## Section 7: Pipe-Filter
Data flows through filters, each transforming it. Compilers are the
canonical example: lexical analysis → parsing → optimization →
generation.

**Unix Pipes:**  
Ken Thompson added `|` in 1973. Doug McIlroy dreamed it earlier:
*"We should have some ways of coupling programs like garden hose."*
Every engineer should try chaining `grep | sort | uniq`. It shows how
small tools scale better than one bloated app.

Example:

- ad hoc reporting    
  `cat access.log | grep "ERROR" | cut -d' ' -f2 | sort | uniq -c`
- compilers:    
  `Lexical analysis | Parsing | Semantic analysis | Optimization | Code generation`
- video processing:
  `resize | blur | sharpen | colorCorrect | compress`
- text mining:    
  `downcase | tokenise | stemming | stopWords | tfIdf | sort | infoGain | cluster | classify`

**Experience:**  
I’ve seen students reinvent compilers as one giant class. Then they
realize debugging lexing vs parsing is impossible. Breaking into
filters clarifies bugs and allows reuse.

- but pipe and filter is one way street
  - poor choice for interactive GUIs where users can perform operations in any order at all.

---

## Section 8: Web Architecture Evolution
**Then:**  
- **LAMP**: Linux, Apache, MySQL, PHP.  
- **MEAN**: MongoDB, Express, Angular, Node.  

Both layered, easy to teach, widely deployed.

**Now (2025):**  
- **Jamstack**: pre-rendered static sites + APIs.  
- **Serverless**: AWS Lambda, billed per request.  
- **Micro-Frontends**: UI split into modules (Spotify).  
- **Edge logic**: Cloudflare Workers near the user.  
- **Hybrid rendering**: Next.js mixes SSR, CSR, ISR.



---

## Wrap-Up
Patterns offer reusable wisdom. But each carries hidden costs. As
engineers, our job is to ask: does the gain justify the pain? In my
career, I’ve seen every pattern both shine and backfire. Knowing when
*not* to apply a pattern is as valuable as knowing how it works.

---

## Review Questions
1. What risks arise when layering becomes too deep?  
2. How do correlation IDs help in event-driven debugging?  
3. Compare plugin sprawl in microkernels vs service sprawl in
   microservices.  
4. Why does space-based architecture struggle with state divergence?  
5. When should managers distrust agents? Give an example.  
6. Why is Pipe-Filter still relevant in 2025?   
7. Can you recall a system you used that embodied one of these
   patterns? How did it succeed or fail?  

---
