---
layout: post
title: 2025-09-29-Digital and Optimal Control State-space representation
author: wichai
date: 2025-10-09 00:47
categories:
  - Study
  - Master
tags:
  - AU
mermaid: true
math: true
pin: false
---
# ELEC-E8101: Digital and Optimal Control State-space representation

## In the previous lecture. . .

We  
■ Designed practical PID controllers for applications  
■ Designed anti-windup schemes to avoid wind-up  

## Feedback and questions from last week

- More logical structure  
→ Can you point out where you felt the structure was not logical?  
- What does *H(z)* stand for?  
→ It stands for the transfer function, we will have an example in a moment  

## Learning outcomes

By the end of this lecture, you should be able to  
- Discretize a continuous-time system in a state-space form to its discrete counterpart  
- Compute the transfer function of a discrete-time system expressed in a state-space representation  
- Derive the stability conditions for the state space form  

## Introduction

- Let’s revisit our car example but this time, we also care about its position $s(t)$

- Then, we have  
  $$
  a(t) = \frac{\mathrm{d}^2 s(t)}{\mathrm{d} t^2} = \frac{F(t)}{m} - \beta v(t) = \frac{F(t)}{m} - \beta \frac{\mathrm{d} s(t)}{\mathrm{d} t}
  $$

- Now, we can get the transfer function in the Laplace domain  
  $$
  s^2 S(s) = \frac{F(s)}{m} - \beta s S(s)
  $$
  $$
  S(s)(s^2 + \beta s) = \frac{F(s)}{m}
  $$
  $$
  \frac{S(s)}{F(s)} = G(s) = \frac{1}{m(s^2 + \beta s)}
  $$

## Observations

$$
\frac{S(s)}{F(s)} = G(s) = \frac{1}{m(s^2 + \beta s)}
$$

- $G(s)$ is the continuous-time version of $H(z)$
- The transfer function relates input and output of the system
- It simplifies the analysis of, for instance, stability properties, and provides various tools (*e.g.,* Bode diagram)
- But what if we also care about the velocity?
- Or what if our system is nonlinear?
- State-space representations

## State-space representation of the car example
- Let’s go back to the differential equation we started with

$$
\frac{\mathrm{d}^2 s(t)}{\mathrm{d} t^2} = \frac{F(t)}{m} - \beta \frac{\mathrm{d} s(t)}{\mathrm{d} t}
$$

- In a state-space representation, we only want first-order derivatives  
→ We introduce the velocity again and have two equations

$$
\frac{\mathrm{d} s(t)}{\mathrm{d} t} = v(t)
$$
$$
\frac{\mathrm{d} v(t)}{\mathrm{d} t} = \frac{F(t)}{m} - \beta v(t)
$$

- We can then write this in matrix form (using the $\dot{x}$ notation for time derivatives)

$$
\begin{pmatrix}
\dot{s}(t) \\
\dot{v}(t)
\end{pmatrix}
=
\begin{pmatrix}
0 & 1 \\
0 & -\beta
\end{pmatrix}
\begin{pmatrix}
s(t) \\
v(t)
\end{pmatrix}
+
\begin{pmatrix}
0 \\
\frac{1}{m}
\end{pmatrix}
F(t)
$$

- We are not always able to measure all states of the system  
→ We add a measurement equation  
- Let’s assume our speedometer doesn’t work and we only know our position via GPS  
- Then, the measurement equation is

$$
y(t) = s(t)
$$

- And the complete state-space representation

$$
\begin{pmatrix}
\dot{s}(t) \\
\dot{v}(t)
\end{pmatrix}
=
\begin{pmatrix}
0 & 1 \\
0 & -\beta
\end{pmatrix}
\begin{pmatrix}
s(t) \\
v(t)
\end{pmatrix}
+
\begin{pmatrix}
0 \\
\dfrac{1}{m}
\end{pmatrix}
F(t)
$$

$$
y(t) = (1 \quad 0)
\begin{pmatrix}
s(t) \\
v(t)
\end{pmatrix}
$$

## The general state-space representation

- Now we abstract from our car example

$$
\underbrace{
\begin{pmatrix}
\dot{s}(t) \\
\dot{v}(t)
\end{pmatrix}}_{\dot{x}(t)}
=
\underbrace{
\begin{pmatrix}
0 & 1 \\
0 & -\beta
\end{pmatrix}}_{A}
\underbrace{
\begin{pmatrix}
s(t) \\
v(t)
\end{pmatrix}}_{x(t)}
+
\underbrace{
\begin{pmatrix}
0 \\
\frac{1}{m}
\end{pmatrix}}_{B}
F(t)
\underbrace{
}_{u(t)}
$$

$$
y(t) = 
\underbrace{
(1 \quad 0)}_{C}
\begin{pmatrix}
s(t) \\
v(t)
\end{pmatrix}
$$

- The general state-space representation of a linear time-invariant system is

$$
\text{System model: } \dot{x}(t) = A x(t) + B u(t), \quad x(0) = x_0, \quad \dim(x) = n
$$

$$
\text{Observation model: } y(t) = C x(t) + D u(t), \quad \dim(u) = r
$$

$$
\dim(y) = p
$$

- The general state-space representation of a linear time-invariant system is

  System model: $\dot{x}(t) = Ax(t) + Bu(t), \quad x(0) = x_0, \quad \dim(x) = n$  
  Observation model: $y(t) = Cx(t) + Du(t), \quad \dim(u) = r$  
  $\quad \dim(y) = p$

- Advantage of state-space representation compared to alternative methods:  
  - Describes the entire state of the system instead of only relating input and output  
  - Facilitate solution to control problems such as stability and optimal control  
  - Simulation and scheduling in computer systems are quite easy as they are represented by a set of differential (later difference) equations  
  - They can also describe nonlinear systems, which a transfer function cannot


## Homogeneous set of differential equations

- For autonomous systems, the evolution of the system is given by  
  $$
  \dot{x}(t) = A x(t), \quad x(0) = x_0
  $$

- By using Laplace transforms:  
  $$
  sX(s) - x_0 = A X(s)
  $$
  $$
  (sI - A) X(s) = x_0
  $$
  $$
  (sI - A)^{-1} (sI - A) X(s) = (sI - A)^{-1} x_0
  $$
  $$
  X(s) = (sI - A)^{-1} x_0
  $$

- The solution is obtained by the inverse Laplace transform:  
  $$
  x(t) = \mathcal{L}^{-1} \big((sI - A)^{-1} x_0 \big)
  $$
  $$
  = \mathcal{L}^{-1} \big((sI - A)^{-1}\big) x_0 = e^{At} x_0, \quad e^{At} : \text{state transition matrix}
  $$


## Solution to the general state-space representation

System model: $\dot{x}(t) = Ax(t) + Bu(t), \quad x(0) = x_0$  
Observation model: $y(t) = Cx(t) + Du(t)$

- The solution is:

$$
x(t) = e^{At}x_0 + \int_0^t e^{A(t-\tau)}Bu(\tau)d\tau
$$

$$
y(t) = C \left( e^{At}x_0 + \int_0^t e^{A(t-\tau)}Bu(\tau)d\tau \right) + Du(t)
$$

- **Note 1**: to prove the solution, check the initial condition and differentiate the solution to see that the original differential equation holds  
- **Note 2**: Let $A$ be a square matrix. Then,

$$
e^{At} = I + tA + \frac{1}{2}t^2 A^2 + \frac{1}{6}t^3 A^3 + \dots = \sum_{n=0}^{\infty} \frac{1}{n!} t^n A^n,
$$

which is always convergent. From this definition: $\frac{d e^{At}}{dt} = A e^{At} = e^{At} A$


## From continuous- to discrete-time: zero-order hold (ZOH) and sampling

- Solution at any time *t* after the sampling instant *tₖ*

$$
\begin{aligned}
x(t) &= e^{A(t-t_k)} x(t_k) + \int_{t_k}^t e^{A(t-\tau)} Bu(\tau) \, d\tau \\
&= e^{A(t-t_k)} x(t_k) + \int_{t_k}^t e^{A(t-\tau)} \, d\tau Bu(t_k) \\
&= \underbrace{e^{A(t-t_k)}}_{:= \Phi(t-t_k)} x(t_k) + \underbrace{\left( \int_0^{t-t_k} e^{As} ds B \right)}_{:= \Gamma(t-t_k)} u(t_k) \\
&= \Phi(t-t_k) x(t_k) + \Gamma(t-t_k) u(t_k)
\end{aligned}
$$

- $u(t)$ is constant between sampling instants (ZOH)

- Change the integration variable:  
  $s := t - \tau$

- A state transition matrix $\Phi$ and control matrix $\Gamma$ are obtained (in-dependent of x and u)


- At the next sampling instant, i.e., $t = t_{k+1}$

$$
x(t_{k+1}) = \Phi(t_{k+1} - t_k) x(t_k) + \Gamma(t_{k+1} - t_k) u(t_k)
$$
$$
y(t_k) = C x(t_k) + D u(t_k),
$$
where
$$
\Phi(t_{k+1} - t_k) = e^{A(t_{k+1} - t_k)}, \quad \Gamma(t_{k+1} - t_k) = \int_{0}^{t_{k+1} - t_k} e^{As} ds B
$$

- For periodic sampling: $t_k = k T_s$ and $t_{k+1} - t_k = T_s$. Therefore,

$$
x(kT_s + T_s) = \Phi(T_s) x(kT_s) + \Gamma(T_s) u(kT_s) \quad \text{or} \quad x_{k+1} = \Phi(T_s) x_k + \Gamma(T_s) u_k
$$
$$
y(kT_s) = C x(kT_s) + D u(kT_s), \quad y_k = C x_k + D u_k
$$
where
$$
\Phi(T_s) = e^{A T_s}, \quad \Gamma(T_s) = \int_0^{T_s} e^{As} ds B
$$



## How to discretize a continuous-time system?

- We have three main ways to discretize a continuous-time system
  1. **Direct calculus: we directly compute the solutions to** $\phi(T_s)$ **and** $\Gamma(T_s)$
  2. Series expansion: we use the series expansion $e^{A T_s} = \sum_{n=0}^{\infty} \frac{1}{n!} T_s^n A^n$
  3. Laplace transform: we exploit that $e^{A T_s} = \mathcal{L}^{-1} \{ (sI - A)^{-1} \}|_{t=T_s}$

- We will see examples for each of them now
- All give the same solutions, which one is preferable depends on the continuous-time system we want to discretize (and personal preference)

### Example: discretization by direct calculus

- Sampling interval: $T_s = 0.1$

$$
\dot{x} = \underbrace{2}_{A} x(t) + \underbrace{1}_{B} u(t)
$$

$$
y(t) = \underbrace{3}_{C} x(t) + \underbrace{0}_{D} u(t)
$$


- Sampling interval: $T_s = 0.1$
  $$
  \dot{x} = 2x(t) + u(t) \\
  y(t) = 3x(t)
  $$

- We compute $\Phi$ and $\Gamma$ as follows
  $$
  \Phi(T_s) = e^{AT_s} = e^{2 \cdot 0.1} = e^{0.2}
  $$
  $$
  \Gamma(T_s) = \int_0^{T_s} e^{As} \mathrm{d}s B = \int_0^{0.1} e^{2s} \mathrm{d}s 
  = \left[ \frac{1}{2} e^{2s} \right]_0^{0.1}
  = \frac{1}{2} \left( e^{2 \cdot 0.1} - e^{0} \right)
  = \frac{1}{2} \left( e^{0.2} - 1 \right)
  $$

- Therefore, the discrete-time system is given by
  $$
  x(kT_s + T_s) = e^{0.2} x(kT_s) + \frac{1}{2} \left(e^{0.2} - 1\right) u(kT_s) \quad \textcolor{red}{\text{or}} \quad x_{k+1} = e^{0.2} x_k + \frac{1}{2} \left(e^{0.2} - 1\right) u_k
  $$
  $$
  y(kT_s) = 3x(kT_s) \quad y_k = 3 x_k
  $$


## How to discretize a continuous-time system? back

- We have three main ways to discretize a continuous-time system  
  1. Direct calculus: we directly compute the solutions to $\Phi(T_s)$ and $\Gamma(T_s)$  
  2. **Series expansion: we use the series expansion** $e^{A T_s} = \sum_{n=0}^\infty \frac{1}{n!} T_s^n A^n$  
  3. Laplace transform: we exploit that $e^{A T_s} = \mathcal{L}^{-1} \left\{ (sI - A)^{-1} \right\}\big|_{t=T_s}$  
- We will see examples for each of them now  
- All give the same solutions, which one is preferable depends on the continuous-time system we want to discretize (and personal preference)  

### Example: discretization by series expansion

- Let’s go back to our car example and convert it to a discrete-time state-space representation
- To make calculations a bit simpler, this time, we assume $\beta = 0$ (no friction) and $m = 1$
- Then, we get

$$
\dot{x}(t) = \begin{pmatrix} 0 & 1 \\ 0 & 0 \end{pmatrix} x(t) + \begin{pmatrix} 0 \\ 1 \end{pmatrix} u(t)
$$

$$
y(t) = \begin{pmatrix} 1 & 0 \end{pmatrix} x(t)
$$

- This is called a [double integrator model](https://en.wikipedia.org/wiki/Double_integrator) that is often used to model the dynamics of a simple mass in a one-dimensional space under the effect of a time-varying force input

### Example: discretization by series expansion

$$
\dot{x}(t) = \begin{pmatrix} 0 & 1 \\ 0 & 0 \end{pmatrix} x(t) + \begin{pmatrix} 0 \\ 1 \end{pmatrix} u(t)
$$

$$
y(t) = (1 \quad 0) x(t)
$$

$$
\boxed{
\Phi = e^{A T_s} = I + T_s A + \frac{1}{2} T_s^2 A^2 + \frac{1}{6} T_s^3 A^3 + \ldots = \sum_{n=0}^\infty \frac{1}{n!} T_s^n A^n
}
$$

$$
\Phi(T_s) = \begin{pmatrix} 1 & 0 \\ 0 & 1 \end{pmatrix} + \begin{pmatrix} 0 & T_s \\ 0 & 0 \end{pmatrix} + \begin{pmatrix} 0 & 0 \\ 0 & 0 \end{pmatrix} + \ldots = \begin{pmatrix} 1 & T_s \\ 0 & 1 \end{pmatrix}
$$

$$
\Gamma(T_s) = \int_0^{T_s} e^{A s} \, d s B = \int_0^{T_s} \begin{pmatrix} 1 & s \\ 0 & 1 \end{pmatrix} d s \begin{pmatrix} 0 \\ 1 \end{pmatrix} = \int_0^{T_s} \begin{pmatrix} s \\ 1 \end{pmatrix} d s = \left[ \begin{pmatrix} \frac{1}{2} s^2 \\ s \end{pmatrix} \right]_0^{T_s} = \begin{pmatrix} \frac{1}{2} T_s^2 \\ T_s \end{pmatrix}
$$

- Hence, the corresponding discrete-time model becomes

$$
x(k T_s + T_s) = \begin{pmatrix} 1 & T_s \\ 0 & 1 \end{pmatrix} x(k T_s) + \begin{pmatrix} \frac{1}{2} T_s^2 \\ T_s \end{pmatrix} u(k T_s)
$$

$$
y(k T_s) = (1 \quad 0) x(k T_s)
$$


## How to discretize a continuous-time system?

- We have three main ways to discretize a continuous-time system
  1. Direct calculus: we directly compute the solutions to $\Phi(T_s)$ and $\Gamma(T_s)$
  2. Series expansion: we use the series expansion $e^{A T_s} = \sum_{n=0}^{\infty} \frac{1}{n!} T_s^n A^n$
  3. **Laplace transform: we exploit that** $e^{A T_s} = \mathcal{L}^{-1} \left\{(sI - A)^{-1} \right\}_{t=T_s}$
- We will see examples for each of them now
- All give the same solutions, which one is preferable depends on the continuous-time system we want to discretize (and personal preference)

### Example: discretization by Laplace transform

For a DC motor model

$$
\dot{x}(t) = \begin{pmatrix} -1 & 0 \\ 1 & 0 \end{pmatrix} x(t) + \begin{pmatrix} 1 \\ 0 \end{pmatrix} u(t)
$$

$$
y(t) = (0 \quad 1) x(t)
\quad
\boxed{
\Phi = e^{A T_s} = e^{A t} \bigg|_{t=T_s} = \mathcal{L}^{-1} \left\{ (sI - A)^{-1} \right\} \bigg|_{t=T_s}
}
$$

$$
\Phi(T_s) = \mathcal{L}^{-1} \left\{ \left( \begin{pmatrix} s+1 & 0 \\ -1 & s \end{pmatrix} \right)^{-1} \right\} \bigg|_{t=T_s} = \mathcal{L}^{-1} \left\{ \frac{1}{s(s+1)} \begin{pmatrix} s & 0 \\ 1 & s+1 \end{pmatrix} \right\} \bigg|_{t=T_s}
$$

$$
= \mathcal{L}^{-1} \left\{ \begin{pmatrix} \frac{1}{s+1} & 0 \\ \frac{1}{s(s+1)} & \frac{1}{s} \end{pmatrix} \right\} \bigg|_{t=T_s} = \begin{pmatrix} e^{-t} & 0 \\ 1 - e^{-t} & 1 \end{pmatrix} \bigg|_{t=T_s} = \begin{pmatrix} e^{-T_s} & 0 \\ 1 - e^{-T_s} & 1 \end{pmatrix}
$$

For a DC motor model

$$
\Gamma(T_s) = \int_0^{T_s} e^{As} \, \mathrm{d}s B = \int_0^{T_s} \begin{pmatrix} e^{-s} & 0 \\ 1 - e^{-s} & 1 \end{pmatrix} \mathrm{d}s \begin{pmatrix} 1 \\ 0 \end{pmatrix} = \int_0^{T_s} \begin{pmatrix} e^{-s} \\ 1 - e^{-s} \end{pmatrix} \mathrm{d}s = \begin{pmatrix} 1 - e^{-T_s} \\ T_s - 1 + e^{-T_s} \end{pmatrix}
$$

- Hence, the corresponding discrete-time system becomes

$$
x(kT_s + T_s) = \begin{pmatrix} e^{-T_s} & 0 \\ 1 - e^{-T_s} & 1 \end{pmatrix} + \begin{pmatrix} 1 - e^{-T_s} \\ T_s - 1 + e^{-T_s} \end{pmatrix} u(kT_s)
$$

$$
y(kT_s) = \begin{pmatrix} 0 & 1 \end{pmatrix} x(kT_s)
$$


## Ways to discretize a continuous-time system

1. Direct calculus: we directly compute the solutions to $\Phi(T_s)$ and $\Gamma(T_s)$  
   ✓ Fastest way when system is scalar  
   ✗ We need some way of calculating $e^A$ if $A$ is a matrix...

2. Series expansion: we use the series expansion $e^{AT_s} = \sum_{n=0}^{\infty} \frac{1}{n!} T_s^n A^n$  
   ✓ Nice approach when $A$ is sparse  
   ✗ Otherwise, very tedious...

3. Laplace transform: we exploit that $e^{AT_s} = \mathcal{L}^{-1} \{(sI - A)^{-1}\}\big|_{t=T_s}$  
   ✓ Nice general approach  
   ✗ Involves more steps and we need to invert a matrix



## How do we solve the discrete-time state-space system?

- The state space representation of a discrete-time system is given by  
  System model: $x_{k+1} = \Phi x_k + \Gamma u_k, \quad x_{k_0} = x_0$  
  Observation model: $y_k = C x_k + D u_k$

- Solution by direct calculus  
  $$
  \begin{aligned}
  x_{k_0 + 1} &= \Phi x_{k_0} + \Gamma u_{k_0} \\
  x_{k_0 + 2} &= \Phi x_{k_0+1} + \Gamma u_{k_0+1} \\
              &= \Phi^2 x_{k_0} + \Phi \Gamma u_{k_0} + \Gamma u_{k_0 + 1} \\
  &\vdots \\
  x_k &= \Phi^{k-k_0} x_{k_0} + \Phi^{k-k_0 - 1} \Gamma u_{k_0} + \ldots + \Gamma u_{k_0 - 1} \\
      &= \Phi^{k-k_0} x_{k_0} + \sum_{j=k_0}^{k-1} \Phi^{k-j-1} \Gamma u_j
  \end{aligned}
  $$


## Transfer function of a state-space model

- The state space representation of a discrete-time system is given by

  System model: $x_{k+1} = \Phi x_k + \Gamma u_k, \quad x_{k_0} = x_0$  
  Observation model: $y_k = C x_k + D u_k$

- We want to find the transfer function $H(z)$ of this model  
- First, note that  
  $$
  \mathcal{Z}\{x_k\} = \mathcal{Z} \left\{ \begin{pmatrix}
  x_k^1 \\
  x_k^2 \\
  \vdots \\
  x_k^n
  \end{pmatrix} \right\} = \begin{pmatrix}
  X^1(z) \\
  X^2(z) \\
  \vdots \\
  X^n(z)
  \end{pmatrix} = X(z)
  $$


- Taking the z-transform of the system model:

$$
zX(z) - zx_0 = \Phi X(z) + \Gamma U(z)
$$

- Then, the state vector is given by

$$
X(z) = (zI - \Phi)^{-1} zx_0 + (zI - \Phi)^{-1} \Gamma U(z)
$$

- The output (observation model) is given by

$$
\begin{aligned}
Y(z) &= CX(z) + DU(z) \\
&= C[(zI - \Phi)^{-1} zx_0 + (zI - \Phi)^{-1} \Gamma U(z)] + DU(z) \\
&= \underbrace{C(zI - \Phi)^{-1} zx_0}_{\text{free response}} + \underbrace{\left[ C(zI - \Phi)^{-1} \Gamma + D \right] }_{\text{transfer function}}U(z)
\end{aligned}
$$

## In-class exercise

- Consider the linear system given by the following state space representation

$$
x_{k+1} = 0.5 x_k + 0.5 u_k
$$
$$
y_k = 2 x_k.
$$

Find its transfer function

**Solution:**
In the general case, the transfer function is given by

$$
H(z) = C(zI - \Phi)^{-1} \Gamma + D.
$$

But here, we have a scalar system. Hence:

$$
H(z) = C(z - \Phi)^{-1} \Gamma + D = \frac{2 \cdot 0.5}{z - 0.5} = \frac{1}{z - 0.5}
$$

## Example

- The state-space representation of the continuous-time system is

$$
\dot{x}(t) = \begin{pmatrix} 0 & 0 \\ 1 & -0.1 \end{pmatrix} x(t) + \begin{pmatrix} 0.1 \\ 0 \end{pmatrix}
$$

$$
y(t) = \begin{pmatrix} 0 & 1 \end{pmatrix} x(t)
$$

- Find the discrete-time transfer function with MATLAB or Python for a sampling period $T_s = 0.2 \, \text{s}$

**Solution with Python**
```python

import numpy as np
import control as ctrl

A = np.array([[0, 0], [1, -0.1]])
B = np.array([[0.1], [0]])
C = np.array([[0, 1]])
D = np.array([[0]])
Ts = 0.2

sys_cont = ctrl.ss(A, B, C, D)
sys_disc = ctrl.sample_system(sys_cont, Ts)
H = ctrl.ss2tf(sys_disc)
print(H)
```
Result:

$$
H = \frac{0.001987z + 0.001974}{z^2 - 1.98z + 0.9802}
$$

Matlab
```matlab
A = [0 0; 1 -0.1];
B = [0.1; 0];
C = [0 1];
D = 0;
Ts = 0.2;

sys = ss(A, B, C, D);
sysd = c2d(sys, Ts, 'zoh');
H = tf(sysd);
disp(H)
```

## Transfer function of a state-space model

- The transfer function can be written as  
  $$
  H(z) = C(zI - \Phi)^{-1}\Gamma + D 
  = \frac{\text{adj}(zI - \Phi)\Gamma}{\det(zI - \Phi)} + D 
  = \frac{\text{adj}(zI - \Phi)\Gamma + \det(zI - \Phi)D}{\det(zI - \Phi)},
  $$
  where adj($A$) is the adjoint of the matrix $A$ and $\det(A)$ its determinant  
  $\to$ The denominator of $H(z)$ is the determinant $\det(zI - \Phi)$  
  $\to$ Poles are the roots of the determinant which are the eigenvalues of the system matrix $\Phi$  

  $$
  \det(zI - \Phi) = |zI - \Phi| =: \chi \quad (\text{Characteristic polynomial of the system})
  $$

$$
A^{-1} = \frac{1}{\det(A)} \text{adj}(A) \quad \text{(inverse of a square matrix)}
$$


## What do we mean by “stability”?

- There are **different notions of stability**:
  - Stability of a particular solution (non-linear and/or time-varying systems)
  - System stability (global property of linear systems)
  - Global stability vs. local stability (non-linear systems)
- There are **different forms of stability**
- Suppose $x_k^1, x_k^2$ are solutions to a system with initial conditions $x_0^1, x_0^2$
  - **(General) Stability** of a particular solution (non-linear and/or time-varying systems): the solution $x_k^1$ is stable if for a given $\epsilon > 0$ there exists $\delta (\epsilon, k_0) > 0$ such that
    $$
    \| x_{k_0}^2 - x_{k_0}^1 \| < \delta \implies \| x_k^2 - x_k^1 \| < \epsilon, \quad \forall k \ge k_0
    $$
  - **Asymptotic stability:** the solution $x_k^1$ is asymptotically stable if it is stable and $\delta$ can be chosen such that
    $$
    \| x_{k_0}^2 - x_{k_0}^1 \| < \delta \implies \| x_k^2 - x_k^1 \| \to 0 \quad \text{as } k \to \infty
    $$
  - **Bounded-input, bounded-output (BIBO) stability:** a system is BIBO stable if for a finite input also the output is finite


## Stability of discrete linear time-invariant (LTI) systems

- Consider the following discrete-time LTI system

$$
x_{k+1} = \Phi x_k, \quad x_0 = \alpha
$$

- To investigate the stability of the system, we perturb its initial value:

$$
x_{k+1}^0 = \Phi x_k^0, \quad x_0^0 = \alpha_0
$$

- Then, the difference $\tilde{x} = x - x^0$ satisfies

$$
\tilde{x}_{k+1} = x_{k+1} - x_{k+1}^0 \\
= \Phi x_k - \Phi x_k^0 \\
= \Phi \tilde{x}_k, \quad \tilde{x}_0 = \alpha - \alpha_0
$$

→ If the solution $x$ is stable, then every other solution is also stable  
→ **For LTI systems, stability is a property of the system, not of a special solution**

## Stability of discrete-time LTI systems

- To get asymptotic stability, *all solutions* must go to 0 as *k* goes to infinity

>**Asymptotic stability theorem**  
>The discrete-time LTI system  
>$$
>x_{k+1} = \Phi x_k, \quad x_0 = \alpha
>$$  
>is asymptotically stable if, and only if, all eigenvalues of $\Phi$ are strictly inside the unit circle, i.e.,  
>$$
>|\lambda_i| < 1, \quad i = 1, 2, \ldots, n
>$$

- If $\Phi$ has *unique* eigenvalues on the circumference of the unit circle with all other eigenvalues inside, steady-state output will perform oscillations of finite amplitude  
→ System is **marginally stable**

- Distance from origin is a measure of decay rate
- Complex poles just inside the unit circle give lightly-damped oscillations. Oscillations are also possible for real poles on negative real axis


## Mapping of poles

**Continuous-time system:**  
$$
\dot{x}(t) = A x(t) + B u(t)
$$
$$
y(t) = C x(t) + D u(t)
$$
Poles: $\lambda_i(A), i = 1, \ldots, n$

\hspace{2.5cm}➡

**Discrete-time system:**  
$$
x_{k+1} = \Phi x_k + \Gamma u_k
$$
$$
y_k = C x_k + D u_k
$$
Poles: $\lambda_i(\Phi), i = 1, \ldots, n$

$$
\boxed{
\Phi = e^{A T_s} \implies \lambda_i(\Phi) = e^{\lambda_i(A) T_s}
}
$$

- Interpretation: let $\lambda_i(A) = -\sigma_i + j\omega_i$, $\sigma_i > 0$. Then

$$
\lambda_i(\Phi) = e^{(-\sigma_i + j\omega_i)T_s} = e^{-\sigma_i T_s} e^{j \omega_i T_s} \implies |\lambda_i(\Phi)| = e^{-\sigma_i T_s} \left| e^{j \omega_i T_s} \right| = e^{-\sigma_i T_s} < 1
$$

- Therefore, **stability of the system is preserved!**

## Recall: sampling criterion/theorem

- Suppose $x_c(t)$ is a low-pass signal with $X_c(j\omega) = 0, \forall |\omega| > \omega_0$, e.g.,



- Then, $x_c(t)$ can be uniquely determined by its samples $x_c(nT_s), n = 0, \pm 1, \pm 2, \ldots$ if the sampling angular frequency is at least twice as big as $\omega_0$, i.e.,

  $$
  \omega_s = \frac{2\pi}{T_s} > 2\omega_0
  $$

- The minimum sampling angular frequency, for which the inequality holds, is called the [Nyquist angular frequency](https://en.wikipedia.org/wiki/Nyquist_frequency)


## Mapping of poles

- Interpretation: let $\lambda_i(\mathbf{A}) = -\sigma_i + j\omega_i, \, \omega_i > 0$. Then,

$$
\lambda_i(\mathbf{\Phi}) = \mathbf{e}^{(-\sigma_i + j\omega_i) T_s} = \mathbf{e}^{-\sigma_i T_s} \mathbf{e}^{j\omega_i T_s}
$$

- To avoid aliasing,

$$
\frac{2 \pi}{T_s} > 2 \omega_i \implies \omega_i T_s < \pi
$$



## Mapping of poles demystified

- In discrete-time systems, frequency response is repeated every $2\pi$ steps
- From $\pi$ to $2\pi$, the frequency response is the reflection of that from 0 to $\pi$



- If the imaginary part of a pole of the continuous-time system is bigger than $\frac{\pi}{T_s}$, then the frequency response has a peak at a higher frequency than the cut-off frequency in the discrete-time domain



- Mapping introduces aliasing, i.e.,

  $$
  s \quad \text{and} \quad \frac{s + j2 \pi k}{T_s}
  $$

  map to the same $z$


## Learning outcomes

By the end of this lecture, you should be able to
- Discretize a continuous-time system in a state-space form to its discrete counterpart
- Compute the transfer function of a discrete-time system expressed in a state-space representation
- Derive the stability conditions for the state space form

---

**Aalto University**  
**School of Electrical Engineering**

**ELEC-E8101: Digital and Optimal Control**  
Dominik Baumann

42/49  
Sep. 29, 2025  
State-space representation


# Appendix


## Proof

$$
\mathbf{\Phi} = e^{A T_s} \implies \lambda_i(\mathbf{\Phi}) = e^{\lambda_i(A) T_s}
$$

- Before proving the statement above, we need some theorems

### The Cayley-Hamilton Theorem

Let  
$$
\lambda^n + a_1 \lambda^{n-1} + a_2 \lambda^{n-2} + \dots + a_n = 0
$$  
be the characteristic polynomial of the square matrix $M$. Then, $M$ satisfies

$$
M^n + a_1 M^{n-1} + a_2 M^{n-2} + \dots + a_n I = 0.
$$

- Proof: $M^k = V \Lambda^k V^{-1} \implies \chi(M) = V \chi(\Lambda) V^{-1} = V \operatorname{diag}_i(\chi(\lambda_i)) V^{-1} = 0$

### Eigenvalues of a matrix function

If $f(M)$ is a polynomial in $M$ and $v_i$ is the eigenvector of $M$ associated with eigenvalue $\lambda_i$,

$$
f(M) v_i = f(\lambda_i) v_i.
$$


$$
\boxed{
\Phi = e^{A T_s} \implies \lambda_i(\Phi) = e^{\lambda_i(A)T_s}
}
$$

- We already know that  
$$
\Phi = f(A) = I + T_s A + \frac{1}{2} T_s^2 A^2 + \frac{1}{6} T_s^3 A^3 + \ldots = \sum_{n=0}^{\infty} \frac{1}{n!} T_s^n A^n
$$

- Hence,  
$$
\begin{aligned}
\Phi v_i &= f(A) v_i = \left[I + T_s A + \frac{1}{2} T_s^2 A^2 + \frac{1}{6} T_s^3 A^3 + \ldots \right] v_i \\
&= I v_i + T_s \lambda_i (A) v_i + \frac{1}{2} T_s^2 \lambda_i^2 (A) v_i + \frac{1}{6} T_s^3 \lambda_i^3 (A) v_i + \ldots \\
&= \left[ 1 + T_s \lambda_i(A) + \frac{1}{2} T_s^2 \lambda_i^2 (A) + \ldots \right] v_i \\
&= f(\lambda_i(A)) v_i = \underbrace{e^{\lambda_i(A) T_s}}_{\lambda_i(\Phi)} v_i
\end{aligned}
$$



## Example

- Consider the first-order continuous-time system  
  $$
  \tau \dot{y}(t) + y(t) = u(t).
  $$

Discretize the process with a sampling time of $T_s$ and assuming that the control signal $u(t)$ is piecewise constant between sampling instants (ZOH). Use  
  1. **discretization of the state-space model**  
  2. **discretization using the step-invariance method**


### **Solution (i)**  
(i) First, we write the system in state-space form

$$
\dot{x}(t) = -\frac{1}{\tau} x(t) + \frac{1}{\tau} u(t), \quad y(t) = x(t)
$$

Next, we compute Φ and Γ

$$
\Phi(T_s) = e^{A T_s} = e^{ -\frac{T_s}{\tau} }
$$

$$
\Gamma(T_s) = \int_0^{T_s} e^{As} \mathrm{d}s B = \int_0^{T_s} e^{ -\frac{s}{\tau} } \mathrm{d}s \frac{1}{\tau} = \frac{1}{\tau} \left[ \frac{1}{-\frac{1}{\tau}} e^{-\frac{s}{\tau}} \right]_0^{T_s} = 1 - e^{- \frac{T_s}{\tau}}
$$

Therefore,

$$
x_{k+1} = e^{-\frac{T_s}{\tau}} x_k + \frac{1}{2} \left( 1 - e^{-\frac{T_s}{\tau}} \right) u_k, \quad y_k = x_k
$$

The transfer function is thus

$$
H(z) = C(zI - \Phi)^{-1} \Gamma + D = \frac{1 - e^{-\frac{T_s}{\tau}}}{z - e^{-\frac{T_s}{\tau}}}
$$

### Solution (ii)

- Discretization via the step-invariance method:

$$
\begin{aligned}
H(z) &= \frac{z-1}{z} \mathcal{Z} \left( \mathcal{L}^{-1} \left( \frac{G(s)}{s} \right)_{t=kT_s} \right) \\
&= \frac{z-1}{z} \mathcal{Z} \left( \mathcal{L}^{-1} \left( \frac{1}{s(\tau s + 1)} \right)_{t=kT_s} \right) \\
&= \frac{z-1}{z} \mathcal{Z} \left( 1 - e^{-\frac{t}{\tau}} \Bigg|_{t = kT_s} \right) = \frac{z-1}{z} \mathcal{Z} \left( 1 - \left(e^{-\frac{T_s}{\tau}}\right)^k \right) \\
&= \frac{z-1}{z} \left( \frac{z}{z-1} - \frac{z}{z - e^{-\frac{T_s}{\tau}}} \right) = 1 - \frac{z-1}{z - e^{-\frac{T_s}{\tau}}} \\
&= \frac{1 - e^{-\frac{T_s}{\tau}}}{z - e^{-\frac{T_s}{\tau}}}
\end{aligned}
$$

→ Both discretization methods give the same result!
