
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

# Why Most AI Startups Are BAD Businesses

<iframe width="560" height="315" src="https://www.youtube.com/embed/OYlQyPo-L4g?si=VGmkKCMie5qtPlKU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


Summary, with Fact-Check Corrections

## The Margin Crisis

- **Traditional SaaS**: Margins typically range 70-90%, with best-in-class SaaS hitting 80%+, industry averaging ~76%, because marginal cost per new customer is near zero
- **AI-native SaaS**: Claimed margins of 30-60% at best, with Claude cited at ~55%
  - ⚠️ **REPORTING ISSUE**: These specific margin numbers are **not publicly disclosed** and appear **speculative**. While the underlying logic about higher compute costs is sound, the exact percentages lack verification
- **"Dead subscriptions"**: AI tool bundles rely on users paying but not using, temporarily masking poor unit economics

## The Exponential Cost Problem

**Verified examples of unsustainable unit economics:**

- **ChatGPT**: Cost OpenAI $700k/day in 2023, now $100k-several hundred thousand/day
- **Power users can cost OpenAI over $200/month** - more than their most expensive plan
- **GitHub Copilot**: Launched at $10/month but cost Microsoft ~$30/month per user to serve; power users cost up to $80/month
- **Midjourney**: Had to strictly limit image generation due to expensive GPU costs per image

## The "All You Can Eat" Paradox

- **Small minority of heavy users can generate exponential costs**
- When companies cap usage, **users get angry and leave**: "Okay, I'm not paying for this"
- **Paywalling is necessary but creates poor user experience**

## ChatGPT's Metrics - Mixed Accuracy

- **✅ VERIFIED**: ~700-800M total users, only ~10-15M paid subscribers
- **Conversion rate**: ~1-2% 
  - ⚠️ **REPORTING ISSUE**: Some sources cite 5-7% conversion, but these numbers are **contested and likely inflated**
- **93%+ users on free plan**, each generating losses due to compute costs
- **Suspicious metrics**: Reported weekly (not monthly) active users, despite site traffic not increasing proportionally

## Competition Reality Check - MAJOR ERRORS

**❌ SIGNIFICANTLY WRONG USER NUMBERS:**

- **ChatGPT**: 300-400M monthly users ✅ 
- **Claude**: Claimed 3M, but **actually ~19M monthly active users** as of early 2025 (**84% undercount**)
- **Gemini**: Claimed 47M, but **actually 400-450M monthly active users** as of 2025 (**90% undercount**)
  - ⚠️ **NUANCE**: Gemini numbers boosted by Google ecosystem integration, may not reflect standalone usage
- **Copilot**: ~33M users across Windows, app and website ✅

👉 **CORRECTION**: ChatGPT still leads, but the claimed **"100x difference"** is massively exaggerated due to severely understated competitor numbers.

## AI Price Wars & Sustainability Crisis

- **Rapid price wars** squeezing margins further
- Companies forced to expand product lines and upsell aggressively  
- **Traditional SaaS metrics don't work** for GenAI products due to exponential usage costs

## What Actually Works

**Sustainable AI businesses typically:**

1. **Solve problems that would be valuable WITHOUT AI** - AI just makes them better/faster
2. **Work with large amounts of text-based data** in accounting, HR, sales, legal
3. **Follow traditional SaaS benchmarks**, not "bubbled up AI metrics"
4. **Examples**: Contract data automation, CRM integrations - not billion-dollar markets, but sustainable businesses

## The Billion-Dollar Opportunity

- **Most difficult unsolved problems**: Complex analytical work in "boring" industries
- **Example**: Software that can truly negotiate in court
- ⚠️ **NUANCE**: These are extremely difficult technical challenges - more moonshot than near-term opportunity

## Bottom Line Metrics That Matter

- **Retention and conversion rates** - the same metrics that have always mattered
- **Litmus test**: "Would this app solve a real problem without AI?" If no, it's probably hype
- **These will outlive VC rounds and hype cycles**

---

## 📊 FACT-CHECK VERDICT

**✅ CORE THESIS HOLDS**: AI-native SaaS faces fundamentally broken unit economics compared to traditional SaaS due to ongoing compute costs

**❌ MAJOR DATA ERRORS**: 
- Competitor user bases massively understated (Claude by 84%, Gemini by 90%)
- AI margin percentages appear speculative without public verification
- Conversion rate disputes exist but directionally accurate

**⚠️ REPORTING QUALITY**: While the economic arguments are logically sound and supported by verified examples (GitHub Copilot losses, ChatGPT costs), the presentation suffers from significant factual inaccuracies that undermine the competitive analysis portion.

**Bottom line**: The economics problem is real, but the competitive landscape is far less one-sided than presented.
