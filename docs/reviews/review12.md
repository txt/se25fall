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

# Exam Questions: Closures & Functional Programming

*Based on November 3 & 5, 2025 lectures*

---

## Question 1: First-Class Functions

**(a) [1 mark] Define first-class functions.**

A language supports first-class functions if you can pass functions 
around as variables.

**(b) [2 marks] Given this Python code, explain how it demonstrates 
first-class functions:**

```python
words = ["alice", "bob", "alexandra"]
words.sort(key=lambda w: len(w))
```

The `key` parameter receives a function (lambda) as a value. The 
`sort` method calls this function on each element. This shows 
functions being passed as variables and called by other code.

**(c) [3 marks] Rewrite this class-based Strategy pattern using 
first-class functions:**

```python
class LengthSort:
    def compare(self, a, b):
        return len(a) - len(b)

sorter = Sorter(LengthSort())
sorter.sort(words)
```

```python
# Functional approach
words.sort(key=len)
# Or with explicit lambda
words.sort(key=lambda w: len(w))
```

The functional version eliminates the class entirely. The behavior 
(sorting by length) is passed directly as a function. This is simpler 
and demonstrates that Strategy pattern is just "pass a function as a 
parameter."

---

## Question 2: Closures

**(a) [1 mark] What is a closure?**

A closure is a function bundled with references to variables from its 
surrounding scope. The function "remembers" these variables even after 
the outer function returns.

**(b) [2 marks] What does this code print and why?**

```python
def make_counter():
    count = 0
    def increment():
        nonlocal count
        count += 1
        return count
    return increment

c1 = make_counter()
c2 = make_counter()
print(c1())  # ?
print(c1())  # ?
print(c2())  # ?
```

Prints: 1, 2, 1

Each call to `make_counter()` creates a new `count` variable. `c1` and 
`c2` are separate closures, each with their own `count`. `c1` 
increments its count to 1, then 2. `c2` has its own count starting at 
0, so prints 1.

**(c) [3 marks] The transcript says "Everything you know about OOP is 
just a tiny corner of closures." Prove this by implementing this class 
using only closures:**

```python
class BankAccount:
    def __init__(self, balance):
        self._balance = balance
    
    def deposit(self, amount):
        self._balance += amount
    
    def get_balance(self):
        return self._balance
```

```python
def make_account(balance):
    def deposit(amount):
        nonlocal balance
        balance += amount
    
    def get_balance():
        return balance
    
    return {'deposit': deposit, 'get_balance': get_balance}

# Usage:
account = make_account(100)
account['deposit'](50)
print(account['get_balance']())  # 150
```

The closure version captures `balance` in the outer scope. The 
returned dictionary contains functions that remember this balance. 
This is exactly what a class does—store data and methods that operate 
on it. Classes are syntactic sugar for closures.

---

## Question 3: Open-Closed Principle

**(a) [1 mark] State the Open-Closed Principle.**

Classes/functions should be open for extension but closed for 
modification. You should be able to change behavior without changing 
source code.

**(b) [2 marks] The transcript shows a `visit` function that traverses 
nested lists. Explain how this demonstrates the Open-Closed 
Principle:**

```python
def visit(x, fn):
    if not isinstance(x, list):
        fn(x)
    else:
        for y in x:
            visit(y, fn)
```

The `visit` function never changes (closed for modification). But you 
can extend its behavior by passing different functions as `fn` (open 
for extension). You can double numbers, print them, filter them, etc. 
without modifying `visit`.

**(c) [3 marks] Compare these two approaches to adding new sorting 
behavior. Which better follows Open-Closed and why?**

```python
# Approach A
def sort_list(items, sort_type):
    if sort_type == "length":
        return sorted(items, key=len)
    elif sort_type == "alpha":
        return sorted(items)
    elif sort_type == "reverse":
        return sorted(items, reverse=True)

# Approach B
def sort_list(items, key_fn=None, reverse=False):
    return sorted(items, key=key_fn, reverse=reverse)
```

Approach B better follows Open-Closed. Approach A requires modifying 
the function (adding elif branches) for each new sort type—it's not 
closed for modification. Approach B accepts any function as `key_fn`, 
allowing infinite sorting behaviors without changing the source code. 
This is the same principle as the `visit` function—pass behavior as 
parameters.

---

## Question 4: Tail Call Optimization

**(a) [1 mark] What is tail call optimization?**

When the last thing a function does is call itself, the compiler/
interpreter reuses the stack frame instead of creating a new one, 
preventing stack overflow.

**(b) [2 marks] Python has a recursion limit of ~1000. The transcript 
mentions functional languages like Haskell have "unlimited" recursion. 
Explain why.**

Python doesn't implement tail call optimization, so each recursive 
call adds a stack frame until you hit the limit. Functional languages 
like Haskell optimize tail calls by reusing the stack frame, allowing 
essentially infinite recursion depth.

**(c) [3 marks] Rewrite this function to be tail-recursive (last 
operation is the recursive call):**

```python
def factorial(n):
    if n <= 1:
        return 1
    return n * factorial(n - 1)
```

```python
def factorial(n, accumulator=1):
    if n <= 1:
        return accumulator
    return factorial(n - 1, n * accumulator)
```

The original isn't tail-recursive because after `factorial(n-1)` 
returns, it still needs to multiply by `n`. The tail-recursive version 
does the multiplication before the recursive call, so the recursive 
call is the last operation. The `accumulator` carries the intermediate 
result. (Note: Python still won't optimize this, but the pattern is 
correct.)

---

## Question 5: Immutability

**(a) [1 mark] In pure functional languages, why can't you write 
`count = count + 1`?**

Pure functional languages don't allow variable mutation. Variables are 
immutable.

**(b) [2 marks] How do functional languages handle iteration without 
mutation? Show an example.**

They use recursion with new bindings:

```python
# Imperative (mutation)
count = 0
for item in items:
    count += 1

# Functional (recursion, no mutation)
def count_items(items, total=0):
    if not items:
        return total
    return count_items(items[1:], total + 1)
```

Each recursive call creates a new `total` binding rather than mutating 
an existing variable.

**(c) [3 marks] The transcript claims immutability enables "a whole 
bunch of compiler tricks" and better concurrency. Explain why 
immutable data is easier to parallelize with an example.**

```python
# Mutable version - NOT thread-safe
total = 0
def add_to_total(value):
    global total
    total += value  # Race condition!

# Two threads calling this simultaneously can corrupt total

# Immutable version - thread-safe
def sum_list(items):
    if not items:
        return 0
    return items[0] + sum_list(items[1:])

# Multiple threads can call this safely
# No shared mutable state = no race conditions
```

With immutable data, multiple threads can read and transform data 
without locks or synchronization. There's no shared mutable state to 
protect. Each thread works with its own data copy. This is why 
functional languages excel at concurrent programming.

---

## Question 6: Recursion and the Visit Pattern

**(a) [1 mark] What does this visit function do?**

```python
def visit(x, fn):
    if not isinstance(x, list):
        fn(x)
    else:
        for y in x:
            visit(y, fn)
```

It recursively traverses a nested list structure and applies function 
`fn` to every non-list element (atom).

**(b) [2 marks] Show two different uses of this visit function that 
produce different outputs without modifying visit itself.**

```python
# Use 1: Print all numbers
visit([1, [2, 3], 4], lambda x: print(x))
# Prints: 1 2 3 4

# Use 2: Double all numbers
results = []
visit([1, [2, 3], 4], lambda x: results.append(x * 2))
# results = [2, 4, 6, 8]
```

**(c) [3 marks] The transcript says this visit pattern relates to the 
Visitor design pattern from OOP. Compare the functional approach above 
to how you would implement this in classical OOP with classes. Which 
is simpler and why?**

OOP Visitor pattern:
```python
class Visitor:
    def visit_number(self, n): pass

class DoubleVisitor(Visitor):
    def visit_number(self, n):
        return n * 2

class TreeNode:
    def accept(self, visitor): pass

# Requires multiple classes, interfaces, accept methods
```

Functional approach:
```python
visit(tree, lambda x: x * 2)
```

The functional approach is dramatically simpler. No classes, no 
interfaces, no accept methods—just pass a function. The OOP pattern 
exists because Java/C++ didn't have first-class functions. In 
languages with first-class functions, you don't need the ceremony. 
This is why the transcript says "patterns are just ways to pass 
functions around."

---

## Question 7: Type Systems

**(a) [1 mark] What is the difference between static and dynamic 
typing?**

Static typing checks types at compile time (before running). Dynamic 
typing checks types at runtime (while running).

**(b) [2 marks] The transcript discusses Rust's type propagation. 
Explain how this code would behave in Rust vs Python:**

```python
def compute(x):
    y = x + 1
    return y

result = compute(5)
# 100,000 lines later...
result.replace("a", "b")  # String operation on result
```

**In Python:** Runs fine until it hits the string operation, then 
crashes at runtime with TypeError.

**In Rust:** Won't compile. The compiler traces that `x` is a number 
(from `x + 1`), so `y` is a number, so `result` is a number. The 
string operation 100,000 lines away causes a compile error before the 
program ever runs.

**(c) [3 marks] The transcript says Rust "fights with you as you 
compile" but gives "more guarantees about runtime." Give an example of 
a bug that Rust would catch at compile time that Python wouldn't catch 
until runtime, and explain why this matters for systems programming.**

```python
# Python - compiles fine, crashes later
def process_data(items):
    total = 0
    for item in items:
        total += item.value
    return total / len(items)

# Crashes if items is empty (division by zero)
# Crashes if item has no 'value' attribute
```

```rust
// Rust version (pseudocode)
fn process_data(items: Vec<Item>) -> f64 {
    let total: i32 = items.iter().map(|i| i.value).sum();
    total / items.len()  // Compile error: division might panic
}
```

Rust forces you to handle the empty list case at compile time. For 
systems programming (OS kernels, embedded systems, safety-critical 
code), runtime crashes are unacceptable. A crash might mean a car's 
brakes fail or a rocket explodes. Catching these bugs at compile time 
is worth the extra friction.

---

## Question 8: Language Ecosystems

**(a) [1 mark] According to the transcript, why did Python win for 
ML/AI despite being slow?**

Because NumPy, PyTorch, and TensorFlow exist. The ecosystem (libraries) 
matters more than language speed.

**(b) [2 marks] The transcript discusses "marking territory with 
language." Explain the Eclipse IDE naming story and what it reveals 
about language competition.**

Eclipse was named to "eclipse the Sun"—it was IBM's attempt to take 
over the Java world from Sun Microsystems (Java's creator). The 
transcript says "we mark territory with language"—vendors use 
languages and tools to pull developers into their ecosystem and lock 
them in. Language choice is often political/economic, not purely 
technical.

**(c) [3 marks] The transcript states "ecosystem > language features." 
A student proposes adopting Haskell for a startup because it's 
"technically superior" with better type safety and purity. List three 
concrete reasons from the transcript's framework why this might be a 
bad business decision.**

1. **Hiring pool shrinks:** Far fewer developers know Haskell than 
   Python/Java. Takes longer to hire, costs more.

2. **Library ecosystem:** Many business needs (payment processing, 
   cloud APIs, databases) have mature Python/Java libraries but not 
   Haskell libraries. You'd rewrite common functionality.

3. **Team expertise and onboarding:** Current team likely doesn't know 
   Haskell. Training time is 1-2 years to reach "paradigm shifter" 
   level. Slows development drastically.

The transcript's lesson: technical superiority loses to practical 
ecosystem concerns. "Use boring technology."

---

## Question 9: Programming Paradigms

**(a) [1 mark] Name the four programming paradigms discussed in the 
transcript.**

Procedural, Object-Oriented, Functional, Logic

**(b) [2 marks] The transcript says "learning a new language in a 
different paradigm changes how you think." Contrast how you'd 
implement a loop in Procedural C vs Object-Oriented Smalltalk.**

**C (Procedural):**
```c
for (int i = 0; i < 10; i++) {
    printf("%d\n", i);
}
```
Control flow is a language keyword. To change loop behavior, modify 
the compiler.

**Smalltalk (OOP):**
```smalltalk
10 timesRepeat: [Transcript show: 'Hello'].
```
Control flow is a method on the Integer object. To add new loop types, 
add methods to Integer class. No compiler changes needed.

**(c) [3 marks] Explain the "Hollywood Principle" from Smalltalk's 
design. Then show how this same principle applies to Python's `sort` 
function with lambda.**

**Hollywood Principle:** "Don't call us, we'll call you." Instead of 
your code calling library code, you pass your code (as blocks/
functions) to library code, which calls you back.

**Smalltalk:**
```smalltalk
5 timesRepeat: [myCode].  
"Integer's timesRepeat: calls your block 5 times"
```

**Python:**
```python
items.sort(key=lambda x: x.price)
# sort() calls your lambda on each element
```

In both cases, you don't control the iteration—the library does. You 
just provide the behavior (block/lambda) that gets called at the right 
time. This inverts control from traditional programming where you call 
library functions. It's the foundation of callbacks, event systems, 
and frameworks.

---

## Question 10: The Closure-Object Connection

**(a) [1 mark] The transcript claims "OOP is syntactic sugar for 
closures." What does this mean?**

Objects (data + methods) can be implemented as closures (functions + 
captured variables). Classes are just convenient syntax for what 
closures do naturally.

**(b) [2 marks] The transcript describes an object as "a box 
containing variables and functions you can pick up and pass around." 
Show how a Python class instance is really just a closure:**

```python
class Counter:
    def __init__(self):
        self.count = 0
    
    def increment(self):
        self.count += 1
        return self.count
```

When you create an instance:
1. Python creates a closure with `count` variable
2. Methods like `increment` are functions that capture this closure
3. When you call `c.increment()`, Python translates to 
   `Counter.increment(c)`—passing the closure explicitly

The instance dictionary (`c.__dict__`) is just the captured variables. 
Methods are functions with a reference back to the class. It's 
closures all the way down.

**(c) [3 marks] The transcript mentions that "when you create a new 
instance, you're creating a new closure." Use this insight to explain 
why this code behaves the way it does:**

```python
class Dog:
    tricks = []  # Class variable
    
    def add_trick(self, trick):
        self.tricks.append(trick)

d1 = Dog()
d2 = Dog()
d1.add_trick("roll over")
d2.add_trick("play dead")
print(d1.tricks)  # ['roll over', 'play dead']
print(d2.tricks)  # ['roll over', 'play dead']
```

**Why they share tricks:**

Using the closure model: `tricks` is defined at the class (outer 
scope), not in `__init__` (inner scope). When instances are created, 
they're closures that all point back to the same `tricks` list in the 
class scope. It's not copied per instance—it's shared.

**Fix:**
```python
class Dog:
    def __init__(self):
        self.tricks = []  # Instance variable (in closure)
```

Now each instance creates a new closure with its own `tricks` list. 
Understanding closures explains the infamous Python "mutable default 
argument" bug pattern. The transcript's lesson: objects are closures, 
so closure rules apply.

---

## Grading Rubric

**Part (a) - Remember/Understand [1 mark]:**
- 1 mark: Correct definition/answer
- 0 marks: Incorrect or missing

**Part (b) - Apply/Analyze [2 marks]:**
- 2 marks: Correct answer with clear explanation
- 1 mark: Partially correct or incomplete explanation
- 0 marks: Incorrect or missing

**Part (c) - Evaluate/Create [3 marks]:**
- 3 marks: Complete, correct solution with clear reasoning
- 2 marks: Mostly correct with minor errors or incomplete reasoning
- 1 mark: Partially correct approach or significant gaps
- 0 marks: Incorrect or missing

**Total: 60 marks (10 questions × 6 marks each)**