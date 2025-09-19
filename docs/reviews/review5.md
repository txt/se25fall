asdas

# Review Questions


## Question 1


**1.1)** Define Encapsulation.  
**1.2)** Contrast Encapsulation with Information Hiding.  
**1.3)** Explain when to use Encapsulation vs. Pipes and Filters.  
**1.4)** A banking application has an `Account` class that stores a user’s balance. Instead of making `balance` a public variable, the class provides methods `deposit(amount)` and `withdraw(amount)`, which check for overdrafts before modifying `balance`.  
Does  ths encapsulation protect the integrity of the bank’s account data?  How can it hurt the software?


 


## Question 2


**2.1)** Define Pipes and Filters.  
**2.2)** Contrast Pipes and Filters with Design patters.  
**2.3)** Explain when to use Pipes and Filters vs. Function Calls.  
**2.4)** A data processing company needs to clean and transform CSV logs before analysis. They design a pipeline:  


- Extract data from raw files.  
- Transform data (convert timestamps, clean missing values).  
- Filter logs to keep only relevant records.  
- Load data into a database.  


Each step is implemented as an independent script that passes data through a Unix pipe (`cat logs.csv | clean.py | filter.py | load.py`).  
Does this pattern make the system more flexible?  How can it hurt the software?


## Question 3


**3.1)** Define Information Hiding.  
**3.2)** Contrast Information Hiding with Desgin Patterns.  
**3.3)** Explain when to use Information Hiding vs. Design Patterns.  
**3.4)** A software engineer is building a car rental system. The `Car` class has an internal function `_calculateDepreciation()` that determines how the car’s value changes over time.  
What does this  method hidden from external access, and what are the benefits of this approach?   How can it hurt the software?


## Question 4


**4.1)** Define Design Patterns.  
**4.2)** Contrast Design Patterns with Object-Oriented Design.  
**4.3)** Explain when to use Design Patterns vs. Procedural Approaches.  
**4.4)** A software team is designing a GUI application. To ensure consistency, they use the **Model-View-Controller (MVC)** pattern, separating data (`Model`), logic (`Controller`), and UI (`View`).  
Does this design pattern improve flexibility and maintainability?  How can it hurt the software? 
