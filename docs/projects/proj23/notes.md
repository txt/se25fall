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

## Notes on Proj2

Dr. Rieder showed me a set of prompts for exploring high level
design concepts. The prompts are interesting since they lead naturally
to design revisions.

This page offers those notes.

Note that NONE of the comments here will be used to grade your work.
Repeat, none, no, zero, zip, nada. So think of these as ideas blowing
by in the wind-- which you can ignore.

That said, I found them insightful. See what you think.

> Note that **NONE** of the comments here will be used to grade
your work. Rpeat, none, no, zero, zip, nada. So think of these as
ideas blowing by in the wind-- which you can ignore.

## Analysis Methods

I gave claude.ai access to all your posters then I asked it to sort
the projects on two axes:

- Social impact.
  1. Individual Benefit Focus (Economic/Personal Need)
  2. Service/Ethical
  3. Transformational/Philanthropic
- Blom hierarchy of lower to higher-order cognition:
  1. Remember - Recall facts and basic concepts,
  2. Understand - Explain ideas or concepts,
  3. Apply - Use information in new situations,
  4. Analyze - Draw connections among ideas, distinguish between parts,
  5. Evaluate - Justify decisions or actions based on criteria,
  6. Create - Produce new or original work, reorganize elements into new patterns.

This returned four quadrants defined by 
(a)low/high social impact and 
(b)low/high congitive complexity
(and "quadrant1" is hight on both).
There is nothing wrong with any of these four quadrants. But as
shown below,
there are standard patterns in how to jump from low to high.

# **5 Tactical Strategies to Reach Quadrant I**
## *Moving Projects to High Complexity + High Social Impact*

---

## **TACTIC 1: Add a "Give Back" Layer** 🎁
### *Increase Social Impact Without Changing Core Product*

**What it is:**
Integrate a charitable/community component into the existing transaction flow that addresses food insecurity, sustainability, or community needs.

**How to implement:**

### **For Q-IV Projects (High Tech, Low Impact):**

**SnapMeal AI (Group 11):**
- **Add:** "Round Up for Food Banks" - users round up orders to nearest dollar, donation goes to local food banks
- **Add:** Partner with nutritionists to provide free meal analysis for low-income families
- **Add:** "Nutrition Education Mode" - share analysis data with community health centers
- **Impact:** Transforms personal health tool → community health resource

**SafeBites (Group 6):**
- **Add:** "Safe Kitchen Program" - free allergen detection for school cafeterias and shelters
- **Add:** Donate 1% of orders to allergy research foundations
- **Add:** Partner with hospitals to provide free allergen scanning for food insecurity clients
- **Impact:** Personal safety tool → public health intervention

**Eatsential (Group 12):**
- **Add:** "Mental Health Partnership" - share anonymized mood-food data with mental health clinics
- **Add:** Free subscriptions for therapy patients working on nutrition/mental health
- **Add:** "Wellness Donation" - users can gift subscriptions to people struggling with depression/eating disorders
- **Impact:** Personal wellness app → mental health support system

### **For Q-III Projects (Low Tech, Low Impact):**

**Booze Buddies (Group 1):**
- **Add:** "Designated Driver Rewards" - customers using sober transportation get discounts
- **Add:** Partner with MADD/alcohol education programs
- **Add:** 5% of alcohol sales fund substance abuse prevention programs
- **Impact:** Convenience app → responsible consumption platform

**ForkCast (Group 26):**
- **Add:** Prioritize/highlight restaurants with sustainable practices
- **Add:** "Discovery Donations" - portion of new restaurant visits donated to local food banks
- **Add:** "Local First" filter - supports neighborhood businesses
- **Impact:** Recommendation app → community economic development tool

---

## **TACTIC 2: Implement AI-Powered Optimization** 🤖
### *Increase Technical Complexity While Solving Problems*

**What it is:**
Upgrade existing features with machine learning, predictive analytics, or LLM-powered intelligence that solves waste, efficiency, or matching problems.

**How to implement:**

### **For Q-II Projects (Low Tech, High Impact):**

**SecondServe (Group 18):**
- **Add:** **ML Demand Forecasting** - predict daily donation volumes by location/day/time
- **Add:** **Smart Routing Algorithm** - optimize volunteer driver routes to minimize trips
- **Add:** **LLM Food Safety Checker** - analyze expiration dates and food quality from images
- **Add:** **Predictive Matching** - match food types to shelter dietary needs automatically
- **Complexity Jump:** APPLY → ANALYZE/CREATE
- **Impact Maintained:** Still feeding hungry, now more efficiently

**Smart WIC Cart (Group 19):**
- **Add:** **AI Meal Planning** - suggest WIC-compliant weekly meal plans
- **Add:** **Price Prediction** - ML model predicts cheapest shopping times/stores
- **Add:** **Nutrition Optimizer** - maximize nutritional value within WIC budget constraints
- **Add:** **Conversational Assistant** - LLM helps navigate complex WIC rules
- **Complexity Jump:** APPLY → CREATE
- **Impact Enhanced:** Better nutrition outcomes for vulnerable families

**EcoBites (Group 22):**
- **Add:** **Carbon Prediction ML** - predict order carbon footprint before purchase
- **Add:** **Waste Forecasting** - predict restaurant waste patterns, notify customers of surplus
- **Add:** **Route Optimization AI** - minimize delivery emissions using traffic + weather data
- **Add:** **LLM Sustainability Coach** - conversational advice on eco-friendly choices
- **Complexity Jump:** APPLY → ANALYZE/EVALUATE
- **Impact Enhanced:** More measurable environmental impact

### **For Q-III Projects (Low Tech, Low Impact):**

**Movie Munchers (Group 1):**
- **Add:** **Predictive Ordering** - ML suggests snacks based on movie genre/length/time
- **Add:** **Inventory Waste Prevention** - forecast concession demand to reduce theater waste
- **Add:** Make partnerships with food banks for end-of-night surplus
- **Complexity Jump:** APPLY → ANALYZE
- **New Impact:** Theater food waste reduction

**NCSU's PackEats (Group 7):**
- **Add:** **Campus Meal Pattern Analysis** - ML identifies peak times, optimizes staff scheduling
- **Add:** **Nutrition Goal Tracker** - AI suggests meals for student health goals
- **Add:** Surplus meal donation program to local shelters at end of day
- **Complexity Jump:** APPLY → ANALYZE
- **New Impact:** Student health improvement + food donation

---

## **TACTIC 3: Create Multi-Stakeholder Matching/Coordination** 🤝
### *Increase Complexity by Solving Coordination Problems with Social Value*

**What it is:**
Build systems that coordinate multiple parties to achieve outcomes impossible individually—waste redistribution, resource pooling, community organizing.

**How to implement:**

### **For Q-IV Projects:**

**Food Seer (Group 13):**
- **Add:** **"Restaurant Rescue Network"** - when users reject recommendations, match food to:
  - Other nearby customers (cancel-to-redistribute like ByteBite)
  - Food banks for end-of-day surplus
  - Compost programs for non-salvageable items
- **Add:** **Multi-Customer Group Ordering** - AI suggests shared orders for office buildings, dorms
- **Add:** **Surplus Prediction → Proactive Donation** - restaurant analytics predict overproduction, auto-schedule pickups
- **Complexity Jump:** EVALUATE → CREATE (multi-party coordination)
- **New Impact:** Food waste prevention + community feeding

**Hungry Wolf (Group 14):**
- **Add:** **"Quest for Good"** - gamified challenges with social missions:
  - "Support 5 local restaurants this month" (community economic)
  - "Choose 10 plant-based meals" (environmental)
  - "Donate surplus meals to shelters" (food insecurity)
- **Add:** **Team Quests** - groups compete to reduce collective food waste
- **Add:** Points convert to donations to food banks (users choose charity)
- **Complexity Maintained:** Still gamified, but coordination
- **New Impact:** Gamification → behavior change for social good

### **For Q-III Projects:**

**Pack2Go (Group 5):**
- **Add:** **Cross-Campus Pooling** - coordinate orders across multiple universities
- **Add:** **Surplus Sharing Network** - users can donate unused credits to food-insecure students
- **Add:** **Community Bulk Orders** - entire dorms/buildings pool for waste reduction
- **Add:** **Driver Carbon Offset** - coordinate deliveries to minimize environmental impact
- **Complexity Jump:** APPLY → ANALYZE (complex routing + matching)
- **New Impact:** Student food insecurity support + environmental

**FoodPool (Group 15):**
- **Add:** **Public Good Pools** - users create pools to buy for shelters/food banks (crowdfunding model)
- **Add:** **Restaurant Surplus Pools** - coordinate end-of-day purchases for donation
- **Add:** **Cross-Neighborhood Coordination** - optimize delivery across areas for efficiency
- **Add:** Environmental impact dashboard showing collective CO₂ savings
- **Complexity Jump:** APPLY → ANALYZE (multi-pool optimization)
- **New Impact:** Community organizing for food security

---

## **TACTIC 4: Build Predictive/Preventive Systems** 📊
### *Move from Reactive to Proactive Using Data Intelligence*

**What it is:**
Shift from responding to problems after they occur to predicting and preventing them using data analysis, forecasting, and early intervention.

**How to implement:**

### **For Q-II Projects:**

**Weeklies (Group 9):**
- **Add:** **Restaurant Capacity Balancing** - predict demand, prevent overproduction waste
- **Add:** **Nutrition Gap Analysis** - identify community-wide dietary deficiencies, suggest solutions
- **Add:** **Food Insecurity Prediction** - identify at-risk users, proactively offer assistance programs
- **Add:** **Supply Chain Optimization** - help restaurants reduce waste through predictive ordering
- **Complexity Jump:** APPLY → EVALUATE (prescriptive analytics)
- **Impact Enhanced:** Systemic waste prevention

### **For Q-III Projects:**

**WolfCafe+ (Group 16):**
- **Add:** **Campus Food Waste Forecasting** - predict overproduction by dining hall/time
- **Add:** **Student Food Insecurity Detection** - identify struggling students, connect to resources
- **Add:** **Demand Prediction for Suppliers** - reduce supply chain waste
- **Add:** **Meal Plan Optimization** - help students maximize nutrition within budget
- **Complexity Jump:** APPLY → ANALYZE/EVALUATE
- **New Impact:** Campus hunger support + institutional waste reduction

**Calorie Connect (Group 2):**
- **Add:** **Community Health Analytics** - aggregate data to identify food deserts, nutrition gaps
- **Add:** **Restaurant Health Score Prediction** - evaluate menus for public health impact
- **Add:** Partner with public health departments to address community dietary issues
- **Add:** **Preventive Health Focus** - predict and prevent diet-related diseases
- **Complexity Jump:** ANALYZE → EVALUATE
- **New Impact:** Public health intervention

---

## **TACTIC 5: Add Closed-Loop/Circular Economy Features** ♻️
### *Create Systems Where Waste Becomes Input*

**What it is:**
Design features where outputs from one process become inputs for another, creating regenerative cycles that reduce waste and create social value.

**How to implement:**

### **Universal Applications:**

**The Circular Model:**
```
Customer Order → Meal Consumed → Leftovers/Surplus → 
  → Route A: Discount to next customer (ByteBite model)
  → Route B: Donate to food bank (SecondServe model)
  → Route C: Compost collection → Urban farms → Restaurant ingredients
  → Route D: Package return → Clean → Reuse
```

### **Specific Examples:**

**Food Print (Group 5):**
- **Add:** **"Taste Community"** - users share leftovers with neighbors via app
- **Add:** **Compost Network** - coordinate leftover collection for urban farms
- **Add:** **Restaurant Ingredient Recycling** - surplus → stock/soup programs
- **Add:** Connect users with excess garden produce to restaurants
- **Complexity Jump:** CREATE (already high) → Systems thinking
- **New Impact:** Local food system regeneration

**HOWL2GO (Group 27):**
- **Add:** **"Food Rewind Rescue"** - past favorites that are being wasted → discounted offers
- **Add:** **Packaging Return Program** - reusable containers with deposit system
- **Add:** **Automatic Surplus Donation** - ML identifies overstock, triggers donation workflow
- **Add:** **Streak-based Waste Challenges** - gamify zero-waste ordering
- **Complexity Maintained:** CREATE level
- **New Impact:** Waste elimination system

**RouteDash (Group 20):**
- **Add:** **"Rescue Route"** - add option to pick up surplus food along route for donation
- **Add:** **EV Charging Optimization** - route includes optimal charging + food waste pickup
- **Add:** **Traveling Food Bank** - users can become mobile donation coordinators
- **Add:** Carbon offset through route efficiency
- **Complexity Jump:** APPLY → ANALYZE (multi-objective route optimization)
- **New Impact:** Mobile food rescue network

---

## **SUMMARY TABLE: TACTICS BY CURRENT QUADRANT**

| Current Quadrant | Best Tactics | Example Projects | Outcome |
|------------------|--------------|------------------|---------|
| **Q-IV** (High Tech, Low Impact) | #1 (Give Back), #3 (Coordination) | SnapMeal AI, SafeBites, Food Seer | Maintain tech, add social mission |
| **Q-III** (Low Tech, Low Impact) | #2 (AI), #5 (Circular) | Movie Munchers, ForkCast, Stack Shack | Increase both dimensions |
| **Q-II** (Low Tech, High Impact) | #2 (AI), #4 (Predictive) | SecondServe, Smart WIC Cart, EcoBites | Add intelligence to scale impact |
| **Q-I** (Already there) | #5 (Circular), #4 (Preventive) | VibeDish, Tiffin Trails, ByteBite | Deepen and sustain impact |

---

## **IMPLEMENTATION PRIORITY:**

### **Quickest Wins (1-2 weeks):**
- Tactic #1 (Give Back Layer) - add donation button/partnership
- Tactic #5 (Circular) - add surplus redistribution feature

### **Medium Term (4-6 weeks):**
- Tactic #3 (Coordination) - build multi-party matching
- Tactic #4 (Predictive) - basic ML forecasting

### **Long Term (8+ weeks):**
- Tactic #2 (Full AI) - comprehensive ML/LLM integration
- Tactic #5 (Complete Circular) - end-to-end regenerative system


