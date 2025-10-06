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






# AI Training Data and Copyright Law: A Software Engineering Perspective

From https://cacm.acm.org/opinion/does-using-in-copyright-works-as-training-data-infringe/

## Executive Summary for Software Engineers

Two landmark court decisions (Bartz v. Anthropic, Kadrey v. Meta) directly impact AI/ML development:

- **Transformative use recognized**: Training models on copyrighted data may be fair use
- **Architecture matters**: Streaming training safer than storing pirated datasets
- **Output filtering works**: Technical controls preventing reproduction are legally protective
- **Licensing coming**: Budget for training data acquisition
- **New risk**: "Market dilution" theory targets high-volume content generation products

---

## Core Terms and Definitions

**Fair Use** - Legal exception allowing limited copyrighted material use without permission. *Your training pipeline may qualify case-by-case.*

**Transformative Purpose** - Using material differently than original function. *Statistical analysis for training ≠ content distribution.*

**Training Data** - Datasets used in model training. *Critical artifact requiring legal compliance in acquisition and storage.*

**Market Dilution** - Novel theory that AI-generated content floods markets, harming human creators. *Risk for products generating commercial content at scale.*

**Infringement** - Unauthorized use violating copyright. *Liability risk in data sourcing, training, and outputs.*

---

## 1. Why SE Teams Should Care 

### Engineering Decisions Affected

**Your Pipeline:**
- Which datasets can you legally use?
- How do you validate training data provenance?
- What compliance checks belong in your ML pipeline?

**Your Product:**
- What output filtering must you implement?
- What terms of service protect your system?
- How do you handle user-generated content?

**Your Budget:**
- Data licensing vs. legal risk
- Product liability insurance
- Documentation requirements

### The Two Cases

**Bartz v. Anthropic (Claude)** - June 2025
- Training use: Potentially fair
- Dataset storage: Infringement
- **SE Impact**: Architecture distinguishes liability

**Kadrey v. Meta (Llama)** - June 2025
- Training defense succeeded
- Market dilution warning issued
- **SE Impact**: Output controls critical

---

## 2. Fair Use Framework: Your Risk Assessment Tool 

### Four Factors = Four Engineering Considerations

**Factor 1: Purpose**
- *What does your system do with data?*
- Lower risk: Statistical analysis, pattern extraction
- Higher risk: Redistribution, display
- **Action**: Document transformative purpose in design docs

**Factor 2: Nature of Work**
- *What content are you ingesting?*
- Lower risk: Factual data, permissive licenses
- Higher risk: Creative works (novels, art, music)
- **Action**: Prioritize permissively-licensed datasets

**Factor 3: Amount Used**
- *How much data do you copy?*
- Question: Is copying entire works necessary?
- **Action**: Justify data volume requirements

**Factor 4: Market Effect**
- *Does your product harm original work markets?*
- Direct: Outputs substitute for originals
- Indirect: System floods markets with content
- **Action**: Implement output filtering, usage controls

---

## 3. Transformative Purpose: Your Strongest Defense 

### Why ML Training is "Transformative"

**Original Purpose**: Human reading, entertainment, information transfer

**Your System's Purpose**: Tokenization → Statistical extraction → Model weights

Both judges recognized this technical distinction:

```
Original: Author → Text → Human Reader
Training: Text → Tokenizer → Weights → Probabilistic Outputs
```

### Architecture Matters

**Safer:**
- Ephemeral training (process then discard)
- No permanent copyrighted source storage
- Strong output filters

**Riskier:**
- Persistent databases of copyrighted works
- RAG systems retrieving/displaying originals
- Weak filtering allowing verbatim reproduction

### Best Practice: Document Transformation

```
Pipeline: [Dataset] → [Preprocessing] → [Training] → [Weights]
- Tokenization removes original structure
- Training optimizes statistical parameters  
- Only weights retained, not source texts
- Generated outputs from learned distributions
```

---

## 4. Data Provenance: The Piracy Problem 

### Two Judicial Approaches

**Judge Chhabria (Meta)**: Source provenance matters less if end use is transformative

**Judge Alsup (Anthropic)**: Pirated sources create liability, BUT distinguished:

1. **Training Use** - Copy → Train → Discard = *Potentially fair*
2. **Database Storage** - Download → Store → Archive = *Infringement*

### Engineering Decision Tree

```
Need copyrighted books for training?
├─ Can you purchase legitimate copies?
│  ├─ YES → Purchase and document ✓ (Lowest Risk)
│  └─ NO → License or use alternatives
└─ Using existing datasets?
   ├─ Verify provenance
   ├─ Stream through training (don't store)
   └─ Document due diligence
```

### SE Best Practices

**Data Governance:**
- Verify dataset licenses before use
- Prefer streaming pipelines over storage
- Document acquisition methods
- Budget for legitimate data

---

## 5. Output Filtering: Your Technical Defense

### Meta's Successful Strategy

**Defense**: Implemented filters preventing verbatim reproduction
- Systems generate small chunks only
- No substantial reproductions
- Evidence: AI outputs don't substitute for originals

### Implementation

```python
class OutputFilter:
    def filter_memorized_content(self, text):
        # Check for verbatim reproduction
        # Limit consecutive matching tokens
        # Block known copyrighted passages
        pass
    
    def enforce_chunk_limits(self, output):
        # Prevent substantial portions from single source
        pass
```

### Design Patterns

- **Chunking/Mixing**: Blend multiple patterns, not single-source
- **Similarity Detection**: Check outputs against training corpus
- **Rate Limiting**: Prevent bulk extraction
- **Monitoring**: Log filter triggers for legal defense

---

## 6. Market Dilution: The New Risk 

### What Changed

**Traditional**: Your system can't copy protected works

**New Theory**: Your system can't flood markets with non-infringing content at scale

### Judge Chhabria's Warning

Products enabling mass content generation face liability:
- Thousands of romance novels per day
- Unlimited news articles
- Infinite genre fiction

**Even if outputs don't infringe**, sheer volume may constitute harm.

### Risk by Product Type

**Lower Risk:**
- Code completion, technical docs
- Personalized content
- Scientific writing

**Higher Risk:**
- Genre fiction generators
- News article generators at scale
- Commodity content creation

### Engineering Controls

```python
class UsageLimits:
    DAILY_GENERATION_LIMIT = 10  # per user
    
    def enforce_limits(self, user, request):
        # Track generation volume
        # Escalating costs for bulk use
        # Separate commercial/personal tiers
        pass
```

**Architectural Approach:**
- Design for quality over quantity
- Implement rate limits
- Require human review for commercial use
- Avoid bulk generation features

---

## 7. Actionable Engineering Guidance

### Practical Recommendations

**1. Data Pipeline:**
- ✓ Verify dataset provenance
- ✓ Prefer streaming over storage
- ✓ Document acquisition methods

**2. Model Architecture:**
- ✓ Implement output filtering
- ✓ Monitor for memorization
- ✓ Document transformative purpose

**3. Product Features:**
- ✓ Avoid market flooding features
- ✓ Implement rate limits
- ✓ Design for quality over quantity

**4. Risk Management:**
- Higher risk: Consumer content at scale
- Lower risk: Enterprise tools, code assistance
- Monitor evolving case law

### The Bottom Line

**Current**: Training may be fair use with proper architecture

**Emerging**: Licensing markets developing, dilution theory expanding

**Action Items**:
1. Audit training data sources
2. Implement output filtering
3. Document system architecture
4. Design with dilution risk in mind
5. Establish data governance policies

---

## Summary for Software Engineers

1. **Fair Use as Risk Model**: Evaluate training data across four factors like a security assessment
2. **Transformative Architecture Wins**: Systems that analyze vs. reproduce have strongest defense
3. **Data Provenance Matters**: Verify legitimacy, prefer streaming over storage
4. **Output Filtering Protects**: Technical controls preventing reproduction defended Meta
5. **Licensing Markets Emerging**: Budget for data acquisition
6. **Market Dilution is Novel Risk**: High-volume generation products face new liability
7. **Engineering Decisions Have Legal Weight**: Architecture choices directly impact exposure

---

## Review Questions for Software Engineers

### Question 1: Fair Use Risk Assessment

(a) Define "fair use" in copyright law and explain why it matters to ML engineers building training pipelines. (1 mark)

(b) List the four fair use factors and provide an SE-specific example of how each factor might be evaluated for a training pipeline that uses copyrighted technical documentation to train a code completion model. (2 marks)

(c) You're designing a new ML system that will train on copyrighted code repositories. Conduct a fair use risk assessment by analyzing all four factors, then recommend specific architectural decisions that would strengthen your fair use defense. Consider data sourcing, processing pipeline, storage, and output controls. (3 marks)

---

### Question 2: Transformative Purpose in System Design

(a) Define "transformative purpose" in the context of ML training systems. (1 mark)

(b) Explain why both judges concluded that statistical analysis for model training constitutes transformative use. Describe the technical difference between how original copyrighted works function versus how ML training processes them. (2 marks)

(c) Design two different ML systems: one for (A) a RAG system that retrieves and displays copyrighted technical documentation, and (B) a model trained on the same documentation that generates new technical explanations. Compare their transformative purpose profiles, evaluate which has stronger fair use protection, and propose architectural modifications to strengthen the weaker system's legal position. (3 marks)

---

### Question 3: Data Provenance Engineering

(a) Define "data provenance" in ML engineering and explain what "pirated books" means in the context of training datasets. (1 mark)

(b) Compare Judge Alsup's and Judge Chhabria's positions on using datasets containing pirated content. Explain Alsup's distinction between "transient training use" versus "persistent storage" and why this matters for pipeline architecture. (2 marks)

(c) Your team has access to a large dataset (Books3) with uncertain provenance that would significantly improve your model. Design a decision framework that evaluates: (i) risks of using the dataset, (ii) alternative approaches, (iii) architectural patterns that minimize legal exposure if you proceed, and (iv) documentation requirements. Justify your recommendations using principles from both court decisions. (3 marks)

---

### Question 4: Output Filtering and Market Harm

(a) Define "market harm" as a fair use factor and explain what "output filtering" means in ML systems. (1 mark)

(b) Explain how Meta's output filtering system helped defeat the "lost sales" market harm argument in Kadrey. What technical capabilities did Meta demonstrate, and why were they legally significant? (2 marks)

(c) Design an output filtering system for an LLM-based creative writing assistant. Your design should address: (i) detecting verbatim reproduction from training data, (ii) preventing substantial copying while allowing useful outputs, (iii) logging and monitoring, and (iv) balancing legal protection with product functionality. Include pseudocode for key components and explain how your system provides legal protection. (3 marks)

---

### Question 5: Market Dilution Risk in Product Design

(a) Define the "market dilution theory" introduced by Judge Chhabria and explain why it represents a novel copyright concern for software engineers. (1 mark)

(b) Explain Judge Chhabria's hypothesis about differential impact: which types of content and creators face higher versus lower dilution risk? Provide SE examples of products that would fall into each risk category. (2 marks)

(c) Your company wants to build a content generation API that could be used for various purposes. Design a product architecture and business model that: (i) provides value to users, (ii) mitigates market dilution liability, (iii) implements technical controls, and (iv) includes appropriate usage policies. Compare a "high-risk" implementation versus your "legally-defensible" design, explaining specific technical and policy differences. Evaluate whether your approach fully addresses dilution concerns or whether residual risk remains. (3 marks)

---

### Question 6: Building Legally-Defensible ML Systems

(a) Define what makes an ML training system's architecture "legally defensible" based on the Bartz and Kadrey decisions. (1 mark)

(b) Describe three specific engineering practices that reduce copyright liability in ML development: one related to data acquisition, one to system architecture, and one to output controls. Explain the legal principle each practice addresses. (2 marks)

(c) You're the technical lead for a new GenAI project. Create a comprehensive engineering compliance plan that addresses: (i) training data sourcing and validation strategy, (ii) pipeline architecture decisions that support fair use defense, (iii) output control systems, (iv) monitoring and documentation requirements, (v) product features that minimize dilution risk, and (vi) tradeoffs between legal safety and model performance. Your plan should synthesize lessons from both court cases and anticipate future legal developments. (3 marks)


