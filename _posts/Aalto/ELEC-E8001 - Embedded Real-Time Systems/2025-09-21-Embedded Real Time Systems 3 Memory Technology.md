---
layout: post
title: 2025-09-21-Embedded Real Time Systems 3 Memory Technology
author: wichai
date: 2025-09-21 16:52
categories:
  - Study
  - Master
tags:
  - AU
mermaid: true
math: true
pin: false
---
# Embedded Real Time Systems 3 Memory Technology

## Agenda
- What is memory and the origins
- How does RAM work
- Memory access and hierarchy

## Essential Questions
- What is memory and how it works?
- How can we access it and what should we have in mind?
- How to choose and make the best use of it?

## Objective
- Understand the basic concepts of memory technologies
- Get a working knowledge of how to handle memory

# What is memory and how did it come to be?

## A Generic Memory Component

- m + 1 address lines in the address bus
  - A memory address is a unique identifier used by a device or CPU for data tracking
  - CPUs track stored data by accessing memory addresses via data buses
- n + 1 data lines in the data bus
  - Width of memory locations (architecture variable)
  - [byte](https://en.wikipedia.org/wiki/Byte) or word addressable
- Read (and Write) control signals (data direction)
  - Determines what you are actually going to do
- Chip Select line for enabling the component
  - There can be multitude of memory chips lumped up together


# A Generic Memory Component


$$
\begin{aligned}
Capacity &= 1024 \times 8bit = 8192bit \\
         &= 8kbit = 1KB \\
Capacity &= 2^{m+1} \times (n + 1)
\end{aligned}
$$

(this is the maximum size memory that you can address)

How big data bus do we need?  
$$
n = 7 \rightarrow data\ bus = n + 1 = 8
$$

How big address bus do we need?  
$$
1024 \rightarrow address\ bus = \log_2 1024 = 10 \ (= m + 1)
$$



- Volatile – data gets lost once you power it off  (memory) (fast)  
- Non-volatile – data stays even after power down  (storage) (slow)  *stays up to 10 years

- Random-Access Memory (RAM): can directly address any address in the memory  
- Read-Only Memory (ROM): can only read from it and not write  
  - Distinction is not really as clear when it comes to underlying technologies nowadays (EEPROM and Flash) since these can be in-system programmable but slowly and at cost of longevity  


## First memory technologies

- Punch cards - 1950s - 12 rows x 80 columns = 960 bits
  - They weren’t really reusable
  - Data is available just for a fraction of a second

- Delay line memory – 1950s - ~560 bits (EDVAC)
  - Only 1 bit available in any given time (sequential memory)
  - Data density was quite low – magnetostrictive memory – torsional waves


- Magnetic core memory – 1950-60s - 64 rows x 64 columns = 4096 bits
  - They allowed a [random access](https://en.wikipedia.org/wiki/Random_access)
  - Non-volatile storage


## Further developments

- Magnetic tapes – 1970s (though origins are earlier)  
  - 8 parallel bits of data with reels of up to ~370m (UNIVAC) = ~2MB  
  - Tape access is sequential (rewind/fast-forward) and it takes variable time to retrieve the data  
  - It stills supports a lot of 20th century archive material  


- Hard Disk Drives (HDD) – 1960s – stacks of rotating disks with magnetic coating
  - 52 discs with ~3.75MB (IBM 305 RAMAC)
  - The technology really picked up with PCs (non-volatile, random access)
  - Still in wide use (~TBs), but mechanical components are the bottleneck


- Floppy Disk Drives (FDD) – 1970s – same just more portable
  - 5¼-inch disks (360kB)
  - 3½-inch disks (1.44MB)


- Compact Disks (CDs) – 1990s (earlier origins) – laser (780nm) driven optical memories
  - CD-ROM 650MB – dye based
  - CD-RW 700MB – metal based
  - DVD (4.7GB-17GB, 650nm) and Blu-ray (25GB-100GB, 405nm)


## Where are we today?

- The first RAM/ROM integrated circuits appeared in 1970s and offered a good price per bit
- With the advancement of the IC technology the price dropped even further and today we even have large storage mediums being substituted by this technology – solid state drives
- Since there are no mechanical parts the robustness and speeds can be increased (order of a magnitude higher, ~1000Hz)
- While this is fast, it is still slower than your typical RAM ~2,5-3 MHZ (cash memory 10-100 times more)

## Radom Access Memory (RAM) - IC

- Can be read and changed in any order  
  - Typically used to store working data and machine code
- Volatile memory - loses data when power is off
- Static RAM (SRAM) - uses latching circuitry (flip-flop) to store each bit  
  - A memory cell needs typically 6 transistors to implement a flip-flop structure  
  - Has a larger footprint and is more expensive technology  
  - Offers fast access (~10ns)
- Dynamic RAM (DRAM)  
  - A memory cell can be implemented with a single transistor and capacitor  
  - Smaller footprint and lower costs  
  - Due to a charge leakage in storage capacitors, must be refreshed regularly (~3ms)  
  - Access time of 60ns


## Let’s have a quick look at SRAM!

### Diagrams and explanations:



But we need two lines to write an input (set and reset) which is not optimal





*Note:* Problem comes when we want bigger registers as it implies more wires





- 8 latches along horizontal dimension
- 8 latches along vertical dimension

**Circuit details (right side):**

- DATA IN/**OUT**
- WRITE ENABLE
- READ ENABLE
- Row & Column Select
- Gated Latch



- 256bit blocks connected in parallel
- 8bit address bus (orange)
- Read enable (blue)
- Write enable (red)
- Data lines (green)
- 8bit Data

256 addresses with 8bits of data = 256byte memory  
**Building block of today’s SRAM module!**


## How about other memories?

Concept is pretty much the same, just different technologies are used to achieve the basic memory unit (gated latch)  
Some properties might change:  
- DRAM has to be refreshed as it depends on capacitors that tend to discharge  
- Flash relies on floating gate MOSFETs and uses a trick to decrease the footprint at the cost of not being able to address a single bit of memory, but rather the whole block every time  


# Memory access
## Know your system

One should be aware of all (as many) the intricacies of the underlying architecture and potential mismatches that need to be accounted for  
It is not sufficient to just be aware of the CPU architecture, but also the properties of the memory and corresponding buses are highly going to influence the overall system performance  
The bus cycle is the time required to make a single read or write transaction between the CPU and an external memory or an I/O device  
- To **determine the length of a suitable bus cycle,** we need to **know the worst-case access times** of memory and I/O ports, as well as the latencies of address encoding circuitry and possible buffers on the system bus  

- Memory-read access time is the delay between enabling an addressed memory component and having the requested data available on the drive
- Memory-write access time is the delay of the corresponding process

Given that bus can run on much higher speeds than the memory, and that nowadays they are interconnected with different I/Os and memory types, there is a necessity for establishing various bus protocols:

- Synchronous bus protocols contain a rigid set of steps that communicating devices must perform to complete a data transfer operation
  - These steps are preplanned and are executes in line with the “bus clock”
  - Here, it is possible to add wait states and adapt to different access times of memory

- Asynchronous bus protocols all devices connected to the bus may have different speeds and their own clocks.
  - They use a handshaking protocol to synchronize with each other

Power management might affect the way that the bus cycle and memory access will be conducted.

Given that ERTS are often faced with need of critical operation in remote or portable environments, energy preservation and appropriate battery consumption should be observed

This can influence the clock rates, the memory types, and correspondingly the bus-cycle



Let’s say that we are running a 16bit embedded processor with 32bit address space



📖 What are the staring and the ending address of the SRAM (in Hex) of Atmega328P?


# Which memory should I choose?

## If I can’t afford the best, should I go cheap?

One should keep in mind that cheap memory, which is slow or doesn’t utilize the full capacity of the CPU, is potentially costing the whole system more in the end since it requires the CPU to slow down and meet its requirements

## Which one should I go for?

Well, why choose only one?  
Memory hierarchy is a common concept in many systems and in particular in ERTS where often a compromises have to be made  

## Cache memory

A cache is a relatively small and fast memory
- Aims to relieve the CPU–memory gap
- Few KB to few MB
- Located physically close to processor core
- Used for frequently used instructions and/or data
  - L1 cache can have separate instruction and data caches
  - L2 caches are usually mixed
  - L3 can be a common cache for multi-core processor
- Also contains a list of memory blocks that are currently in the cache
  - Each memory block holds typically no more than a few hundred words


- Cache memories rely on the locality of reference principle:
  - Temporal locality: the same resources are accessed repeatedly in a short amount of time
  - Spatial locality: accessing various data or resources that are near each other
- Programs tend to execute sequentially within code modules and within the body of instruction loops
- Arrays have elements commonly accessed sequentially

> Cache miss is an event in which a system or application makes a request to retrieve data from a cache, but that specific data is not currently in cache memory

### Cache memory - speed



**How many types of cache does your phone have (or otherwise the device you are now watching this on), and how big are they?**


### Cache memory - drawbacks

Low locality of reference means low number of cache hits
- Caused by switching between parallel tasks and aperiodically serviced interrupts
- May lead to worse performance than if the cache did not actually exist

The effective access time is non-deterministic
- Response times contain a cache-originated element of non-determinism
- In some embedded processors, it is possible to load a time-critical code sequence permanently to the instruction cache

# Take Home Messages


## Take Home Messages
- Memory is an important part of computer systems, and it has a long and prolific history with many concepts that led to today’s designs
- They can be volatile and non-volatile, but also random access and read only
- There are two primary types of RAM: static (SRAM) and dynamic (DRAM)
  - SRAM is fast and expensive (based on gated latch)
  - DRAM is cheap, small, but slow and requires refreshing (based on transistor and capacitor)
- Memory addressing commonly handled via address bus directed multiplexers and data bus directly reads/writes the whole word in parallel
- Knowing your system as well as the application will help in selecting memories
- Memory maps are extremely useful for understanding the architecture as a whole
- Cache memory can help in closing the gap between CPU speeds and memory capabilities


## Readings and Acknowledgement

P. A. Laplante and S. J. Ovaska, Real-Time Systems Design and Analysis: Tools for the Practitioner, 4th Edition. Hoboken, NJ: Wiley, 2012, page 36-43.

The lecture slides are in part adapted from the lecture slides of Prof. Seppo Ovaska and of Prof. Quan Zhou
