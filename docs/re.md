# Requirements

# Table of Contents


- [When](#when)
- [Famous Requirements Failures](#famous-requirements-failures)
  - [Ariane 5 Rocket Explosion 1996](#ariane-5-rocket-explosion-1996)
  - [London Ambulance Service Failure 1992](#london-ambulance-service-failure-1992)
  - [Heathrow Terminal 5 Baggage System 2008](#heathrow-terminal-5-baggage-system-2008)
  - [Denver Airport Baggage System 1995](#denver-airport-baggage-system-1995)
  - [Mars Climate Orbiter 1999](#mars-climate-orbiter-1999)
  - [Venus Rocket Explosion 1962](#venus-rocket-explosion-1962)
  - [Genesis Spacecraft 2004](#genesis-spacecraft-2004)
  - [Stardust Spacecraft 2006](#stardust-spacecraft-2006)
- [Stakeholders in Requirements Engineering](#stakeholders-in-requirements-engineering)
  - [Who Matters](#who-matters)
  - [Power Interest Grid](#power-interest-grid)
  - [Elicitation and Management](#elicitation-and-management)
- [Requirement Interactions](#requirement-interactions)
  - [Functional Requirements Interactions](#functional-requirements-interactions)
    - [Positive Interactions](#positive-interactions)
    - [Negative Interactions](#negative-interactions)
  - [Non Functional Requirements Interactions](#non-functional-requirements-interactions)
    - [Positive Interactions](#positive-interactions-1)
    - [Negative Interactions](#negative-interactions-1)

---

## When

Recall the v-diagram:

- As we approach coding we do the planning required to generate the expectations that let us test.
- As we leave coding, we generate the experience needed to update our planning, next time around.

Requirements is pre-code activity where we define what needs to be done.

- Requirements engineering works when we can generate tests.
- Testing works when it can update requirements.

![Requirement](https://github.com/user-attachments/assets/47004fa8-28f2-4d56-94bc-67bb8e0fc037)

---

## Famous Requirements Failures

### Ariane 5 Rocket Explosion 1996
The Ariane 5 rocket exploded 37 seconds after launch due to a software error in the inertial reference system. The system reused code from Ariane 4 without accounting for differences in flight dynamics, violating requirements for adaptability and robustness.[^1]

### London Ambulance Service Failure 1992
A computer-aided dispatch system failed due to poorly gathered and analyzed requirements. The system was unable to handle real-world load conditions, leading to delays in ambulance dispatch and even loss of lives.[^2]

### Heathrow Terminal 5 Baggage System 2008
The baggage handling system at Heathrow's Terminal 5 suffered significant delays and operational issues due to unclear and incomplete requirements. Poor stakeholder involvement resulted in a system that failed to meet operational needs.[^3]

### Denver Airport Baggage System 1995
The airport’s automated baggage system was plagued by missed deadlines, budget overruns, and operational failures. The root cause was inadequate requirements elicitation and unrealistic assumptions about system complexity.[^4]

### Mars Climate Orbiter 1999
The Mars Climate Orbiter was lost due to a mismatch in units between the spacecraft's software and ground systems. Requirements failed to specify a standard for measurement units, leading to the spacecraft's destruction upon entering the Martian atmosphere.[^5]

### Venus Rocket Explosion 1962
The Mariner 1 Venus probe was destroyed shortly after launch due to a missing hyphen (`-`) in the guidance system's code. This single error caused the rocket to deviate from its path, highlighting the importance of precise requirements and testing.[^6]

### Genesis Spacecraft 2004
NASA’s Genesis spacecraft crashed upon re-entry due to inverted accelerometer sensor orientation. Requirements failed to specify a consistent testing protocol for component integration, resulting in catastrophic failure.[^7]

### Stardust Spacecraft 2006
In contrast to Genesis, the Stardust spacecraft successfully returned its samples from a comet. This success was attributed to improved requirements engineering and lessons learned from Genesis, demonstrating the importance of robust requirements processes.[^8]

---

## Stakeholders in Requirements Engineering

### Who Matters
A requirement without a stakeholder is just an idea. Stakeholders are all people, groups, or organizations impacted by, interested in, or influencing the system.

- **Users:** Directly interact with the system.  
- **Clients/Sponsors:** Pay for/own the system, define business goals.  
- **Domain Experts:** Provide deep knowledge of the problem area.  
- **Developers/Engineers:** Build, test, and maintain the system.  
- **Regulators/Legal:** Impose legal, compliance, or safety constraints.  
- **Indirect/Negative:** Negatively impacted or use output indirectly.  

### Power Interest Grid
Not all stakeholders are equal. Prioritize engagement using a 2x2 matrix plotting Power vs. Interest.

- **Manage Closely (High Power, High Interest):** Key players.  
- **Keep Satisfied (High Power, Low Interest):** Supportive but not detailed.  
- **Keep Informed (Low Power, High Interest):** Primary users.  
- **Monitor (Low Power, Low Interest):** Minimal effort required.  

### Elicitation and Management
- **Identification:** Brainstorm and create a Stakeholder Register.  
- **Engagement Plan:** Tailor communication.  
- **Traceability:** Link every requirement to a stakeholder.  
- **Conflict Resolution:** Use the grid to balance needs.  

---

## Requirement Interactions

### Functional Requirements Interactions

| Requirement ID | R1 | R2 | R3 | R4 | R5 | R6 | R7 | R8 | R9 | R10 |
|----------------|----|----|----|----|----|----|----|----|----|-----|
| R1=User Authentication      |    | -  |    |    |    |    |    |    |    |    |
| R2=Flight Search            | +  |    |    |    | +  |    |    |    |    |    |
| R3=Flight Booking           |    |    |    | -  |    | +  |    |    |    |    |
| R4=Passenger Management     |    |    | -  |    |    |    |    |    |    |    |
| R5=Payment Processing       |    | +  |    |    |    |    |    |    | -  |    |
| R6=Booking Cancellation     |    |    | +  |    |    |    |    |    |    |    |
| R7=Flight Status Updates    |    |    |    |    |    |    |    | +  |    |    |
| R8=Seat Selection           |    |    |    |    |    |    | +  |    |    | -  |
| R9=Loyalty Program Integration|   |    |    |    | -  |    |    |    |    |    |
| R10=Multi-language Support  |    |    |    |    |    |    |    | -  |    |    |

#### Positive Interactions
- R1 and R2: Authentication enables personalized flight search.  
- R2 and R5: Smooth flow into payment processing.  
- R3 and R6: Integrated booking/cancellation handling.  
- R7 and R8: Live updates support seat selection.  
- R9 and R10: Global accessibility for loyalty programs.  

#### Negative Interactions
- R1 and R2: Strict authentication slows quick searches.  
- R3 and R4: Conflicts in passenger management databases.  
- R5 and R9: Loyalty calculations increase complexity.  
- R8 and R10: Multi-language complicates seat selection.  
- R9 and R5: Payment and loyalty conflicts.  

---

### Non Functional Requirements Interactions

|   | A  | C  | I  | M  | P  | Po | R  | S  | Se | U  |
|---|----|----|----|----|----|----|----|----|----|----|
| A=Availability     |    |    |    |    | +  |    | +  | +  |    | -  |
| C=Compliance       |    |    | +  | -  |    |    |    |    | +  |    |
| I=Interoperability |    | +  |    |    | -  | +  |    |    |    |    |
| M=Maintainability  |    | -  |    |    | +  |    | +  |    |    | +  |
| P=Performance      | +  |    | -  | +  |    | +  | -  | +  |    |    |
| Po=Portability     |    |    | +  |    | +  |    |    | +  |    | -  |
| R=Reliability      | +  |    |    | +  | -  |    |    |    |    |    |
| S=Scalability      | +  |    |    |    | +  | +  |    |    |    | -  |
| Se=Security        |    | +  |    | -  |    |    |    |    |    |    |
| U=Usability        | -  |    |    | +  |    | -  |    |    |    |    |

#### Positive Interactions
- Availability → Performance, Reliability, Scalability.  
- Compliance → Interoperability, Security.  
- Interoperability → Compliance, Portability.  
- Maintainability → Performance, Reliability, Usability.  
- Performance → Availability, Reliability, Scalability, Portability.  
- Portability → Interoperability, Performance, Scalability.  
- Reliability → Availability, Performance.  
- Scalability → Availability, Performance, Portability.  
- Security → Compliance.  
- Usability → Maintainability.  

#### Negative Interactions
- Availability → hurts Usability.  
- Compliance → hurts Maintainability.  
- Interoperability → hurts Performance.  
- Maintainability → hurts Compliance, Security.  
- Performance → hurts Interoperability, Reliability.  
- Portability → hurts Usability.  
- Reliability → hurts Performance.  
- Scalability → hurts Usability.  
- Security → hurts Maintainability.  
- Usability → hurts Availability, Portability.  

---

[^1]: Lions, Jean-Luc. *Ariane 5 Flight 501 Failure*. ESA, 1996.  
[^2]: Finkelstein, A., et al. *London Ambulance Service Report*. UCL, 1993.  
[^3]: UK Parliament. *The Opening of Heathrow Terminal 5*. 2008.  
[^4]: Montealegre, R., & Keil, M. *MIS Quarterly*, 2000.  
[^5]: NASA JPL. *Mars Climate Orbiter Mishap Report*. 1999.  
[^6]: Chaikin, Andrew. *The Mariner 1 Mishap*. Smithsonian, 2012.  
[^7]: NASA. *Genesis Mishap Report*. 2004.  
[^8]: NASA. *Stardust Mission Overview*. 2006.  
