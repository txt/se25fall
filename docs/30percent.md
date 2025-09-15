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


# Microsoft CEO says 30% of code written by AI. Really?

## What Actually Happened

In April 2025, Microsoft CEO Satya Nadella made headlines when he claimed that "maybe 20%, 30% of the code that is inside of our repos today...are probably all written by software." This was during a chat with Meta's Mark Zuckerberg at LlamaCon, where Zuckerberg was asking about AI-generated code.[^1]

The tech press ran wild with this. Headlines everywhere proclaimed that AI was already writing nearly a third of Microsoft's code. But here's the thing - if you've worked in large-scale software engineering, that claim should make you pause and think.

## What Nadella Actually Said vs. What Got Reported

Here's where it gets interesting. Looking at the actual video,[^1] Nadella mentions acceptance rates of "30, 40%" and notes it's "much better for Python than C++." Then he says "30% of the code...written by software."

But here's what the headlines said: "Microsoft CEO says 30% of code written by AI."[^2] 

There's two things to note here.
If the acceptance rate is 30-40%, that means developers are rejecting 60-70% of AI suggestions. That's not exactly the "AI is taking over coding" narrative, is it?

Also, notice the sleight of hand? Nadella said "software" - the media reported "AI." These are not the same thing.

Anyone who's worked at a company like Microsoft knows they've been generating code automatically for decades. Build systems spit out thousands of lines from protocol buffer definitions. Template engines expand specifications into concrete implementations. Dependency managers create lock files and manifests. Interface definitions become language bindings. 


## The Timeline Doesn't Add Up

Let's do some basic math here. GitHub Copilot was announced in June 2021. It became a paid service in June 2022.[^3] Microsoft's own research from 2022-2023 showed that even with reminder emails, developer adoption hit only 26% within two weeks of getting access.[^4]

Now is it possible that in roughly three years, Microsoft pivoted 30% of their entire codebase - millions of lines developed over decades - to AI generation? That's not how large software organizations work, especially when they're dealing with mission-critical systems that keep Windows and Office running.

The much more likely explanation is that Nadella was including all the automated code generation that Microsoft has been doing since the 1990s, and the journalists asking the questions didn't know enough to make the distinction.

## Why This Matters for Software Engineering

This isn't just about parsing executive statements. When we fail to distinguish between traditional automated code generation and modern AI tools, we create dangerous misconceptions.

**For Students:** If you think AI is already handling 30% of professional coding work, you might underestimate how much you still need to learn about fundamentals, testing, debugging, and architectural thinking.

**For the Industry:** Organizations might make premature decisions about staffing, tooling, and processes based on inflated claims about AI capabilities.

**For Quality:** Traditional code generation is deterministic and predictable. AI-generated code is probabilistic and requires different validation approaches. Conflating them leads to inappropriate quality assurance practices.

## The Buried Lede: 60-70% Rejection Rate

Here's what should have been the headline: "Microsoft developers reject most AI code suggestions." Nadella's admission that acceptance rates are only 30-40% means developers are saying "no thanks" to the majority of what AI generates.

The research backs this up. GitClear analyzed 153 million lines of changed code and found that code churn rates - the percentage of lines that get reverted or updated within two weeks - are projected to double in 2024 compared to pre-AI baselines.[^5]

Google developers in 2022 had acceptance rates of 25-34% for AI code suggestions.[^6] The pattern is clear: AI generates code fast, but much of it needs significant human intervention or gets rejected outright.

But you won't see "AI Code Rejected 70% of the Time" in the headlines, will you?

And there's another detail that got glossed over: Nadella specifically noted that AI works "much better for Python than C++." This makes perfect sense - Python has simpler syntax and more predictable patterns. But it also means AI coding tools are far from universally capable. They struggle with the complex, systems-level code that often matters most in enterprise software.

## A Simple Reality Check

Here's a thought experiment: If Microsoft really had AI generating 30% of new, novel code across their organization, wouldn't they be shouting specific metrics from the rooftops? Wouldn't they have detailed case studies showing productivity gains? Wouldn't their developer productivity numbers be through the roof?

Instead, we get vague statements at AI conferences from executives who have every incentive to make their companies sound like AI leaders.

## What We Should Demand

As software professionals, we have an ethical obligation to demand better evidence. When executives make claims about AI capabilities, we should ask:

- What exactly are you measuring?
- How do you distinguish between traditional automation and AI generation?
- What's the timeline for these changes?
- What are the quality metrics?
- How much rework is required?

TechCrunch got it right when they noted that "it's unclear how exactly Microsoft and Google are measuring what's AI generated versus not, so these figures are best taken with a grain of salt."[^7]

## The Bottom Line

This is a perfect case study in how AI hype gets manufactured. An executive says "written by software" - the media reports "written by AI." He mentions 30-40% acceptance rates - they bury the 60-70% rejection rate. He notes it works better for Python than C++ - they ignore the limitations.

The 30% figure is probably accurate if it includes all automated code generation Microsoft has been doing for decades. But presenting it as evidence of an AI coding revolution? That's just sloppy journalism mixed with Silicon Valley marketing.

We should neither dismiss AI coding tools nor accept these inflated claims. The tools are useful but limited. They generate a lot of code that gets rejected. They work better for some languages than others. And they're definitely not replacing the traditional automated code generation that enterprises have relied on for years.

Being precise about these distinctions isn't pedantic - it's essential for making rational decisions about tools, careers, and the future of our field.

## The Missing Context: When AI Actually Fails

Here's what gets lost in all the hype around Nadella's comments. The implicit message was clear: "much of our code is written by AI and that's a good thing." But is it actually a good thing? Let's look at what the research shows about AI coding failures.

**The Discretization Disaster**
Here's a real example that illustrates the problem perfectly. Researchers were building a Gaussian discretizer - just four lines of code for data mining. They asked ChatGPT to review their implementation. ChatGPT gave it a glowing endorsement, calling it "a linear approximation to the Gaussian cumulative distribution function" and suggesting it was correct.

Here's the code that ChatGPT approved:

```python
def cdf(x, mu=0, sd=1):
    z = (x - mu) / sd
    if z > 0: return 1 - 0.5 * math.exp(-(0.717*z + 0.416*z*z))
    else: return 0.5 * math.exp(0.717*z + 0.416*z*z)
```

But the code was wrong. When tested with:

```python
[cdf(x-10, 0, 2) for x in range(20)]
```

It exploded to values of 500 on the left side of the curve instead of falling to zero. When the researchers pointed this out to ChatGPT, it went into what they called a "tailspin" - an endless loop of trying failed fixes and never finding a solution.

Meanwhile, a human on stats.stackexchange.com quickly provided the correct fix:

```python
def cdf(x, mu=0, sd=1):
    z = (x - mu) / sd
    return cdf1(z) if z > 0 else 1 - cdf1(-z)

def cdf1(z): 
    return 1 - 0.5 * math.exp(-(0.717*z + 0.416*z*z))
```

Four lines of code. AI couldn't handle it. Humans solved it immediately.[^8]

**The Bigger Picture**
This isn't an isolated case. Research shows that 52% of ChatGPT's programming answers contain incorrect information, and humans miss these errors 39% of the time.[^9] Only 29% of GitHub Copilot's solutions are actually correct - 51% are partially correct, and 20% are just wrong.[^10]

And here's the kicker: LLMs don't just make random mistakes. They reproduce bugs from their training data. Train an AI on code with known bugs, and it eagerly regenerates those same bugs.[^11] They're very good at looking authoritative while being completely wrong.

**What Programmers Actually Do**
The "AI will replace programmers" narrative also misses something fundamental about what programming work actually involves. Microsoft's own research shows that coding is only 17% of a developer's day. The other 83% is debugging (22%), meetings, handling interruptions, mentoring others, answering emails, and testing.[^12]

Even if AI could write perfect code - which it demonstrably cannot - it's solving less than a fifth of what programmers actually do. The rest requires human judgment, domain knowledge, and the ability to handle unexpected situations. You know, like the CrowdStrike incident of July 2024, where a single faulty software update crashed 8.5 million Windows systems worldwide, disrupting airlines, banks, and hospitals.[^13] When something like that happens, you need experienced programmers who can quickly understand what went wrong and figure out how to fix it.

**The Real Risk**
So when Nadella implies that AI code generation is inherently good, he's glossing over some serious problems. AI generates a lot of code quickly, but much of it is wrong, buggy, or inappropriate. The acceptance rates tell the story - even at Microsoft, developers reject most of what AI suggests.

The danger isn't that AI will replace programmers. The danger is that we'll trust it too much, accept too many of its suggestions, and end up with systems that look like they work but fail in subtle, hard-to-debug ways. That's not progress - that's technical debt with a shiny AI wrapper.

 

## References

[^1]: Nadella, S. & Zuckerberg, M. (2025, April 29). LlamaCon 2025 discussion. YouTube. https://www.youtube.com/shorts/Kp9JMJ_2EvQ

[^2]: Zeff, M. (2025, April 29). Microsoft CEO says up to 30% of the company's code was written by AI. TechCrunch. https://techcrunch.com/2025/04/29/microsoft-ceo-says-up-to-30-of-the-companys-code-was-written-by-ai/

[^3]: GitHub Copilot. (2024). Wikipedia. https://en.wikipedia.org/wiki/GitHub_Copilot

[^4]: Measuring Impact of GitHub Copilot. GitHub Resources. https://resources.github.com/learn/pathways/copilot/essentials/measuring-the-impact-of-github-copilot/

[^5]: Coding on Copilot: 2023 Data Suggests Downward Pressure on Code Quality. (2024). GitClear. https://www.gitclear.com/coding_on_copilot_data_shows_ais_downward_pressure_on_code_quality

[^6]: Tabachnyk, M. & Nikolov, S. (2022). ML-Enhanced Code Completion Improves Developer Productivity. Google Research. https://research.google/blog/ml-enhanced-code-completion-improves-developer-productivity/

[^7]: Zeff, M. (2025, April 29). Microsoft CEO says up to 30% of the company's code was written by AI. TechCrunch. https://techcrunch.com/2025/04/29/microsoft-ceo-says-up-to-30-of-the-companys-code-was-written-by-ai/

[^8]: Johnson, B. & Menzies, T. (2024). AI Over-Hype: A Dangerous Threat (and How to Fix It). IEEE Software, 41(6), 131-138.

[^9]: Kabir, S., Udo-Imeh, D. N., Kou, B., & Zhang, T. (2024). Is stack overflow obsolete? An empirical study of the characteristics of ChatGPT answers to stack overflow questions. Proceedings of the CHI Conference on Human Factors in Computing Systems, 1-17.

[^10]: Yetistiren, B., Ozsoy, I., & Tuzun, E. (2022). Assessing the quality of GitHub copilot's code generation. Proceedings of the 18th International Conference on Predictive Models and Data Analytics in Software Engineering, 62-71.

[^11]: Jesse, K., Ahmed, T., Devanbu, P., & Morgan, E. (2023). Large language models and simple, stupid bugs. Proceedings of the IEEE/ACM 20th International Conference on Mining Software Repositories, 563-575.

[^12]: Meyer, A. N., Barr, E. T., Bird, C., & Zimmermann, T. (2021). Today was a good day: The daily life of software developers. IEEE Transactions on Software Engineering, 47(5), 863-880.

[^13]: 2024 CrowdStrike-related IT outages. (2025). Wikipedia. https://en.wikipedia.org/wiki/2024_CrowdStrike-related_IT_outages
