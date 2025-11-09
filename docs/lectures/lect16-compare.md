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
<h1 align="center">:cyclone: CSC510: Software Engineering<br>
NC State, Fall '25</h1>

---

<h1 align="center">🌍 The Programming Language Landscape<br>
Beyond Python's Walls</h1>

> *"A language that doesn't affect the way you think about programming 
> isn't worth knowing."* — Alan Perlis

> *"Humans are the apes that mark territory with language."* — This 
> lecture

---

## 🎯 The Brutal Truth

**You will NOT code in Python for the rest of your life.**

Languages come and go. Python itself replaced Java which replaced C++ 
which replaced C. Whatever you learn today will be obsolete in 10 
years.

**But paradigms persist.** Learn the patterns, not just the syntax.

**Today's map:**
1. **Programming paradigms** — the four fundamental approaches
2. **Language features that matter** — type systems, memory models
3. **Why languages win or lose** — it's not technical merit
4. **The polyglot reality** — most systems use 5+ languages
5. **When to adopt a new language** — the decision framework

---

## 🗺️ Part 1: The Four Programming Paradigms

**Paradigm = fundamental approach to structuring computation.**

| Paradigm | Central Concept | Languages |
|----------|----------------|-----------|
| Procedural | Sequence of commands | C, Pascal, BASIC |
| Object-Oriented | Objects send messages | Java, C++, Smalltalk |
| Functional | Functions transform data | Haskell, Lisp, Clojure |
| Logic | Facts + inference rules | Prolog, SQL |

**Key insight:** Learning a language in a new paradigm changes how you 
think. Learning another C-like language doesn't.

---

### Procedural: Control Flow is King

**Philosophy:** Data is secondary, procedures are primary.

```python
# Procedural style
total = 0
for item in items:
    if item.price > 10:
        total += item.price * 0.9
    else:
        total += item.price
```

**Strengths:**
- Simple mental model (do this, then that)
- Efficient execution (maps to machine code)
- Easy to debug (follow the steps)

**Weaknesses:**
- Poor reusability (logic tied to data structures)
- State management complexity (globals, side effects)

---

### Object-Oriented: Data is King

**Philosophy:** Data is primary, procedures are secondary. Bundle them 
together.

```python
# Object-oriented style
class ShoppingCart:
    def __init__(self):
        self.items = []
    
    def total(self):
        return sum(item.price * item.discount() 
                   for item in self.items)
```

**Smalltalk's radical idea (1970s):** Everything is an object. Even 
control flow.

---

### Smalltalk's Inversion of Control

**In C, to change a `for` loop, you modify the compiler. In Smalltalk, 
you override a method.**

```smalltalk
"Loops are methods on Integer class"
5 timesRepeat: [Transcript show: 'Hello'].

"Implementation in Integer class:"
Integer >> timesRepeat: aBlock
    1 to: self do: [:i | aBlock value]

"For loops with different steps:"
1 to: 10 by: 2 do: [:i | Transcript show: i].
"Output: 1 3 5 7 9"

"Counting down:"
10 to: 1 by: -1 do: [:i | Transcript show: i].
```

**The Hollywood Principle:** "Don't call us, we'll call you."

You pass YOUR code (blocks) to THEIR methods (Integer). They decide 
when to execute it.

**Control flow hierarchy in Smalltalk:**
```
Object
  └─ Magnitude
      └─ Number
          └─ Integer  ← timesRepeat: lives here (7 levels deep!)
```

**If statements are methods too:**
```smalltalk
"Class True implements:"
True >> ifTrue: trueBlock
    ^ trueBlock value

True >> ifFalse: falseBlock  
    ^ nil

"Class False implements opposite"
False >> ifTrue: trueBlock
    ^ nil

False >> ifFalse: falseBlock
    ^ falseBlock value

"Usage - the boolean object decides:"
(x > 5) ifTrue: [Transcript show: 'big']
        ifFalse: [Transcript show: 'small'].
```

**You can add your own control structures** without compiler changes:

```smalltalk
"Add to Integer class:"
Integer >> downTo: stop do: aBlock
    | current |
    current := self.
    [current >= stop] whileTrue: [
        aBlock value: current.
        current := current - 1
    ]

"Use it:"
10 downTo: 1 do: [:i | Transcript show: i].
```

**This is OOP taken to its logical extreme.** Control flow is just 
message passing. Everything is customizable.

---

**Strengths:**
- Encapsulation (hide implementation)
- Polymorphism (same interface, different behaviors)
- Reusability (inheritance, composition)
- Extensibility (add control structures as methods)

**Weaknesses:**
- Tight coupling (objects hold references to each other)
- Complexity (deep inheritance hierarchies)

---

### Functional: Transformations are King

**Philosophy:** Computation is applying functions to data. No mutation.

```python
# Functional style
def apply_discount(item):
    return item.price * 0.9 if item.price > 10 else item.price

total = sum(map(apply_discount, items))
```

**Strengths:**
- Easier to test (pure functions)
- Easier to parallelize (no shared state)
- Easier to reason about (no side effects)

**Weaknesses:**
- Steeper learning curve (recursion, immutability)
- Can be less efficient (copying instead of mutating)

---

### Logic: Inference is King

**Philosophy:** Declare facts and rules. Let the system infer results.

```prolog
% Facts
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).

% Rule
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% Query
?- grandparent(tom, ann).
% yes
```

**SQL is logic programming:**
```sql
SELECT customer.name
FROM orders
JOIN customers ON orders.customer_id = customers.id
WHERE orders.total > 100;
```

**Strengths:**
- Declarative (say what, not how)
- Powerful for certain domains (databases, AI)

**Weaknesses:**
- Limited applicability
- Performance unpredictable

---

## 🔧 Part 2: Language Features That Matter

**Syntax is superficial. These features change how you work:**

---

### Type Systems: Compile vs Runtime Checking

**Dynamic typing (Python, Ruby, JavaScript):**
```python
x = 5
x = "hello"  # Fine! Type changes at runtime
```

**Static typing (Rust, Java, TypeScript):**
```rust
let x: i32 = 5;
x = "hello";  // Compile error!
```

**The tradeoff:**

| Dynamic | Static |
|---------|--------|
| Faster to write | Slower to write |
| Runtime errors | Compile-time errors |
| Easy to prototype | Easier to refactor |
| Fewer type annotations | More type annotations |

**Type inference (best of both):**
```rust
let x = 5;  // Compiler infers i32
let y = "hello";  // Compiler infers &str
```

Rust, Haskell, TypeScript give you safety without annotation overhead.

---

### Memory Management: Manual vs Garbage Collection

**Manual (C, C++):**
```c
int* ptr = malloc(sizeof(int) * 100);
// ... use ptr ...
free(ptr);  // You must remember to free!
```

**Garbage collected (Python, Java, Go):**
```python
x = [1, 2, 3]  # Allocated
# When x goes out of scope, memory freed automatically
```

**Ownership (Rust):**
```rust
let s1 = String::from("hello");
let s2 = s1;  // s1 is now invalid!
// println!("{}", s1);  // Compile error
```

**The tradeoff:**

| Manual | GC | Ownership |
|--------|----|----|
| Full control | Automatic | Automatic + control |
| Easy to leak | Pauses for collection | No pauses |
| No overhead | Runtime overhead | Compile-time checks |

---

### Compilation Models: Interpret vs Compile vs JIT

**Interpreted (Python, Ruby):**
```
Source code → Interpreter → Execution
```
- Fast to start, slow to run
- Easy to debug (REPL)

**Compiled (C, Rust, Go):**
```
Source code → Compiler → Binary → Execution
```
- Slow to start, fast to run
- Catches errors early

**Just-In-Time (Java, C#, JavaScript):**
```
Source code → Bytecode → JIT Compiler → Machine code
```
- Balance of both approaches
- Optimizes hot paths at runtime

**Example: Python's recursion limit (~1000) vs Haskell's (unlimited).**

Python interprets each call. Haskell compiles with tail call 
optimization.

---

## 🎪 Part 3: Why Languages Win (It's Not Technical Merit)

**Lisp was technically superior in 1960. It lost. Why?**

### Ecosystem > Language Features

**The hidden costs:**
1. **Libraries** — Can I do X without writing it from scratch?
2. **Tools** — IDE support, debuggers, profilers
3. **Documentation** — Is it complete? In my language?
4. **Community** — Can I get help on Stack Overflow?
5. **Hiring** — Can I find developers who know this?

**Python won for ML/AI not because it's fast (it's slow) but because 
NumPy, PyTorch, and TensorFlow exist.**

---

### Network Effects: Vendor Lock-In

**Java history:**
- 1995: Created by Sun Microsystems (scrappy startup)
- 2010: Oracle acquires Sun
- Now: Corporate language serving Oracle's goals

**C# history:**
- Microsoft's response to Java
- Excellent tooling (Visual Studio)
- Locked to Windows ecosystem (initially)

**Eclipse IDE:**
- Named to "eclipse" the Sun (Java's creator)
- IBM's attempt to control Java ecosystem
- We mark territory with language

**Why MS-DOS uses backslash (`\`) and Unix uses forward slash (`/`):**
Microsoft needed a product to sell that wasn't someone else's.

---

### Historical Context: Right Time, Right Place

**C++ won because:**
- Objects were hot in the 1990s (Smalltalk influence)
- C was already everywhere
- Adding `class` to C was an easy sell

**Rust is winning now because:**
- Memory safety is critical (security vulnerabilities)
- Systems programming needs a C replacement
- Backing from Mozilla, then industry adoption

**JavaScript won because:**
- Only language browsers could run
- Web exploded in the 2000s
- No technical merit required

---

## 🏢 Part 4: The Polyglot Reality

**Real systems use 3-5 languages minimum.**

### Example: Typical Web Startup Stack

```
Frontend:     TypeScript (type-safe JavaScript)
Backend:      Python (business logic)
Infrastructure: Go (APIs, services)
Database:     SQL (queries)
Config:       YAML (deployment)
Build:        Bash (scripts)
Mobile:       Swift (iOS), Kotlin (Android)
```

**Why?** Each language optimizes for different concerns.

---

### Language Boundaries = Architectural Boundaries

**Microservices enable language diversity:**
- Service A: Python (ML model serving)
- Service B: Rust (high-throughput data processing)
- Service C: Go (API gateway)
- Communication: JSON over HTTP

**Monoliths force language uniformity.**

**The tradeoff:**
- **Monolith:** Simple deployment, complex language
- **Microservices:** Complex deployment, simple per-service

---

### When to Introduce a New Language

**Good reasons:**
1. **Performance critical** — Rust for hot paths in Python system
2. **Domain-specific strengths** — R for statistics, SQL for queries
3. **Team expertise** — Developers already know it
4. **Ecosystem advantage** — Libraries only exist in language X

**Bad reasons:**
1. **Resume-driven development** — "I want to learn Haskell"
2. **Hype** — "Everyone's talking about language X"
3. **Not-invented-here syndrome** — "We can do better"

**Cost of adding a language:**
- Hiring pool shrinks
- Onboarding complexity increases
- Integration overhead
- Split attention on tooling

**Rule of thumb:** Resist adding languages. When you do, have a really 
good reason.

---

## 🚀 Part 5: Languages to Watch

### Rust: Systems Programming's Future?

**What it is:** Memory-safe systems language without garbage 
collection.

**Why it matters:**
- Linux kernel now accepts Rust code (2022)
- AWS, Microsoft, Google investing heavily
- Replaces C/C++ without memory bugs

**The catch:** Steep learning curve. Compiler fights you constantly.

```rust
fn main() {
    let s1 = String::from("hello");
    let s2 = s1;  // s1 is now invalid
    // println!("{}", s1);  // Won't compile
    println!("{}", s2);  // OK
}
```

**When to use:** Performance-critical systems, embedded systems, tools.

---

### TypeScript: JavaScript with Types

**What it is:** Superset of JavaScript with static typing.

**Why it matters:**
- Catches bugs at compile time
- Better IDE support (autocomplete, refactoring)
- Gradual adoption (valid JS is valid TS)

```typescript
function greet(name: string): string {
    return `Hello, ${name}`;
}

greet(42);  // Compile error: Expected string, got number
```

**When to use:** Any JavaScript project above toy size.

---

### Go: Google's Pragmatic Language

**What it is:** Simple, fast, concurrent language for services.

**Design philosophy:**
- Minimal features (no generics until recently)
- Fast compilation
- Built-in concurrency (goroutines)

```go
func main() {
    go doSomething()  // Runs concurrently
    go doSomethingElse()
    time.Sleep(1 * time.Second)
}
```

**When to use:** APIs, microservices, CLI tools.

---

### Kotlin: Android's Official Language

**What it is:** Modern JVM language, interoperable with Java.

**Why it matters:**
- Fixes Java's annoyances (null safety, conciseness)
- Official Android language (2017)
- Can call Java libraries seamlessly

```kotlin
// Nullable types explicit
var name: String? = null
name?.let { println(it) }  // Safe call

// Data classes (no boilerplate)
data class User(val name: String, val age: Int)
```

**When to use:** Android development, JVM projects wanting modern 
features.

---

## 📖 Part 6: Learning New Languages

**Skill progression:**

**Level 1: Syntax Tourist**
- Can write "Hello World"
- Knows basic syntax
- Translates Python patterns directly

**Level 2: Idiom User**
- Writes code that "looks right" to native speakers
- Uses language-specific patterns
- Understands standard library

**Level 3: Paradigm Shifter**
- Thinks differently in this language
- Sees problems the language is designed for
- Can teach the language's philosophy

**How long?**
- Syntax tourist: 1 week
- Idiom user: 3 months
- Paradigm shifter: 1-2 years

---

### The Right Way to Learn

**Don't:**
- Read entire manual cover to cover
- Try to learn "everything" before building
- Translate your favorite language line-by-line

**Do:**
1. **Build something small** — 100-line program
2. **Read idiomatic code** — Study the standard library
3. **Find a mentor** — Code reviews from experienced user
4. **Learn one paradigm at a time** — Don't jump from Python to 
   Haskell

**Best learning path:** Python → Go (different idioms, same paradigm) 
→ Haskell (different paradigm).

---

## 🧪 Part 7: Language Design Lessons

**Why Python's lambda is limited:**
```python
# Only single expression allowed
double = lambda x: x * 2

# Can't do this:
# lambda x:
#     y = x * 2
#     return y + 1
```

**Why?** Guido van Rossum wanted to discourage over-clever code. 
Explicit is better than implicit.

---

**Why Python has the GIL (Global Interpreter Lock):**
- CPython uses reference counting for memory
- Protecting refcounts from race conditions = overhead
- Solution: One thread executes Python at a time
- Consequence: No true parallelism in pure Python

**Lesson:** Early design decisions have permanent consequences.

---

**Why C++ templates are a mess:**
```cpp
template<typename T>
T max(T a, T b) {
    return a > b ? a : b;
}
```

Templates are Turing-complete. People build entire programs executed 
at compile time. The specification is incomplete after 30+ years.

**Lesson:** Features interact in unexpected ways. Simplicity is hard.

---

## 🎯 Part 8: Practical Guidance

### Which Language Should I Learn Next?

**If you know Python:**
- **Learn Go** — different idioms, same level of abstraction
- **Learn JavaScript** — ubiquitous in web, event-driven thinking
- **Learn Rust** — systems-level understanding, ownership model

**What NOT to learn next:**
- Ruby (too similar to Python)
- Java (too similar to Python)

**The goal:** Expand your paradigm toolkit, not collect syntax.

---

### Reading the Job Market

**Backend/Services:**
- Python, Go, Java remain dominant
- Rust growing for performance-critical services

**Frontend:**
- JavaScript/TypeScript monopoly
- No real alternatives (WebAssembly niche)

**Mobile:**
- Swift (iOS), Kotlin (Android)
- React Native (JavaScript cross-platform)

**ML/AI:**
- Python overwhelmingly dominant
- Julia growing in scientific computing

**Systems/Embedded:**
- C still king
- Rust making inroads

---

### The Two-Language Strategy

**Recommendation:** Master two languages in different paradigms.

**Example combinations:**
- Python (scripting, ML) + Rust (performance)
- JavaScript (frontend) + Go (backend)
- Java (enterprise) + Python (data science)

**Why two?**
- Broadens thinking (different paradigms)
- Covers most job markets
- Prevents language lock-in

**Why not more?**
- Maintenance burden (keeping skills fresh)
- Shallow knowledge in many vs deep in few
- Divided attention on tooling/ecosystem

---

## 🎭 Part 9: Domain-Specific Languages (DSLs)

**Sometimes the best language is one you create.**

### External DSLs: New Syntax

**Examples you already use:**
- **SQL:** Database queries
- **Regex:** Pattern matching
- **Make:** Build automation
- **AWK:** Text processing

```awk
# Count lines by unique word
{ for (i=1; i<=NF; i++) count[$i]++ }
END { for (word in count) print word, count[word] }
```

**When to create:** Domain-specific notation is much clearer than 
general-purpose language.

---

### Internal DSLs: Extend Existing Language

**Ruby examples:**
```ruby
# Rake (build tool)
task :deploy => [:test, :build] do
  sh "scp app.zip server:/deploy"
end

# RSpec (testing)
describe Calculator do
  it "adds two numbers" do
    expect(Calculator.add(2, 3)).to eq(5)
  end
end
```

**Python examples:**
```python
# Flask (web framework)
@app.route("/hello")
def hello():
    return "Hello World"

# Pytest (testing)
@pytest.fixture
def client():
    return TestClient(app)
```

**When to create:** Your domain has repetitive patterns that 
higher-level abstraction would simplify.

---

## 🏁 Part 10: Takeaways

**The landscape:**
1. **Paradigms matter more than syntax** — OOP, FP, logic, procedural
2. **Ecosystems matter more than features** — libraries, tools, 
   community
3. **Context determines best language** — no universal "best"
4. **Most systems are polyglot** — 3-5 languages is normal

**Your strategy:**
1. **Master your current language** — Deep > shallow
2. **Learn one different paradigm** — Expand thinking
3. **Stay pragmatic** — Use boring technology
4. **Resist hype** — New != better

**The meta-lesson:** Learning languages is learning to think 
differently. Syntax is trivial. Paradigms persist.

---

## 📚 References

1. Kay, Alan. "The Early History of Smalltalk." 1993.
2. Stroustrup, Bjarne. *The Design and Evolution of C++*. 1994.
3. Pike, Rob. "Simplicity is Complicated." 2015.
4. Graham, Paul. "Beating the Averages." 2001.
5. Klabnik, Steve & Nichols, Carol. *The Rust Programming Language*. 
   2023.

**Historical corrections:**
- Java was created by Sun Microsystems (1995), acquired by Oracle 
  (2010)
- First Lisp interpreter: Steve Russell (1960), not Stuart Russell
- Fortran added recursion in Fortran 90 (1991)

---

**Previous lecture:** [Closures & Functional 
Thinking](lect13-closures.md) — The theory under the hood.

**Next lecture:** Testing strategies — Because your code will have 
bugs.