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


<h1 align="center">🏗️ Design Principles & Patterns<br>The Complete Picture</h1>

> *"The most fundamental problem in computer science is problem decomposition: how to take a complex problem and divide it up into pieces that can be solved independently."* — John Ousterhout

(We thank [Macro Valente](https://softengbook.org/chapter6) for the JAVA examples used in this lecture.).
---

## 🎯 The Big Picture: Why Design Matters

**Software engineering is about managing complexity.** Bad design makes systems harder to understand, maintain, and evolve. Good design does the opposite. But what makes design "good"?

**Three interlocking pieces:**
1. **Properties** — qualities like cohesion, coupling, information hiding
2. **Principles** — guidelines like SOLID that help achieve those properties  
3. **Patterns** — past solutions that embody both properties and principles

Think of it like cooking:
- Properties = "tasty, nutritious, visually appealing"
- Principles = "balance flavors, cook at proper temp, fresh ingredients"
- Patterns = "recipes that increase the odds of  good results"

---

## 📐 Part 1: Design Properties (The "What")

### ✨ Conceptual Integrity

**Definition:** A system should reflect a unified set of design ideas, not a hodgepodge of uncoordinated features.

**Why it matters:** Users familiar with one part of the system should feel comfortable with other parts. The system should feel like it was designed by one mind, even if built by many hands.

**Example violations:**
- Tables sorted by clicking headers on some columns but not others
- Prices shown in euros on some pages, dollars on others
- Variable naming: `camelCase` in some files, `snake_case` in others
- Using different web framework versions in different modules

**Frederick Brooks said it best (1975, reaffirmed 1995):**
> "Conceptual integrity is the most important consideration in system design. It is better to have a system omit certain anomalous features and improvements, but to reflect one set of design ideas, than to have one that contains many good but independent and uncoordinated ideas."

**The Camel Problem:** *"A camel is a horse designed by a committee."* When design-by-committee produces systems with features A and B (mutually exclusive but both included to satisfy different factions), conceptual integrity suffers.

So ask yourself, in any design, are there 10% of the requiremetns to throw away to make us 80% simpler?

---

### 🔐 Information Hiding (Encapsulation)

**Definition:** Hide design decisions that are likely to change behind stable interfaces.

**Advantages:**
1. **Parallel development** — teams can work on different classes simultaneously
2. **Changeability** — swap implementations without affecting clients
3. **Comprehensibility** — developers only need to understand their assigned components

**The Key Insight:** Classes must have public interfaces (the visible contract) and private implementation details (the hidden decisions). Interfaces must be stable because changes ripple to all clients.

**Example: Parking Lot Evolution**

```java
// ❌ BAD: Exposes internal data structure
class ParkingLot {
    public Hashtable<String, String> vehicles; // EXPOSED!
    
    public ParkingLot() {
        vehicles = new Hashtable<String, String>();
    }
}

// Usage - clients directly manipulate internals
ParkingLot p = new ParkingLot();
p.vehicles.put("TCP-7030", "Accord"); // Direct access!
```

**Problem:** If we change from Hashtable to another data structure, all client code breaks.

```java
// ✅ GOOD: Hides implementation behind interface
class ParkingLot {
    private Hashtable<String, String> vehicles; // HIDDEN
    
    public ParkingLot() {
        vehicles = new Hashtable<String, String>();
    }
    
    public void park(String license, String vehicle) {
        vehicles.put(license, vehicle);
    }
}

// Usage - clients use stable interface
ParkingLot p = new ParkingLot();
p.park("TCP-7030", "Accord"); // Through interface
```

**Real World:** In 2002, Jeff Bezos sent this famous memo to Amazon developers:
1. All teams will expose their data/functionality through service interfaces only
2. No direct access to another subsystem's data
3. Every interface must be designed to potentially be public someday

This was Parnas' 1972 information hiding principle, enforced company-wide.

(More more on this see [here](https://news.ycombinator.com/item?id=21126641).)
---

### 🎯 Cohesion (Do One Thing Well)

**Definition:** Each class should have a single responsibility — one reason to change.

**Benefits:**
- Easier to implement, understand, and maintain
- Easier to assign to a single developer
- Easier to reuse and test

**Example 1: Method-Level Violation**

```java
// ❌ BAD: Does two different things
float sin_or_cos(double x, int op) {
    if (op == 1)
        return Math.sin(x);
    else
        return Math.cos(x);
}

// ✅ GOOD: Separate functions for separate concerns
float sin(double x) { return Math.sin(x); }
float cos(double x) { return Math.cos(x); }
```

**Example 2: Class-Level Violation**

```java
// ❌ BAD: Mixing parking lot operations with employee management
class ParkingLot {
    private String managerName;
    private String managerPhone;
    private String managerSSN;
    private String managerAddress;
    
    void park(String license) { ... }
    void calculatePrice() { ... }
    void releaseVehicle() { ... }
}

// ✅ GOOD: Separate concerns
class ParkingLot {
    void park(String license) { ... }
    void calculatePrice() { ... }
    void releaseVehicle() { ... }
}

class Employee {
    private String name;
    private String phone;
    private String ssn;
    private String address;
}
```

---

### 🔗 Coupling (Dependencies Matter)

**Two Types of Coupling:**

**✅ Acceptable Coupling:**
- Class A uses public methods from stable class B
- B's interface rarely changes
- Changes in B rarely impact A
- Example: Using `Hashtable` from Java's standard library

**🚫 Poor Coupling:**
- Classes share global variables
- Direct file/database access across classes
- Unstable interfaces that change frequently
- Hidden dependencies not mediated by interfaces

**The Recommendation:** Maximize cohesion, minimize coupling — but coupling isn't inherently evil. The goal is to eliminate *poor* coupling while maintaining *acceptable* coupling where necessary.

**Example: File-Based Coupling (Poor)**

```java
// ❌ BAD: Hidden coupling through shared file
class A {
    private void f() {
        File file = File.open("file1.db");
        int total = file.readInt();  // Reading B's file!
        ...
    }
}

class B {
    private void g() {
        int total = computeTotal();
        File file = File.open("file1.db");
        file.writeInt(total);  // Writing to file
        file.close();
    }
}
```

**Problem:** Developer of B might not know A reads this file. Format changes break A silently.

```java
// ✅ GOOD: Explicit coupling through interface
class A {
    private void f(B b) {
        int total = b.getTotal();  // Explicit dependency!
        ...
    }
}

class B {
    private int total;
    
    public int getTotal() {  // Public interface
        return total;
    }
    
    private void g() {
        total = computeTotal();
        File file = File.open("file1.db");
        file.writeInt(total);
        ...
    }
}
```

**Coupling Types Summarized:**
- **Structural Coupling:** Class A explicitly references class B in code
- **Evolutionary Coupling:** Changes in B propagate to A (this is what we want to minimize)

**The Left-Pad Episode (2016):** A developer removed an 11-line JavaScript function from npm. Thousands of sites broke due to indirect dependencies: App → Library A1 → A2 → ... → An → left-pad. Most sites didn't even know they depended on it.

---

## 🎓 Part 2: SOLID Principles (The "How")

Principles are actionable guidelines for achieving good properties. SOLID is an acronym for five key principles.

### 1️⃣ **S**ingle Responsibility Principle

**Principle:** A class should have only one reason to change.

**Key Application:** Separate presentation from business logic.

**Example Violation:**

```java
// ❌ BAD: Mixing calculation and display
class Course {
    void calculateDropoutRate() {
        double rate = computeRate();
        System.out.println(rate);  // Presentation mixed in!
    }
}
```

**Fixed:**

```java
// ✅ GOOD: Separated concerns
class Course {
    double calculateDropoutRate() {
        return computeRate();  // Pure business logic
    }
}

class Console {
    void printDropoutRate(Course course) {
        double rate = course.calculateDropoutRate();
        System.out.println(rate);  // Presentation only
    }
}
```

**Why it matters:** Domain classes can now be reused with web, mobile, or desktop interfaces.

---

### 2️⃣ Interface **S**egregation Principle

**Principle:** Interfaces should be small, cohesive, and client-specific. Don't force clients to depend on methods they don't use.

**Example Violation:**

```java
// ❌ BAD: Fat interface with methods not all clients need
interface Account {
    double getBalance();
    double getInterest();  // Only for SavingsAccount
    double getSalary();     // Only for SalaryAccount
}
```

**Fixed:**

```java
// ✅ GOOD: Segregated interfaces
interface Account {
    double getBalance();
}

interface SavingsAccount extends Account {
    double getInterest();
}

interface SalaryAccount extends Account {
    double getSalary();
}
```

---

### 3️⃣ **O**pen-Closed Principle

**Principle:** Classes should be open for extension but closed for modification.

**Translation:** Design classes so they can be customized without changing their source code.

**Example: Java Collections.sort()**

```java
// Default sorting (alphabetical)
List<String> names = Arrays.asList("john", "megan", "alexander", "zoe");
Collections.sort(names);
// Result: ["alexander", "john", "megan", "zoe"]

// Extended behavior WITHOUT modifying sort()
Collections.sort(names, (s1, s2) -> s1.length() - s2.length());
// Result: ["zoe", "john", "megan", "alexander"]
```

**The sort method is:**
- **Closed** — we didn't modify its source code
- **Open** — we extended its behavior with a custom comparator

**Counter-Example:**

```java
// ❌ BAD: Requires modification for new student types
double calcTotalScholarships(Student[] list) {
    double total = 0.0;
    for (Student student : list) {
        if (student instanceof UndergraduateStudent) {
            total += calcUndergradScholarship((UndergraduateStudent) student);
        }
        else if (student instanceof MasterStudent) {
            total += calcMasterScholarship((MasterStudent) student);
        }
        // Need to modify this method for DoctoralStudent!
    }
    return total;
}
```

**Important Note:** No class can be open to *all* extensions. For example, `Collections.sort()` lets you customize comparison logic but not the sorting algorithm itself.

---

### 4️⃣ **L**iskov Substitution Principle

**Principle:** Subclasses must honor the contracts of their parent classes. If S is a subtype of T, then objects of type T can be replaced with objects of type S without breaking the program.

**What this means:** When overriding methods, don't violate the original contract.

**Example 1: Contract Violation**

```java
// Base class contract: getPrime(n) works for n from 1 to 1,000,000
class PrimeNumber {
    int getPrime(int n) {
        // Returns nth prime number
    }
}

// ❌ BAD: Subclass violates contract
class FastPrimeNumber extends PrimeNumber {
    int getPrime(int n) {
        // Only works for n up to 900,000!
    }
}
```

**Problem:** Code expecting base class behavior will fail with subclass.

**Example 2: Semantic Violation**

```java
class A {
    int sum(int a, int b) {
        return a + b;  // Returns 3 for sum(1,2)
    }
}

// ❌ BAD: Changes semantic meaning
class B extends A {
    int sum(int a, int b) {
        String r = String.valueOf(a) + String.valueOf(b);
        return Integer.parseInt(r);  // Returns 12 for sum(1,2)!
    }
}

class Client {
    void f(A a) {
        a.sum(1,2);  // Could return 3 or 12 - unpredictable!
    }
}
```

---

### 5️⃣ **D**ependency Inversion Principle

**Principle:** Depend on abstractions (interfaces), not concrete implementations.

**Why:** Interfaces are more stable than implementations. Depending on interfaces makes code immune to implementation changes.

**Example:**

```java
// The abstraction
interface Projector {
    void project();
}

// Concrete implementations
class EpsonProjector implements Projector { ... }
class SamsungProjector implements Projector { ... }

// ✅ GOOD: Depends on interface
void presentSlides(Projector projector) {
    projector.project();  // Works with any implementation
}

// Usage can change without modifying presentSlides()
presentSlides(new EpsonProjector());
presentSlides(new SamsungProjector());
```

**Library Example:** Java's `List` interface with implementations:
- `ArrayList`
- `LinkedList`  
- `Vector`

Clients should declare `List` variables, not `ArrayList` variables. This makes code work with all current and future List implementations.

---

## 🎨 Part 3: Classic Design Patterns (The "Recipes")

Patterns are proven solutions that embody principles and properties. They're reusable templates, not specific code.

### 🏭 Creational Patterns: Object Construction

#### **Factory Pattern**

**Problem:** Client needs objects but shouldn't know concrete classes.

**Solution:** Let a factory method decide which class to instantiate.

```java
// ❌ Without Factory
PDFDocument pdf = new PDFDocument();  // Client knows concrete class
WordDocument word = new WordDocument();

// ✅ With Factory
interface Document { void open(); }
class PDFDocument implements Document { ... }
class WordDocument implements Document { ... }

class DocumentFactory {
    Document createDocument(String type) {
        if (type.equals("pdf")) return new PDFDocument();
        if (type.equals("word")) return new WordDocument();
        return null;
    }
}

// Client doesn't know concrete classes
Document doc = factory.createDocument(userInput);
```

**Principles satisfied:** Dependency Inversion (depend on Document interface), Open-Closed (add new document types without client changes)

---

#### **Singleton Pattern**

**Problem:** Need exactly one instance of a class throughout the application.

**Solution:** Private constructor + static method returning single instance.

```java
class Logger {
    private static Logger instance;
    
    private Logger() {}  // Can't instantiate from outside
    
    public static Logger getInstance() {
        if (instance == null) {
            instance = new Logger();
        }
        return instance;
    }
}

// Usage
Logger.getInstance().log("message");
```

**Drawbacks:**
- Global state makes testing harder
- Hidden dependencies (classes silently depend on singleton)
- Tight coupling to concrete class
- Thread safety concerns

**When to use:** Shared resources like loggers, configuration managers, connection pools.

---

### 🏗️ Structural Patterns: Object Composition

#### **Adapter Pattern**

**Problem:** Two incompatible interfaces need to work together.

**Solution:** Create a wrapper that translates one interface to another.

```java
// Legacy system uses XML
class LegacyXMLService {
    String getDataAsXML() { return "<data>...</data>"; }
}

// New system expects JSON
interface JSONService {
    String getDataAsJSON();
}

// ✅ Adapter makes them compatible
class XMLtoJSONAdapter implements JSONService {
    private LegacyXMLService legacy;
    
    public XMLtoJSONAdapter(LegacyXMLService legacy) {
        this.legacy = legacy;
    }
    
    public String getDataAsJSON() {
        String xml = legacy.getDataAsXML();
        return convertXMLtoJSON(xml);
    }
}
```

**Use case:** Integrating legacy systems without rewriting them.

---

#### **Facade Pattern**

**Problem:** Complex subsystem with many classes and methods.

**Solution:** Provide simplified interface hiding complexity.

```java
// Complex subsystem
class Amplifier { void on() {...} void setVolume(int v) {...} }
class DVDPlayer { void on() {...} void play(String movie) {...} }
class Projector { void on() {...} void wideScreenMode() {...} }

// ✅ Facade simplifies
class HomeTheaterFacade {
    private Amplifier amp;
    private DVDPlayer dvd;
    private Projector projector;
    
    void watchMovie(String movie) {
        projector.on();
        projector.wideScreenMode();
        amp.on();
        amp.setVolume(5);
        dvd.on();
        dvd.play(movie);
    }
}

// Client has simple interface
theater.watchMovie("Inception");
```

**Principles satisfied:** Information Hiding (hides subsystem complexity), reduces coupling

---

#### **Decorator Pattern**

**Problem:** Need to add responsibilities to objects dynamically without subclassing.

**Solution:** Wrap objects in decorator objects that add behavior.

```java
interface Coffee {
    double cost();
    String description();
}

class SimpleCoffee implements Coffee {
    public double cost() { return 2.0; }
    public String description() { return "Simple coffee"; }
}

// Decorators add features
class MilkDecorator implements Coffee {
    private Coffee coffee;
    
    public MilkDecorator(Coffee coffee) { this.coffee = coffee; }
    
    public double cost() { return coffee.cost() + 0.5; }
    public String description() { return coffee.description() + ", milk"; }
}

class SugarDecorator implements Coffee {
    private Coffee coffee;
    
    public SugarDecorator(Coffee coffee) { this.coffee = coffee; }
    
    public double cost() { return coffee.cost() + 0.2; }
    public String description() { return coffee.description() + ", sugar"; }
}

// Stack decorators dynamically
Coffee coffee = new SimpleCoffee();
coffee = new MilkDecorator(coffee);
coffee = new SugarDecorator(coffee);
// Cost: 2.7, Description: "Simple coffee, milk, sugar"
```

**Alternative to inheritance:** Instead of `MilkCoffee` and `SugarMilkCoffee` classes (combinatorial explosion), use composition.

---

### 🔁 Behavioral Patterns: Object Interaction

#### **Strategy Pattern**

**Problem:** Need to switch between different algorithms at runtime.

**Solution:** Encapsulate each algorithm in its own class.

```java
interface CompressionStrategy {
    void compress(String file);
}

class ZipCompression implements CompressionStrategy {
    public void compress(String file) { /* ZIP algorithm */ }
}

class RarCompression implements CompressionStrategy {
    public void compress(String file) { /* RAR algorithm */ }
}

class FileCompressor {
    private CompressionStrategy strategy;
    
    void setStrategy(CompressionStrategy strategy) {
        this.strategy = strategy;
    }
    
    void compressFile(String file) {
        strategy.compress(file);
    }
}

// Runtime selection
FileCompressor compressor = new FileCompressor();
compressor.setStrategy(new ZipCompression());
compressor.compressFile("data.txt");

compressor.setStrategy(new RarCompression());  // Switch algorithm
compressor.compressFile("data.txt");
```

**Principles satisfied:** Open-Closed (add new strategies without modifying compressor), Dependency Inversion (depend on interface)

---

#### **Observer Pattern**

**Problem:** One object changes state, many objects need to be notified.

**Solution:** Observers subscribe to subject; subject notifies all observers of changes.

```java
interface Observer {
    void update(String news);
}

class NewsPublisher {
    private List<Observer> observers = new ArrayList<>();
    
    void subscribe(Observer obs) {
        observers.add(obs);
    }
    
    void publishNews(String news) {
        for (Observer obs : observers) {
            obs.update(news);
        }
    }
}

class NewsReader implements Observer {
    private String name;
    
    public void update(String news) {
        System.out.println(name + " received: " + news);
    }
}

// Usage
NewsPublisher publisher = new NewsPublisher();
publisher.subscribe(new NewsReader("Alice"));
publisher.subscribe(new NewsReader("Bob"));
publisher.publishNews("Breaking: Design patterns are useful!");
```

**Also called:** Publish-Subscribe pattern

**Use cases:** Event systems, UI updates, distributed systems

---

#### **Template Method Pattern**

**Problem:** Algorithm has common structure but variant steps.

**Solution:** Define skeleton in base class; subclasses override specific steps.

```java
abstract class DataParser {
    // Template method
    final void parse(String file) {
        openFile(file);
        extractData();      // Variant step
        processData();      // Variant step
        closeFile(file);
    }
    
    void openFile(String file) { /* Common code */ }
    void closeFile(String file) { /* Common code */ }
    
    abstract void extractData();   // Subclasses override
    abstract void processData();   // Subclasses override
}

class CSVParser extends DataParser {
    void extractData() { /* CSV-specific */ }
    void processData() { /* CSV-specific */ }
}

class XMLParser extends DataParser {
    void extractData() { /* XML-specific */ }
    void processData() { /* XML-specific */ }
}
```

**Principles satisfied:** Single Responsibility (common code in one place), Open-Closed (extend by subclassing)

---

#### **Visitor Pattern**

**Problem:** Need to add operations to class hierarchy without modifying classes.

**Solution:** Visitor objects encapsulate operations; classes accept visitors.

```java
interface Visitor {
    void visit(ClothingItem item);
    void visit(Electronics item);
    void visit(FoodItem item);
}

class TaxVisitor implements Visitor {
    void visit(ClothingItem item) { 
        System.out.println("Tax on clothing: 8%");
    }
    void visit(Electronics item) {
        System.out.println("Tax on electronics: 12%");
    }
    void visit(FoodItem item) {
        System.out.println("Tax on food: 0%");
    }
}

interface Item {
    void accept(Visitor visitor);
}

class ClothingItem implements Item {
    void accept(Visitor visitor) {
        visitor.visit(this);
    }
}

// Add new operations without modifying Item classes
TaxVisitor taxCalc = new TaxVisitor();
item.accept(taxCalc);
```

**When to use:** Many unrelated operations across fixed class hierarchy.

---

## 🏛️ Part 4: Architectural Patterns (System-Level)

Patterns scale from methods → classes → systems. Architectural patterns address system-wide structure.

### **1. Layered Architecture**

**Structure:** Presentation → Business Logic → Data Access → Database

**Example:** Traditional web app
- Layer 1: UI (HTML/CSS/JavaScript)
- Layer 2: Controllers (route requests)
- Layer 3: Services (business rules)
- Layer 4: Repositories (database access)

**Properties:**

| Property | Rating | Why |
|----------|--------|-----|
| Agility | LOW | Changes ripple through layers |
| Deployment | LOW | Must redeploy entire app |
| Testability | HIGH | Layers can be mocked |
| Performance | LOW | Overhead from layer traversal |
| Scalability | LOW | Monolithic scaling only |
| Development | HIGH | Clear separation of concerns |

**When to use:** Small-to-medium systems, teams with limited architectural experience, rapid development.

---

### **2. Event-Driven Architecture**

**Structure:** Components communicate via events (publish-subscribe).

**Example:** E-commerce site
- Event: `OrderPlaced`
- Listeners: InventoryService, ShippingService, NotificationService (all react independently)

**Implementation:** Message brokers (Kafka, RabbitMQ), event buses

**Properties:**

| Property | Rating | Why |
|----------|--------|-----|
| Agility | HIGH | Components decoupled |
| Deployment | HIGH | Deploy services independently |
| Testability | LOW | Complex to test async flows |
| Performance | HIGH | Asynchronous = faster |
| Scalability | HIGH | Scale event processors |
| Development | LOW | Async complexity |

**When to use:** Real-time systems, high concurrency, loosely coupled services.

---

### **3. Microservices Architecture**

**Structure:** Small independent services, each with single business function.

**Example:** Netflix
- Service 1: User authentication
- Service 2: Video streaming
- Service 3: Recommendations
- Service 4: Billing

**Each service:** Own database, deployable independently, possibly different tech stacks.

**Properties:**

| Property | Rating | Why |
|----------|--------|-----|
| Agility | HIGH | Change one service at a time |
| Deployment | HIGH | Independent deployment |
| Testability | HIGH | Isolate service for testing |
| Performance | LOW | Network overhead |
| Scalability | HIGH | Scale services individually |
| Development | HIGH | Small focused teams |

**Challenges:**
- Distributed system complexity
- Data consistency across services
- Network latency
- Monitoring and debugging harder

**When to use:** Large systems, multiple teams, need independent scaling.

---

### **4. Microkernel (Plugin) Architecture**

**Structure:** Core system + plugin modules.

**Example:** IDE (like VSCode)
- Core: Editor, file system, UI framework
- Plugins: Language support, themes, debuggers

**Properties:**

| Property | Rating | Why |
|----------|--------|-----|
| Agility | HIGH | Add plugins without core changes |
| Deployment | HIGH | Deploy plugins separately |
| Testability | HIGH | Test plugins in isolation |
| Performance | HIGH | Load only needed plugins |
| Scalability | LOW | Core can be bottleneck |
| Development | LOW | Contract management complex |

**When to use:** Systems needing customization, plugin ecosystems, extensible platforms.

---

### **5. Space-Based (Distributed Cache) Architecture**

**Structure:** Processing units + distributed shared memory (tuple space).

**Example:** High-traffic auction system
- In-memory data grid (Hazelcast, Redis)
- Multiple processing nodes
- No central database bottleneck

**Properties:**

| Property | Rating | Why |
|----------|--------|-----|
| Agility | HIGH | Small deployable units |
| Deployment | HIGH | Cloud-native |
| Testability | LOW | Complex distributed state |
| Performance | HIGH | In-memory access |
| Scalability | HIGH | Horizontal scaling |
| Development | LOW | Distributed systems expertise |

**When to use:** High concurrency, variable load, user-centric data.

---

### **6. Pipe-Filter Architecture**

**Structure:** Data flows through sequence of processing steps (filters).

**Example:** Unix shell
```bash
cat file.txt | grep "error" | sort | uniq | wc -l
```

Each command is a filter; pipes connect them.

**Example 2:** Compiler
```
Source Code → Lexer → Parser → Optimizer → Code Generator → Executable
```

**Properties:**

| Property | Rating | Why |
|----------|--------|-----|
| Agility | HIGH | Modify individual filters |
| Deployment | HIGH | Deploy filters independently |
| Testability | HIGH | Test filters in isolation |
| Performance | LOW | Sequential processing overhead |
| Scalability | HIGH | Parallelize filters |
| Development | HIGH | Simple filter interface |

**When to use:** Stream processing, ETL pipelines, data transformation.

---

## 🔄 Part 5: Pattern Relationships (How They Fit Together)

Patterns don't exist in isolation. They often work together:

### **Common Combinations**

**Factory + Singleton**
```java
class DatabaseConnectionFactory {
    private static DatabaseConnectionFactory instance;
    
    private DatabaseConnectionFactory() {}
    
    public static DatabaseConnectionFactory getInstance() {  // Singleton
        if (instance == null) instance = new DatabaseConnectionFactory();
        return instance;
    }
    
    public Connection createConnection(String type) {  // Factory
        if (type.equals("mysql")) return new MySQLConnection();
        if (type.equals("postgres")) return new PostgresConnection();
        return null;
    }
}
```

**Strategy + Factory**
```java
class CompressionFactory {
    Strategy createStrategy(String type) {  // Factory creates strategies
        if (type.equals("zip")) return new ZipStrategy();
        if (type.equals("rar")) return new RarStrategy();
        return null;
    }
}
```

**Decorator + Factory**
```java
Coffee coffee = CoffeeFactory.create("espresso");  // Factory
coffee = new MilkDecorator(coffee);                // Decorator
coffee = new SugarDecorator(coffee);               // Decorator
```

**Observer + Mediator**
- Observer handles one-to-many updates
- Mediator coordinates complex interactions between observers

### **Patterns in Architectural Contexts**

**Microservices often use:**
- Factory (create service instances)
- Strategy (algorithm selection per service)
- Observer (event-driven communication)
- Adapter (integrate legacy services)

**Event-Driven systems use:**
- Observer (core pattern)
- Factory (create event handlers)
- Strategy (different event processing strategies)

---

## 📊 Part 6: The Empirical Evidence (What Actually Happens)

**Theory is nice. Data is better.** Here's what actually happens to code metrics when you apply refactorings.

### **Refactoring Impact on Metrics**

From empirical measurements on real Java systems.

## 📊 OO Metrics Cheat Sheet

| Metric | Name | What It Measures | ↓ Better | ↑ Worse |
|--------|------|------------------|----------|---------|
| **AMC** | Average Method Complexity | Java bytecode count per method | Simple methods | Complex methods |
| **AVG_CC** | Average Cyclomatic Complexity | Average decision points per method | Linear flow | Branching logic |
| **MAX_CC** | Maximum Cyclomatic Complexity | Highest complexity in any method | Simple methods | Complex methods |
| **CA** | Afferent Coupling | How many classes USE this class | Unused | Highly depended upon |
| **CE** | Efferent Coupling | How many classes this class USES | Independent | Dependent on many |
| **CAM** | Cohesion Amongst Methods | Parameter type overlap across methods | Diverse params | Similar params |
| **CBM** | Coupling Between Methods | Dependencies between inherited methods | Independent | Tangled inheritance |
| **CBO** | Coupling Between Objects | Total coupling (CA + CE) | Loosely coupled | Tightly coupled |
| **DAM** | Data Access Metric | Ratio of private/protected attributes | Public fields | Encapsulated |
| **DIT** | Depth of Inheritance Tree | Distance from root to class | Shallow hierarchy | Deep hierarchy |
| **IC** | Inheritance Coupling | Parents this class couples to | Few parents | Many parents |
| **LCOM** | Lack of Cohesion in Methods | Method pairs sharing no attributes | Cohesive | Scattered |
| **LCOM3** | Lack of Cohesion (Alt) | Alternative cohesion formula | Cohesive | Scattered |
| **LOC** | Lines of Code | Total lines in class/file | Smaller | Larger |
| **MFA** | Functional Abstraction | Inherited + accessible methods | Few methods | Many methods |
| **MOA** | Measure of Aggregation | Count of user-defined type fields | Simple types | Complex composition |
| **NOC** | Number of Children | Direct subclasses | No children | Many children |
| **NPM** | Number of Public Methods | Count of public methods | Few public | Many public |
| **RFC** | Response for a Class | Methods invoked by this class | Low coupling | High coupling |
| **WMC** | Weighted Methods per Class | Sum of method complexities | Simple class | Complex class |

### 🎯 Quick Interpretation Guide

**Memory Aid:** 
- **"C" metrics = Coupling** (CBO, CE, CA, CBM, IC)
- **"M" metrics = Methods/Complexity** (AMC, WMC, RFC, MFA)
- **"L" metrics = Lack of something** (LCOM)

**Coupling Metrics (Lower = Better):**
- **CBO, CE, IC, RFC** → More dependencies = harder to change

**Cohesion Metrics (Lower = Better for LCOM):**
- **LCOM, LCOM3** → Higher = methods don't work together

**Complexity Metrics (Lower = Better):**
- **AMC, AVG_CC, MAX_CC, WMC** → Higher = harder to understand/test

**Encapsulation Metrics (Higher = Better for DAM):**
- **DAM** → Higher = better information hiding
- **NPM** → Lower often better (smaller interface)

**Size Metrics (Context-Dependent):**
- **LOC** → Smaller often better, but context matters
- **NOC, DIT** → Flat hierarchies often preferable




| Refactoring | Impact on Metrics |
|------------|------------------|
| **Inline Methods** | ↓ AMC?, ↑ AVG_CC, ↓ CA, ↑ CAM?, ↓ CBO?, ↓ CE, ↓ DIT |
| **Extract Method** | ↑ AMC?, ↓ AVG_CC, ↑ CA, ↓ CAM?, ↑ CBO?, ↑ CE, ↑ DIT |
| **Extract Class** | ↓ CBO, ↓ LCOM, ↑ CA?, ↑ NOC, ↑ CE, ↓ DAM?, ↓ DIT?, ↓ IC, ↓ LOC, ↓ MAX_CC?, ↓ WMC, ↓ RFC, ↓ DIT |
| **Inline Class** | ↑ CBO, ↑ LCOM, ↓ CA?, ↓ NOC, ↓ CE, ↑ DAM?, ↑ DIT?, ↑ IC, ↑ LOC, ↑ MAX_CC?, ↑ WMC, ↑ RFC, ↑ DIT |
| **Move Method** | ↓ CBO, ↑ CE?, ↓ DIT, ↓ IC, ↓ RFC?, ↓ WMC?, ↓ DIT? |
| **Hide Delegate** | ↓ CBO, ↓ CE |
| **Consolidate Conditional** | ↓ AVG_CC, ↓ MAX_CC, ↓ WMC, ↑ LOC, ↑ DIT, ↓ AVG_CC, ↓ MAX_CC?, ↑ LOC, ↑ DIT |
| **Replace Conditional with Polymorphism** | ↓ AVG_CC, ↓ MAX_CC, ↑ NOC, ↑ DIT, ↑ IC, ↓ WMC?, ↑ RFC |
| **Flatten Conditional** | ↓ AVG_CC, ↓ MAX_CC, ↓ WMC, ↓ DIT? |
| **Hide Method** | ↑ DAM, ↑ MFA |
| **Simplify Parameters** | ↓ CBO, ↓ CE, ↓ RFC |
| **Factory Method** | ↑ NOC, ↑ DIT, ↑ IC, ↑ WMC?, ↑ RFC, ↑ NPM |
| **Push Down Method** | ↓ RFC, ↓ WMC?, ↓ NPM, ↓ AVG_CC, ↓ MAX_CC |
| **Encapsulate Field** | ↓ DAM, ↑ NPM, ↑ MFA, ↑ RFC, ↑ WMC |
| **Extract Subclass** | ↓ CBO, ↓ LCOM, ↑ NOC, ↑ DIT?, ↑ IC, ↓ RFC?, ↓ WMC?, ↓ NPM, ↓ LOC, ↓ AVG_CC?, ↓ MAX_CC, ↑ CA, ↓ CE |
| **Inline Subclass** | ↑ CBO, ↑ LCOM, ↓ NOC, ↓ DIT?, ↓ IC, ↑ RFC?, ↑ WMC?, ↑ NPM, ↑ LOC, ↑ AVG_CC?, ↑ MAX_CC, ↓ CA, ↑ CE |

**Key:** 
- ↓ = decreases metric
- ↑ = increases metric  
- ? = inconsistent (depends on context)
- Empty = no significant effect

### **What This Tells Us**

**1. Patterns Have Tradeoffs**

Extract Class:
- ✅ Reduces coupling (CBO ↓) and improves cohesion (LCOM ↓)
- ❌ Increases number of classes (NOC ↑)

Factory Method:
- ✅ Improves extensibility
- ❌ Increases complexity (WMC ↑, RFC ↑, NPM ↑)

**2. Context Matters**

Same refactoring affects different codebases differently (notice the "?" markers). A blind application of patterns can make things worse.

**3. No Silver Bullets**

Every pattern improves some metrics while degrading others. Design is about intelligent tradeoffs, not universally "better" solutions.

### **Mapping Patterns to Metrics**

**To Reduce CBO (Coupling Between Objects):**
- Extract Class
- Move Method
- Hide Delegate
- Simplify Parameters
- Extract Subclass

**To Reduce LCOM (Lack of Cohesion):**
- Extract Class
- Extract Subclass

**To Reduce Cyclomatic Complexity:**
- Extract Method
- Consolidate Conditional
- Replace Conditional with Polymorphism
- Flatten Conditional
- Push Down Method

**Warning:** Reducing complexity often increases class count (NOC). Choose based on project needs.

---

## 🚨 Part 7: Anti-Patterns (What NOT to Do)

Learning good patterns isn't enough. You must also recognize bad patterns.

### **God Class (aka Blob)**

**Symptom:** One class does everything.

```java
// ❌ 5000-line class that handles UI, business logic, and data access
class Application {
    void handleUserInput() { ... }
    void processBusinessRules() { ... }
    void saveToDatabase() { ... }
    void generateReport() { ... }
    void sendEmail() { ... }
    // ... 200 more methods
}
```

**Fix:** Apply Single Responsibility — extract cohesive classes.

**Metrics:** High LCOM, WMC, RFC, LOC

---

### **Spaghetti Code**

**Symptom:** Tangled control flow, no clear structure.

```java
// ❌ Nested conditionals, gotos, complex branching
void process() {
    if (condition1) {
        if (condition2) {
            if (condition3) {
                // 50 lines of code
                if (condition4) {
                    // Another 50 lines
                }
            }
        }
    }
}
```

**Fix:** Extract Method, Simplify Conditionals, Strategy Pattern.

**Metrics:** High Cyclomatic Complexity

---

### **Lava Flow**

**Symptom:** Dead code kept "just in case."

```java
// ❌ Code frozen in time
void oldMethod() {
    // TODO: Remove this after migration (written 5 years ago)
}
```

**Fix:** Delete it. Version control has your back.

---

### **Golden Hammer**

**Symptom:** Using same solution for every problem ("when you have a hammer, everything looks like a nail").

```java
// ❌ Using Singleton for everything
class UserManager extends Singleton { ... }
class ConfigManager extends Singleton { ... }
class CacheManager extends Singleton { ... }
// Everything's a singleton!
```

**Fix:** Choose patterns based on problem, not familiarity.

---

### **Over-Engineering (Pattern Fever)**

**Symptom:** Using patterns when simple code suffices.

```java
// ❌ Overkill for simple calculator
interface OperationStrategy { ... }
class AdditionStrategy implements OperationStrategy { ... }
class SubtractionStrategy implements OperationStrategy { ... }
class CalculatorContextFactory { ... }
class OperationVisitor { ... }

// ✅ Simple is better
class Calculator {
    int add(int a, int b) { return a + b; }
    int subtract(int a, int b) { return a - b; }
}
```

**Remember YAGNI:** You Aren't Gonna Need It.

**Fix:** Start simple. Refactor to patterns when complexity demands it.

---

## 🧪 Part 8: Testing Implications

Design affects testability. Here's how:

### **Easy to Test**

**Highly Cohesive Classes**
```java
// ✅ Single responsibility = easy to test
class PriceCalculator {
    double calculatePrice(List<Item> items) { ... }
}

@Test
void testPriceCalculation() {
    PriceCalculator calc = new PriceCalculator();
    List<Item> items = Arrays.asList(new Item(10), new Item(20));
    assertEquals(30, calc.calculatePrice(items));
}
```

**Dependency Injection**
```java
// ✅ Dependencies injected = easy to mock
class OrderService {
    private PaymentGateway gateway;
    
    OrderService(PaymentGateway gateway) {
        this.gateway = gateway;
    }
    
    void placeOrder(Order order) {
        gateway.processPayment(order.getTotal());
    }
}

@Test
void testOrderPlacement() {
    PaymentGateway mockGateway = mock(PaymentGateway.class);
    OrderService service = new OrderService(mockGateway);
    service.placeOrder(new Order(100));
    verify(mockGateway).processPayment(100);
}
```

### **Hard to Test**

**Tight Coupling**
```java
// ❌ Hard-coded dependency
class OrderService {
    void placeOrder(Order order) {
        PaymentGateway gateway = new StripeGateway();  // Can't mock!
        gateway.processPayment(order.getTotal());
    }
}
```

**Global State (Singletons)**
```java
// ❌ Tests interfere with each other
class Config extends Singleton {
    private Map<String, String> settings;
}

// Test 1 modifies singleton, affects Test 2
```

**Event-Driven Systems**
```java
// ❌ Complex async flows
eventBus.publish(new OrderPlaced());
// How do you test that InventoryService, ShippingService, 
// and EmailService all reacted correctly?
```

### **Pattern-Specific Testing**

| Pattern | Testing Difficulty | Strategy |
|---------|-------------------|----------|
| Factory | Easy | Mock the factory |
| Strategy | Easy | Test each strategy independently |
| Singleton | Hard | Use dependency injection, avoid global state |
| Observer | Medium | Mock observers, verify notifications |
| Decorator | Easy | Test each decorator layer |
| Template Method | Easy | Test concrete implementations |
| Facade | Easy | Mock subsystem |
| Adapter | Easy | Mock adaptee |

---

## 🌐 Part 9: Modern Architectures (2025)

Classic patterns evolved. Here's what we use now:

### **From LAMP to Jamstack**

**LAMP (2000s):** Linux + Apache + MySQL + PHP
- Server-rendered HTML
- Monolithic backend

**Jamstack (2020s):** JavaScript + APIs + Markup
- Pre-rendered static content
- Dynamic via API calls
- CDN-first delivery

**Example Stack:**
- Frontend: Next.js (React)
- API: Serverless functions (AWS Lambda)
- Database: Managed service (PostgreSQL on AWS RDS)
- Hosting: Vercel/Netlify (CDN)

---

### **Serverless Architecture**

**Old way:** Always-running servers

**New way:** Functions triggered by events

```javascript
// AWS Lambda function
exports.handler = async (event) => {
    const order = JSON.parse(event.body);
    await processOrder(order);
    return { statusCode: 200 };
};
```

**Benefits:**
- Auto-scaling
- Pay per execution
- No server management

**Challenges:**
- Cold starts
- Limited execution time
- Vendor lock-in

---

### **Micro-Frontend Architecture**

**Idea:** Apply microservices principles to frontend.

**Structure:**
- Each team owns a UI component/page
- Components deployed independently
- Integrated at runtime

**Example:** E-commerce site
- Team A: Product catalog
- Team B: Shopping cart
- Team C: Checkout

**Tools:** Webpack Module Federation, Single-SPA

---

### **Edge Computing**

**Traditional:** Process data in central cloud

**Edge:** Process data near users (CDN, local devices)

**Benefits:**
- Lower latency
- Reduced bandwidth
- Works offline

**Patterns that fit:**
- Event-Driven (IoT sensors trigger edge processing)
- Microservices (services deployed at edge)
- Space-Based (distributed memory at edge nodes)

---

## 🎯 Part 10: Principles → Patterns → Architecture (Complete Map)

### **The Hierarchy**

```
Properties (What)
    ↓
Principles (How)
    ↓
Patterns (Recipes)
    ↓
Architectures (System-wide)
```

### **Complete Mapping**

| Principle | Enables Patterns | Used In Architectures |
|-----------|------------------|----------------------|
| **Information Hiding** | Facade, Proxy, Adapter | Layered, Microservices |
| **Single Responsibility** | Strategy, Command | All (via service boundaries) |
| **Open-Closed** | Strategy, Template Method, Factory | Microkernel, Event-Driven |
| **Liskov Substitution** | All behavioral patterns | Any using polymorphism |
| **Dependency Inversion** | Factory, Abstract Factory | Microservices, Layered |
| **Prefer Composition** | Decorator, Strategy | All modern architectures |
| **Interface Segregation** | Adapter, Facade | Microservices |

### **Example: E-Commerce Platform**

**Architecture:** Microservices + Event-Driven

**Services:**
- **User Service:** Manages authentication (Factory pattern for auth strategies, Singleton for session manager)
- **Product Service:** Catalog management (Repository pattern, Strategy for pricing)
- **Order Service:** Order processing (Observer pattern for order events, Factory for order types)
- **Payment Service:** Payment processing (Adapter for payment gateways, Strategy for payment methods)
- **Notification Service:** Email/SMS (Template Method for notification templates, Observer subscribes to order events)

**Communication:** Event bus (RabbitMQ) — Observer pattern at system level

**Principles Applied:**
- Single Responsibility: Each service has one concern
- Dependency Inversion: Services depend on event interfaces
- Open-Closed: Add new payment methods without modifying Payment Service

---

## 📈 Part 11: Metrics for Design Quality

Numbers help us measure what we achieve.

### **Key Metrics**

**Lines of Code (LOC)**
- What: Total lines in file/package/system
- Good: <300 per method, <500 per class
- Warning: Not a productivity metric! Ken Thompson: "One of my most productive days was throwing away 1,000 lines of code."

**Cyclomatic Complexity (CC)**
- What: Number of decision points + 1
- Formula: `CC = (if statements + loops + case branches) + 1`
- Good: CC ≤ 10
- Warning: Above 10 suggests method is too complex

**Coupling Between Objects (CBO)**
- What: Number of classes this class depends on
- Counts: Method calls, field access, inheritance, parameters, exceptions
- Good: Low CBO (fewer dependencies)
- Bad: High CBO (tightly coupled)

**Lack of Cohesion (LCOM)**
- What: Number of method pairs that share no attributes
- Formula: Count pairs where methods access disjoint attribute sets
- Good: LCOM = 0 (all methods share attributes)
- Bad: High LCOM (methods unrelated)

### **LCOM Calculation Example**

```java
class A {
    int a1, a2, a3;
    
    void m1() { a1 = 10; a2 = 20; }           // Uses a1, a2
    void m2() { print(a1); a3 = 30; }        // Uses a1, a3
    void m3() { print(a3); }                  // Uses a3
}

// Method pairs:
// (m1, m2): share a1 ✓
// (m1, m3): share nothing ✗
// (m2, m3): share a3 ✓

// LCOM = 1 (one pair shares nothing)
```

### **Thresholds (From Research)**

From studies on thousands of projects:

| Metric | Good | Acceptable | Bad |
|--------|------|------------|-----|
| LOC per method | <50 | 50-100 | >100 |
| LOC per class | <300 | 300-500 | >500 |
| Cyclomatic Complexity | 1-10 | 11-20 | >20 |
| CBO | <5 | 5-10 | >10 |
| LCOM | 0-20 | 21-50 | >50 |

**Important:** Thresholds vary by domain. Embedded systems tolerate higher complexity. Web apps prefer smaller classes.

### **Using Metrics in Practice**

**Good:**
- Track trends over time
- Identify refactoring candidates
- Set team goals (reduce average CC)

**Bad:**
- Measuring individual productivity by LOC
- Rigid enforcement without context
- Gaming metrics (adding trivial methods to lower CC)

---

## 🚧 Part 12: When NOT to Use Patterns

Patterns solve problems. No problem? No pattern.

### **YAGNI: You Aren't Gonna Need It**

```java
// ❌ Over-engineered for current needs
interface DatabaseStrategy { ... }
class MySQLStrategy implements DatabaseStrategy { ... }
class PostgresStrategy implements DatabaseStrategy { ... }
class DatabaseFactory { ... }
class DatabaseProxy { ... }

// Current reality: Only using MySQL, no plans to change

// ✅ Start simple
class Database {
    void connect() { /* MySQL connection */ }
}

// Refactor to Strategy when you actually need multiple databases
```

### **Premature Abstraction**

Martin Fowler's Rule of Three:
1. First time: Just write the code
2. Second time: Grimace at duplication but duplicate anyway
3. Third time: Refactor to pattern

**Why?** Early abstraction often abstracts the wrong things. Wait until the pattern emerges naturally.

### **Cost-Benefit Analysis**

Every pattern has costs:
- More classes (overhead)
- Indirection (harder to trace)
- Learning curve (team must understand pattern)

Ask:
- Does this pattern solve a real problem?
- Is the problem frequent enough to warrant the complexity?
- Can the team maintain this?

### **Warning Signs**

You might be over-engineering if:
- You have more interface/abstract classes than concrete classes
- Your class diagram looks like a maze
- New developers need days to understand basic flow
- You can't explain why a pattern is there

**Better approach:** Evolutionary design — refactor to patterns as needs emerge.

---

## 🎓 Part 13: Practical Wisdom

### **Design is About Tradeoffs**

No design is universally "best." Every choice trades one quality for another:

- Microservices: Scalability vs. Complexity
- Caching: Performance vs. Consistency
- Inheritance: Reuse vs. Coupling
- Patterns: Flexibility vs. Simplicity

**Your job:** Choose tradeoffs appropriate for your context.

### **Refactoring is Continuous**

Design isn't done once. As requirements evolve:
1. Code smells appear
2. Patterns become inappropriate
3. New patterns become necessary

**Kent Beck:** "Make the change easy, then make the easy change."

### **Team Matters**

Best design in world fails if team can't maintain it:
- Junior team? Keep it simple.
- Distributed team? Emphasize loose coupling.
- High turnover? Prioritize clarity over cleverness.

### **Domain Drives Design**

Financial system ≠ Video game ≠ Embedded system

- Finance: Correctness, auditability
- Gaming: Performance, low latency  
- Embedded: Resource constraints, reliability

Patterns and metrics vary by domain.

---

## 🎬 Conclusion: Putting It All Together

**Design = Managing Complexity**

Three tools:
1. **Properties** tell you what good looks like (cohesion, low coupling, information hiding)
2. **Principles** tell you how to get there (SOLID, composition over inheritance)
3. **Patterns** give you proven solutions (Gang of Four, architectural patterns)

**The Process:**

```
Problem
    ↓
Apply Principles → Guide Design Decisions
    ↓
Consider Patterns → Implement Solution
    ↓
Measure with Metrics → Verify Quality
    ↓
Refactor Based on Data → Continuous Improvement
```

**Remember:**
- Start simple, refactor to patterns when needed
- Measure objectively (metrics) not subjectively (feelings)
- Design for your team and context, not textbook ideals
- Patterns are tools, not goals

**Final Wisdom from the Field:**

Jeff Bezos (Amazon): "Expose everything through interfaces."

Kent Beck (Facebook): "Coupling is expensive but some coupling is inevitable. Eliminate coupling triggered by frequent changes."

John Ousterhout: "The most fundamental problem in computer science is problem decomposition."

**Now go design something beautiful.**

---

## 📚 References

1. Gamma et al. *Design Patterns: Elements of Reusable Object-Oriented Software*. 1994.
2. Martin, Robert. *Clean Architecture*. 2017.
3. Ousterhout, John. *A Philosophy of Software Design*. 2021.
4. Brooks, Frederick. *The Mythical Man-Month*. 1975.
5. Parnas, David. "On the Criteria to Be Used in Decomposing Systems into Modules." 1972.
6. Fowler, Martin. *Refactoring: Improving the Design of Existing Code*. 2018.
7. Peng & Menzies. "Defect Reduction Planning (using TimeLIME)." IEEE TSE, 2021.
8. Software Engineering: A Modern Approach. https://softengbook.org/chapter5
9. Meyer, Bertrand. *Object-Oriented Software Construction*. 1997.

 