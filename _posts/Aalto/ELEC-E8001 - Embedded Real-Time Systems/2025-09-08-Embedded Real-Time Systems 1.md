---
layout: post
title: 2025-09-08-Embedded Real-Time Systems 1
author: wichai
date: 2025-09-08 10:17
categories:
  - Study
  - Master
tags:
  - AU
mermaid: true
math: true
pin: false
---


# Embedded Real Time Systems Lecture 01  

## Introduction to real-time system concepts

### Agenda
- Glossary
- Deadlines, punctuality, and events
- CPU utilization
- Common myths and issues

### Essential Questions
- What types of real-time systems are there?
- What are and how to determine deadlines and events?
- How to estimate and plan CPU load?
- What to look for when designing real-time systems?

### Objective
- Understand the basic concepts behind the real-time systems
- Get a sense of working elements behind real-time systems

## Real-Time Systems

A real-time system is a system that must satisfy bounded response-time constraints or risk severe consequences, including failure 

A real-time system is one whose logical correctness is based on both the correctness of the outputs and their timeliness

### Soft Real-Time System
- System performance is degraded **but not destroyed** by failure to meet response-time constraints

### Hard Real-Time System
- Failed to meet even a **single deadline** may lead to a complete or catastrophic system failure

### Firm Real-Time System
- A few missed deadlines will not lead to total failure, but missing more than a few may lead to complete or catastrophic system failure

## Failed Systems

Failed system is a system that cannot satisfy one or more of the requirements stipulated in the system requirements specification

## Let’s take a look at some examples

### Real-Time System Examples

**System:**  
Heart-Lung Machine

**Purpose:**  
Temporarily takes over the function of the heart and lungs during surgery, maintaining the circulation of blood and the oxygen content of the patient's body

**Failure:**  
Missing the scheduled execution can result in patient’s death

_HARD REAL-TIME SYSTEM_

**System:**  
iRobot Roomba

**Purpose:**  
An autonomous robotic vacuum cleaner featuring a set of sensors that enable it to navigate the floor of a home and clean it

**Failure:**  
Missing a few navigation deadlines can result in a collision and damage of the system and/or environment
 

## Deadlines and Punctuality

### Real-Time System Deadlines

A deadline is a timing milestone - if it is missed by the controller, the system may transit into an undesirable state.

Deadlines can be related to safety (hard deadlines), or they can be related to performance (performance deadlines)

- Missing a few performance deadlines doesn’t drive the system into an unsafe state, but missing the hard deadline does

Performance deadline(s) and hard deadline(s) are separated by a *grace-time*

Deadlines are based on the underlying physical phenomena of the system under control

- Different systems have different deadlines  
  - Elevator  
  - Production line  
  - Audio/video processing  

Magalhaes A. et al, Deadlines in Real-Time Systems, 1993

> Process everything as slowly as possible and repeat tasks as seldom as possible

#### Response time
Time between the presentation of a set of inputs to a system and the realization of the required behavior, including the availability of all associated outputs

### Sensor–Processor–Actuator Model

### Real-Time Punctuality

Real-time **punctuality** means that every response time has an average value  $t_{\mathrm{R}}$, with upper and lower bounds of  $t_{\mathrm{R}} + \varepsilon_{\mathrm{U}}$ and  $t_{\mathrm{R}} - \varepsilon_{\mathrm{L}}$, respectively, and  $\varepsilon_{\mathrm{U}}, \varepsilon_{\mathrm{L}} \to 0^{+}$.

- In all practical systems, the values of  $\varepsilon_{\mathrm{U}}$ and  $\varepsilon_{\mathrm{L}}$ are nonzero  
- The nonzero values are due to varying latency and propagation-delay components (hardware/software)  
- Such response times contain jitter within the interval  
  $$
  t \in \left[-\varepsilon_{\mathrm{L}}, +\varepsilon_{\mathrm{U}}\right]
  $$

## Where does a response time originate from?

### Origins of response time

An elevator door is automatically operated
- It features a capacitive safety edge for sensing possible passengers between the closing door sides
- The door sides need to reopen quickly before they touch/harm the passenger

What is the elevator system response time?

The time from when it recognizes that a passenger is between the closing door sides to the instant when it starts to reopen the door

It consists of five independent latency components:  
1. Sensor  
   $$ t_{\text{SE\_min}} = 5 \, \text{ms} \quad t_{\text{SE\_max}} = 15 \, \text{ms} $$  
2. Hardware  
   $$ t_{\text{HW\_min}} = 1 \, \mu\text{s} \quad t_{\text{HW\_max}} = 2 \, \mu\text{s} $$  
3. System software   
   $$ t_{\text{SS\_min}} = 16 \, \mu\text{s} \quad t_{\text{SS\_max}} = 48 \, \mu\text{s} $$  
4. Application software  
   $$ t_{\text{AS\_min}} = 0.5 \, \mu\text{s} \quad t_{\text{AS\_max}} = 0.5 \, \mu\text{s} $$  
5. Door drive  
   $$ t_{\text{DD\_min}} = \mathbf{300 \, ms} \quad t_{\text{DD\_max}} = \mathbf{500 \, ms} $$  

We can calculate the best-case and worst-case values of the response time:  
$$
t_{\min} \approx 305 \, ms, \qquad t_{\max} \approx 515 \, ms
$$

> **The overall response time is dominated by the door drive’s response time containing the deceleration time of the moving door blades.**

## Events

### Change in Flow-of-Control

Control flow is the order in which individual statements, instructions, or function calls are executed

- A change in state, results in a change in the flow-of-control
- `case`, `if-then`, **and** `while` statements represent a possible change in flow-of-control
  - Invocation of procedures in C represents changes in flow-of-control
  - In C++, instantiation of an object or the invocation of a method causes the change in flow-of-control

### Event and Release Time

**Event**
- Any occurrence that causes the program counter to change non-sequentially is considered a change of flow-of-control

**Release Time**
- Time at which an instance of a scheduled task is ready to run, and is generally associated with an interrupt

**What is the difference between release time and response time?**

### Taxonomy of Events

An event can be either synchronous or asynchronous
- Synchronous events are those that occur at predictable times in the flow-of-control
- Asynchronous events occur at unpredictable points in the flow-of-control and are usually caused by external sources

Events can also be periodic, aperiodic or sporadic
- A real-time clock that pulses regularly is a periodic event
- Events that do not occur at regular periods are called aperiodic
- Aperiodic events that tend to occur _very infrequently_ are called sporadic

### Taxonomy of Events

| Type          | Periodic        | Aperiodic                         | Sporadic        |
|     |     --|           -|     --|
| **Synchronous**   | Cyclic code     | Conditional breach               | Error catch     |
| **Asynchronous**  | Clock interrupt | Regular, but not fixed-period interrupt | Random event |

*With respect to the CPU clock*

 
### Deterministic Systems

For physical systems, certain states exist under which the system is considered to be out of control  
- The software controlling such a system must avoid such states

#### Deterministic System
- A system is deterministic, if for each possible state and each set of inputs, a unique set of outputs and next state of the system can be determined

  - Event determinism means the next states and outputs of a system are known for **each set of inputs that trigger events**

  - In a deterministic system, if the **response time** for each set of outputs is known, then the system also exhibits temporal determinism

- An application that runs on a hard real-time system is deterministic if its timing can be guaranteed within a certain margin of error

## CPU utilization

### CPU Utilization Factor

The CPU utilization (or time-loading factor) (*U*) is a relative measure of the non-idle processing taking place

- It refers to a computer's usage of processing resources, or the amount of work handled by a CPU

| Utilization % | Zone Type           | Typical Application          |
|     |       |         --|
| < 26          | Unnecessarily safe  | Various                     |
| 26 – 50       | Very safe           | Various                     |
| 51 – 68       | Safe                | Various                     |
| 69            | Theoretical limit   | Embedded systems            |
| 70 – 82       | Questionable        | Embedded systems            |
| 83 – 99       | Dangerous           | Embedded systems            |
| 100           | Critical            | Marginally stressed system |
| > 100         | Overloaded          | Stressed system             |

 

   

📖 Why the system may still be operational when U>100%?

### CPU Utilization Factor

Utilization factor is calculated by summing the contribution of utilization factors for each task  
- Suppose a system has  $n \geq 1 $ periodic tasks, each with an [execution period](#) of  $p_i $  
- If task  $i $ is known to have a [worst-case execution time](#) of  $e_i $, then the utilization factor,  $u_i $, for task  $i $ is:  

$$
u_i = \frac{e_i}{p_i}
$$

- The overall system utilization factor is:  

$$
U = \sum_{i=1}^n u_i = \sum_{i=1}^n \frac{e_i}{p_i}
$$

- In practice, the determination of  $e_i$ can be difficult, in which case estimation or measuring must be done 
- For aperiodic and sporadic tasks,  $u_i$ is calculated by assuming a worst-case execution period  

## De-bunking some myths

### Common Misconceptions

- Real-**time systems are synonymous with “fast” systems**
  - Many (but not all) hard real-time systems deal with deadlines in the tens of milliseconds or slower
- There are universal, widely accepted methodologies for real-time systems specification and design
  - There is no methodology that answers all of the challenges of real-time specification and design all the time and for all applications
- There is no more a need to build a (custom) real-time operating system, because many commercial products exist
  - Choosing when to use an off-the-shelf solution and choosing the right one are continuing challenges

## Common Issues

### Multidisciplinary Challenges

- Real-time systems is a multi-dimensional subdiscipline of computer systems engineering
- The fundamentals of real-time systems are well established and have considerable permanence
- Still, real-time systems is a lively developing area

### Diverse Applications

- The history of real-time systems is tied to the evolution of computer
- Advanced real-time systems are highly sophisticated  
  - But they may still exhibit characteristics of those pioneering systems developed in the 1940s–1960s!
- An advanced real-time system is the Mars Exploration Rover of NASA  
  - An autonomous system with extreme reliability requirements  
  - Receives commands and sends measurement data over radio-communications links  
  - Performs its scientific missions with the aid of multiple sensors, processors, and actuators  

### History of Real-Time Systems

- Scheduling theory (1940s)
- Queuing theory (1950s)
- IBM’s Basic Executive with real-time scheduling (1960s)
- Introduction of the first microprocessors (1970s)
- Real-time operating systems for microprocessors (1970s–1980s)
- Contributions on solving problems related to multitasking systems (1980s–1990s)
- Advancements in hardware, open-source software, commercial design and implementation tools, and expanded programming language support (2000s)
- “Revolution” of wireless communications networks (2010s)

### Diverse Applications

#### Aerospace
- Flight control
- Navigation
- Pilot interface

#### Automotive
- Airbag deployment
- Antilock braking
- Fuel injection

#### Household
- Microwave oven
- Robotic vacuum cleaner
- Washing machine

#### Industrial
- Crane
- Paper machine
- Welding robot

#### Multimedia
- Console game
- Home theater
- Simulators

#### Medical
- Intensive care monitor
- Magnetic resonance imaging
- Prosthetic hand

📖 What is the most unconventional ERTS that you have at home?

### Practical implementation issues

- Selection of hardware and system software always face trade-offs
- Specification and design of real-time systems, including temporal behavior, are a challenge
- Understanding the nuances of programming language(s) and the real-time implications
- Estimating/measuring/optimizing response times, schedulability analysis
- Optimizing (with application-specific objectives) system fault tolerance and reliability
- Test planning, and the selection of development tools and test equipment
- Consideration on open systems technology and interoperability

## **Take Home Messages**

### Take Home Messages
- Real-time systems can be hard, soft, and firm depending on the deadline and response-time constrains
- Deadlines are determined by the underlying physical phenomena of the system in question
- An event can be synchronous or asynchronous, but also periodic, aperiodic, or sporadic
- CPU utilization refers to the usage of the processing resources, so a measure of the non-idle processing
- There are many misconceptions and implementation challenges, but having a holistic approach to the real-time system design helps

### Readings and Acknowledgement

P. A. Laplante and S. J. Ovaska, Real-Time Systems Design and Analysis: Tools for the Practitioner, 4th Edition. Hoboken, NJ: Wiley, 2012, page 8-25.

The lecture slides are adapted from the lecture slides of Prof. Seppo Ovaska and of Prof. Quan Zhou
 be sent via email

<span style="color:#ffbf00; transform: rotate(25deg); display: inline-block; position: absolute; right: 10px; top: 20%;">
Assignment 1 is due  
15/09 @23:59
</span>

--In class hint
- Hard
- Soft
- Firm
	- 适度


- Hard deadlines
- Performance deadlines 

	^ separated by grace-time

    
???
Why the system may still be operational when U>100%?

