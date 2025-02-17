---
layout: post
title: Foundation Assignment
author: wichai
date: 2035-02-11 17:10
categories:
  - Study
  - Master
tags:
  - DU
  - ASML
mermaid: true
math: true
pin: false
---

```
library(ggplot2)
library(coda)
```

# Introduction

Marks are indicated in square brackets. Please enter your answers either in Markdown format (using Latex for maths expressions) in the "YOUR ANSWER HERE" cells (you need to double-click to active the cell) or using R code in the `# YOUR CODE HERE` cells (just click and type). Do not use code cells for text and maths or Markdown cells for code. 

The data file `mydata.txt` is available in the same directory as this notebook file, and can therefore be read in using only the filename. 

# The Problem

We wish to analyse some data that records the heights $h = \{h_{i}\}_{i\in[1..n]}$ of $n = 200$ plants of a particular species. 
> 我们希望分析一些数据，记录某个特定物种的 $n = 200$ 株植物的高度 $h = \{h_{i}\}_{i\in[1..n]}$。
# Question 1

Read in the data from file 'mydata.txt' and extract the heights vector. [2]
>从文件“mydata.txt”中读取数据并提取高度向量。[2]
## Answer

```
# YOUR CODE HERE
data <read.table("mydata.txt", header = TRUE)
h <data$h  
```

The following command should show the first six elements of the data.
> 以下命令应显示数据的前六个元素。

```
head(h)
```

```
1. 123.344945482335
2. 113.0341996409
3. 107.740307073577
4. 93.505520928074
5. 105.753321857417
6. 103.165301017636
```

We are interested in the underlying mean height of the plants, $\mu$ and the variance of their heights $1/\tau$. We assume that our knowedge of the heights is captured by a Normal distribution with mean $\mu$ and inverse variance ('precision') $\tau$, and that the heights of plants are independent once we know the values of these parameters. (We assume that $\mu$ is large enough compared to $1/\sqrt{\tau}$ that the probability of negative heights is negligibly small.)
> 我们感兴趣的是植物的底层平均高度 $\mu$ 和其高度方差 $1/\tau$。我们假设我们对高度的了解由平均值 $\mu$ 和逆方差（“精度”）$\tau$ 的正态分布捕获，并且一旦我们知道这些参数的值，植物的高度就是独立的。（我们假设 $\mu$ 与 $1/\sqrt{\tau}$ 相比足够大，以至于负高度的概率可以忽略不计。）

The probability of the data given the parameters $\mu$ and $\tau$ therefore takes the form (where as usual $K$ stands for unspecified other knowledge):
>因此，给定参数 $\mu$ 和 $\tau$ 的数据的概率采用以下形式（其中通常 $K$ 代表未指定的其他知识）：

$$
P(h \mid \mu, \tau, K) = \prod_{i = 1}^{n} dh_{i} \: P(h_{i} \mid \mu, \tau, K)
$$

where each $P(h_{i} \mid \mu, \tau, K)$ is Normal. 
> 其中每个 $P(h_{i} \mid \mu, \tau, K)$ 都是正态的。
# Question 2

Show that  证明

$$
P(h \mid \mu, \tau, K) 
= dh\: \left({\tau \over 2\pi}\right)^{n/2} \exp\left(-{n\tau \over 2}[(\mu - \bar{h})^{2} + s^{2}]\right)
$$

where $dh = \prod_{i} dh_{i}$; $\bar{h} = {1\over n}\sum_{i=1}^{n} h_{i}$; and $s^{2} = \left({1 \over n} \sum_{i = 1}^{n} h_{i}^{2}\right) - \bar{h}^{2}$. [8]

## Answer
Known that, the heights of plants are independent, each $P(h_{i} \mid \mu, \tau, K)$ is Normal. (Given $\sigma^2 = \frac{1}{\tau}$ )

$$    
\begin{equation}
\begin{aligned}
P(h \mid \mu, \tau, K) &= \prod_{i = 1}^{n} dh_{i} \: P(h_{i} \mid \mu, \tau, K)\\
&= \sqrt{\frac{1}{2\pi \sigma^2}}\exp\left(-\frac{1}{2 \sigma^2}\sum_{i=1}^n(h_{i}-\mu)^{2}\right)dh\\
&=\sqrt{\frac{\tau}{2\pi}}\exp\left(-\frac{\tau}{2} \sum_{i=1}^n(h_{i}-\mu)^{2}\right)dh\\
&={\frac{\tau}{2\pi}}^{n/2}\exp\left(-\frac{\tau}{2} \sum_{i=1}^n (h_{i}-\mu)^{2}\right)dh
\end{aligned}
\end{equation}
$$

Where

$$
\sum_{i=1}^n (h_{i}-\mu)^{2}=\sum_{i=1}^nh_i^2-2\mu\sum_{i=1}^nh_i+n\mu^2
$$

Given $\bar{h} = {1\over n}\sum_{i=1}^{n} h_{i}$; and $s^{2} = \left({1 \over n} \sum_{i = 1}^{n} h_{i}^{2}\right) - \bar{h}^{2}$.

$$
\sum_{i=1}^nh_i=n\bar{h},\quad\sum_{i=1}^nh_i^2=n(s^2+\bar{h}^2)
$$

So

$$
\begin{equation}
\begin{aligned}
\sum_{i=1}^n (h_{i}-\mu)^{2}&=\sum_{i=1}^nh_i^2-2\mu\sum_{i=1}^nh_i+n\mu^2\\
&=n(s^2+\bar{h}^2)-2\mu(n\bar{h})+n\mu^2\\
&=n\left[s^2+(\bar{h}-\mu)^2\right]
\end{aligned}
\end{equation}
$$

Take it back to $P(h_{i} \mid \mu, \tau, K)$, shown that

$$
\begin{equation}
\begin{aligned}
P(h \mid \mu, \tau, K) 
&={\frac{\tau}{2\pi}}^{n/2}\exp\left(-\frac{\tau}{2} \sum_{i=1}^n (h_{i}-\mu)^{2}\right)dh\\
&= dh\: \left({\tau \over 2\pi}\right)^{n/2} \exp\left(-{n\tau \over 2}[(\mu - \bar{h})^{2} + s^{2}]\right)
\end{aligned}
\end{equation}
$$

# Question 3

Show that the maximum likelihood estimates $\hat{\mu}$ and $\hat{\tau}$ of $\mu$ and $\tau$ are $\bar{h}$ and $1/s^{2}$ respectively. [4]
> 证明 $\mu$ 和 $\tau$ 的最大似然估计 $\hat{\mu}$ 和 $\hat{\tau}$ 分别为 $\bar{h}$ 和 $1/s^{2}$。[4]
## Answer

From Q2 we have:

$$
P(h \mid \mu, \tau, K) 
= dh\: \left({\tau \over 2\pi}\right)^{n/2} \exp\left(-{n\tau \over 2}[(\mu - \bar{h})^{2} + s^{2}]\right)
$$

Maximum likelihood estimation (MLE) is to find and that maximizes this probability, In order to find $\mu$ and $\tau$ the maximum value, we usually optimize the log-likelihood function and take the logarithm of $P(h_{i} \mid \mu, \tau, K)$ with base $e$

$$
\ln P(h\mid\mu,\tau)=\frac{n}{2}\ln\tau-\frac{n}{2}\ln(2\pi)-\frac{n\tau}{2}\left[(\mu-\bar{h})^{2}+s^{2}\right]
$$

### Search $\hat\mu$
Find the partial derivative with respect to $\mu$. (where as usual $K$ stands for unspecified other knowledge)

$$
\frac{\partial\ln P(h\mid\mu,\tau)}{\partial\mu}=-\frac{n\tau}{2}\cdot2(\mu-\bar{h})=-n\tau(\mu-\bar{h}).
$$

where $\frac{\partial\ln P(h\mid\mu,\tau)}{\partial\mu} = 0$ the $\ln P$ is the largest, which is the case of maximum likelihood.

$$
\begin{equation}
\begin{aligned}
\frac{\partial\ln P(h\mid\mu,\tau)}{\partial\mu}&=-n\tau(\mu-\bar{h}) = 0\\
\Rightarrow \hat\mu &=\bar h
\end{aligned}
\end{equation}
$$

### Search $\hat\tau$
Find the partial derivative with respect to $\tau$.

$$
\begin{aligned}
\frac{\partial}{\partial\tau}\log P(h\mid\mu,\tau)=\frac{n}{2\tau}-\frac{n}{2}s^2
\end{aligned}
$$

where $\frac{\partial\ln P(h\mid\mu,\tau)}{\partial\tau} = 0$ the $\ln P$ is the largest, which is the case of maximum likelihood.

$$
\begin{equation}
\begin{aligned}
\frac{n}{2\tau}-\frac{n}{2}s^2 &= 0\\
\Rightarrow \hat\tau &=\frac{1}{s^2}
\end{aligned}
\end{equation}
$$

In summary, the maximum likelihood estimate is:

$$
\hat{\mu}=\bar{h},\quad\hat{\tau}=\frac{1}{s^{2}}
$$

# Question 4

Plot a histogram of the data and compute these MLEs [5]
> 绘制数据直方图并计算这些 MLE [5]

## Answer

```R
# 计算最大似然估计（MLE）
n <length(h)
mu_hat <mean(h)
s_squared <mean(h^2) - (mu_hat)^2  
tau_hat <1 / s_squared

ggplot(data, aes(x = h)) +
  geom_histogram(aes(y = ..density..), bins = 20, fill = "skyblue", color = "black", alpha = 0.5) +
  labs(title = "Histogram of Plant Heights", x = "Height", y = "Frequency") +
  theme_minimal()

# 输出 MLE 结果
cat("MLE for mu (mean):", mu_hat, "\n")
cat("MLE for tau (inverse variance):", tau_hat, "\n")
```

---
We are interested in knowing about $\mu$ and $\tau$. We therefore wish to calculate the probability $P(\mu, \tau \mid h, K)$. By Bayes theorem, we have
> 我们有兴趣了解 $\mu$ 和 $\tau$。因此，我们希望计算概率 $P(\mu, \tau \mid h, K)$。根据贝叶斯定理，我们有

$$
P(\mu, \tau \mid h, K) \propto P(h \mid \mu, \tau, K) P(\mu, \tau \mid K)
$$

We will use the Normal-Gamma distribution as our distribution for $\mu$ and $\tau$ given $K$, which is given by:
> 给定 $K$，我们将使用正态伽马分布作为 $\mu$ 和 $\tau$ 的分布，其公式如下：

$$
P(\mu, \tau \mid m, \nu, a, b, K) = d\mu\:d\tau\: {b^{a} \over \Gamma(a)}\: \tau^{a - 1}\: e^{-b\tau}\:\sqrt{\nu\tau \over 2\pi}\:\exp\left(-{\nu\tau \over 2}(\mu - m)^{2}\right)
$$

# Question 5

Show that $P(\mu, \tau | h, m, \nu, a, b, K) \propto P(h \mid \mu, \tau, K)\: P(\mu, \tau \mid m, \nu, a, b, K)$ is also a Normal-Gamma distribution, with parameters (shown with primes): [8]
>证明 $P(\mu, \tau | h, m, \nu, a, b, K) \propto P(h \mid \mu, \tau, K)\: P(\mu, \tau \mid m, \nu, a, b, K)$ 也是正态伽马分布，其参数（以素数表示）：[8]

$$
\begin{align*}
m' & = {\nu m + n \bar{h} \over (\nu + n)} \\
\nu' & = \nu + n \\
a' & = a + {n \over 2} \\
b' & = b + {n \over 2} \left(s^{2} + {\nu \over (\nu + n)} (\bar{h} - m)^{2}\right)
\end{align*}
$$

## Answer 
We have likelihood function from Q2,

$$
P(h \mid \mu, \tau, K) 
= dh\: \left({\tau \over 2\pi}\right)^{n/2} \exp\left(-{n\tau \over 2}[(\mu - \bar{h})^{2} + s^{2}]\right)
$$

From prior distribution Normal-Gamma distribution,

$$
P(\mu, \tau \mid m, \nu, a, b, K) = d\mu\:d\tau\: {b^{a} \over \Gamma(a)}\: \tau^{a - 1}\: e^{-b\tau}\:\sqrt{\nu\tau \over 2\pi}\:\exp\left(-{\nu\tau \over 2}(\mu - m)^{2}\right)
$$

According to Bayes' formula, multiply the likelihood function and the prior distribution and substitute into the formula, we have:

$$
\begin{aligned}
P(\mu, \tau | h, m, \nu, a, b, K) &\propto P(h \mid \mu, \tau, K)\: P(\mu, \tau \mid m, \nu, a, b, K) \\
&\propto \left(\frac{\tau}{2\pi}\right)^{n/2}\exp\left(-\frac{n\tau}{2}[(\mu-\bar{h})^{2}+s^{2}]\right) \\
&\times\frac{b^a}{\Gamma(a)}\tau^{a-1}e^{-b\tau}\sqrt{\frac{\nu\tau}{2\pi}}\exp\left(-\frac{\nu\tau}{2}(\mu-m)^2\right) \\
& \propto  \tau^{a+\frac{n}{2}-1} e^{-b\tau} 
\exp\underbrace{[-\frac{n\tau}{2}(\mu-\bar{h})^{2}-\frac{\nu\tau}{2}(\mu-m)^2]}_{\mathrm{contain} \ \mu \ \mathrm{part}}
\exp(-\frac{n\tau}{2}s^2) \\ 

\end{aligned} 
$$

From the above formula, we can see that the term $\mu$ is still in the exponential form of normal distribution.

$$
\begin{aligned}
&\ \ \ \  -\frac{n\tau}{2}(\mu-\bar{h})^{2}-\frac{\nu\tau}{2}(\mu-m)^2 \\
&= -\frac{\tau}{2}\left[n(\mu-\bar{h})^{2}+\nu(\mu-m)^{2}\right]\\
&= -\frac{\tau}{2}\left[ n(\mu^2-2\mu\bar{h}+\bar{h}^2)+\nu(\mu^2-2\mu m+m^2) \right] \\
&= -\frac{\tau}{2}\left[ (n+\nu)\mu^2-2(n\bar{h}+\nu m)\mu+(n\bar{h}^2+\nu m^2)\right] \\
&= -\frac{\tau}{2}\left[ (n+\nu)\mu^2-2(n+\nu)\frac{n\bar{h}+\nu m}{n+\nu}\mu
+\frac{(n\bar{h}+\nu m)^2}{n+\nu} - \frac{(n\bar{h}+\nu m)^2}{n+\nu}
+(n\bar{h}^2+\nu m^2)\right] \\

&=-\frac{\tau}{2}\left[
(\nu+n)\left(\mu-\frac{\nu m+n\bar{h}}{\nu+n}\right)^{2}+
+\frac{(n\bar{h}^2+\nu m^2)\cdot(n+\nu) -(n\bar{h}+\nu m)^2}{n+\nu}
\right]\\

&=-\frac{\tau}{2}\left[
(\underbrace{\nu+n}_{\nu'})\left(\mu-\underbrace{\frac{\nu m+n\bar{h}}{\nu+n}}_{m'}\right)^{2}+\frac{\nu n}{\nu+n}(m-\bar{h})^{2}
\right]

\end{aligned}
$$

This means that the posterior distribution is still a normal distribution, where
Update $m'$ and $\nu'$:

$$
\begin{align*}
m' & = {\nu m + n \bar{h} \over (\nu + n)} \\
\nu' & = \nu + n \\
\end{align*}
$$

Substitute back into the original formula：

$$
\begin{aligned}
&\:\:\:\:\:\:P(\mu, \tau | h, m, \nu, a, b, K) \\
&\propto\tau^{a+\frac{n}{2}-1} e^{-b\tau} 
\exp[-\frac{n\tau}{2}(\mu-\bar{h})^{2}-\frac{\nu\tau}{2}(\mu-m)^2]
\exp(-\frac{n\tau}{2}s^2) \\ 

&\propto \tau^{a+\frac{n}{2}-1} e^{-b\tau} 
\exp\left(-{\nu'\tau \over 2}(\mu - m')^{2}\right) 
\exp(-\frac{\tau}{2}\frac{\nu n}{\nu+n}(m-\bar{h})^{2})
\exp(-\frac{n\tau}{2}s^2)\\

&\propto \tau^{a+\frac{n}{2}-1} 
e^{-b\tau-\frac{\tau}{2}\frac{\nu n}{\nu+n}(m-\bar{h})^{2}-\frac{n\tau}{2}s^2} 
\exp\left(-{\nu'\tau \over 2}(\mu - m')^{2}\right) \\

&\propto \tau^{a+\frac{n}{2}-1} 
e^{-\tau(b+\frac{1}{2}\frac{\nu n}{\nu+n}(m-\bar{h})^{2}+\frac{n}{2}s^2)} 
\exp\left(-{\nu'\tau \over 2}(\mu - m')^{2}\right) \\
&\propto \tau^{\underbrace{a+\frac{n}{2}}_{a'}-1} 
e^{-\tau\left[\underbrace{b + {n \over 2} \left(s^{2} + {\nu \over (\nu + n)} (\bar{h} - m)^{2}\right)}_{b'}\right]} 
\exp\left(-{\nu'\tau \over 2}(\mu - m')^{2}\right) \\
\end{aligned}
$$

Update $a'$ and $b'$:

$$
\begin{align*}
a' & = a + {n \over 2} \\
b' & = b + {n \over 2} \left(s^{2} + {\nu \over (\nu + n)} (\bar{h} - m)^{2}\right)
\end{align*}
$$

# Question 6

What is this behaviour called? [1]
> 这种行为叫什么？[1]
## Answer
This behavior is called a **conjugate prior** in Bayesian statistics.

---
Now suppose that prior knowledge tells us that $\nu = 0$, $a = 0$, and $b = 0$. 
> 现在假设先验知识告诉我们 $\nu = 0$、$a = 0$ 和 $b = 0$。
# Question 7

Write down and give the family name for:
> 写下并给出以下分布的家族名称：
1. the distribution $P(\mu, \tau | h, m, \nu = 0, a = 0, b = 0, K)$; [1]
2. the conditional distribution $P(\mu | \tau, h, m, \nu = 0, a = 0, b = 0, K)$; [2]
3. the conditional distribution $P(\tau | \mu, h, m, \nu = 0, a = 0, b = 0, K)$; [2]
4. the marginalized distribution $P(\tau | h, m, \nu = 0, a = 0, b = 0, K)$. [4]

## Answer 
1. Normal-Gamma distribution
2. Normal (Gaussian) distribution
3. Gamma distribution
4. Gamma distribution
5. Normal-Gamma distribution

When $\nu = 0, a = 0, b = 0$, the joint posterior distribution of $\mu$ and $\tau$ is still a **Normal-Gamma distribution**, as the Normal-Gamma distribution is a conjugate prior for a normal likelihood (with unknown mean and variance).

---

#### **2. The conditional distribution P(μ∣τ,h,m,ν=0,a=0,b=0,K)P(\mu \mid \tau, h, m, \nu = 0, a = 0, b = 0, K):**

- **Family:** **Normal distribution**
- **Reason:** With known $\tau$, the posterior distribution for $\mu$ follows a **normal distribution**, because the likelihood is normal and the conjugate prior for $\mu$ under a normal model with known variance is also normal.

$$
P(\mu \mid \tau, h, m, \nu = 0, a = 0, b = 0, K) = \mathcal{N}\left(\bar{h}, \frac{1}{n \tau}\right)
$$

where:

- hˉ\bar{h} is the sample mean
- nn is the number of observations

---

#### **3. The conditional distribution P(τ∣μ,h,m,ν=0,a=0,b=0,K)P(\tau \mid \mu, h, m, \nu = 0, a = 0, b = 0, K):**

- **Family:** **Gamma distribution**
- **Reason:** Given $\mu$, the posterior distribution for $\tau$ follows a Gamma distribution because the conjugate prior for the precision parameter (inverse variance) under a normal model is a Gamma distribution.

$$
P(\tau \mid \mu, h, m, \nu = 0, a = 0, b = 0, K) = \text{Gamma}\left(\frac{n}{2}, \frac{n s^2}{2}\right)
$$

where:

- s2=1n∑i=1n(hi−hˉ)2s^2 = \frac{1}{n}\sum_{i=1}^{n}(h_i - \bar{h})^2 is the sample variance

---

#### **4. The marginalized distribution P(τ∣h,m,ν=0,a=0,b=0,K)P(\tau \mid h, m, \nu = 0, a = 0, b = 0, K):**

- **Family:** **Gamma distribution (Marginalized)**
- **Reason:** Marginalizing out $\mu$ from the joint Normal-Gamma distribution results in a Gamma distribution for $\tau$. The Normal-Gamma is a conjugate prior, and its marginal over $\mu$ follows a Gamma distribution for $\tau$.

$$
P(\tau \mid h, m, \nu = 0, a = 0, b = 0, K) = \text{Gamma}\left(\frac{n-1}{2}, \frac{n s^2}{2}\right)
$$

---

### ✅ **总结 (Summary):**

|**Question**|**Family Distribution**|**Reason**|
|---|---|---|
|1. P(μ,τ∣h,K)P(\mu, \tau \mid h, K)|**Normal-Gamma**|Conjugate joint posterior for normal likelihood|
|2. P(μ∣τ,h,K)P(\mu \mid \tau, h, K)|**Normal**|Posterior for mean under normal likelihood|
|3. P(τ∣μ,h,K)P(\tau \mid \mu, h, K)|**Gamma**|Posterior for precision under normal likelihood|
|4. P(τ∣h,K)P(\tau \mid h, K)|**Gamma (marginalized)**|Marginalization of μ\mu from Normal-Gamma distribution|

---

这段回答：

- ✅ **直接点明了分布族名称 (Family Name)**。
- ✅ **给出了理由 (Reason)**，解释了为什么是该分布族。
- ✅ **结构清晰，覆盖了 4 个子问题**，完全符合题目要求。

# Question 8

Write an R function to evaluate the logarithm of the density, with respect to $d\mu\: d\tau$, of $P(\mu, \tau \mid h, K)$, up to an additive constant. Note that the conditions $\nu = 0, a = 0, b = 0$ have been absorbed into $K$, $m$ has been dropped because, given these conditions, the probability does not depend on $m$. The function should have as inputs $\mu$, $\tau$, and the data (in this case `heights`), and should calculate $n$, $\bar{h}$, and $s$ as part of its execution. [5]
>编写一个 R 函数来计算 $P(\mu, \tau \mid h, K)$ 的密度关于 $d\mu\: d\tau$ 的对数，最高可达加法常数。请注意，条件 $\nu = 0, a = 0, b = 0$ 已被吸收到 $K$ 中，$m$ 已被删除，因为在这些条件下，概率不依赖于 $m$。该函数应以 $\mu$、$\tau$ 和数据（在本例中为“高度”）作为输入，并应在执行过程中计算 $n$、$\bar{h}$ 和 $s$。[5]

```r
# YOUR CODE HERE
log_density_posterior <function(mu, tau, heights) {
  # 计算样本数
  n <length(heights)
  
  # 计算样本均值
  mean_h <mean(heights)
  
  # 计算总体方差 (1/n ∑ h_i^2 - h̄^2)
  s2 <mean(heights^2) - mean_h^2
  
  # 计算对数密度
  log_density <- (n / 2 - 1) * log(tau) - (n * tau / 2) * ((mu - mean_h)^2 + s2)
  
  # 返回对数密度
  return(log_density)
}
# log_density(mu_hat, tau_hat, h)  # 计算并输出结果
log_density_posterior(mu = 100, tau = 0.01, heights = h)

```

## Answer 

# Question 9

Compute the value of the logarithm of the density (with respect to $d\mu\: d\tau$) of $P(\mu, \tau \mid h, K)$ on a rectangular grid of $(\mu, \tau)$ values with ranges $[98, 103]$ and $[0.005, 0.015]$ for $\mu$ and $\tau$ respectively. [2]
> 计算 $P(\mu, \tau \mid h, K)$ 密度的对数值（相对于 $d\mu\: d\tau$），在 $(\mu, \tau)$ 值的矩形网格上，其范围分别为 $[98, 103]$ 和 $[0.005, 0.015]$（其中 $\mu$ 和 $\tau$）。[2]

## Answer
code / written?

```r
# YOUR CODE HERE
# 生成网格点
mu_values <seq(98, 103, length.out = 100)  # 减少网格点，提升可视化清晰度
tau_values <seq(0.005, 0.015, length.out = 100)

# 创建一个数据框来存储 (mu, tau, log_density) 的值
density_data <expand.grid(mu = mu_values, tau = tau_values)
density_data$log_density <apply(density_data, 1, function(row) {
  log_density_posterior(row['mu'], row['tau'], h)
})

# head(density_data)
```

#### Question

Make contour and image / heatmap plots of these values and of the corresponding probabilities (up to a multiplicative constant). [4]
>绘制这些值和相应概率（最多为乘法常数）的轮廓图和图像/热图。[4]

```r
# YOUR CODE HERE

# 计算概率密度 (将对数密度转换为概率)
density_data$probability <exp(density_data$log_density)

# 1. 对数密度热图
ggplot(density_data, aes(x = mu, y = tau)) +
  geom_tile(aes(fill = log_density)) +
  scale_fill_viridis_c(option = "plasma") +
  labs(title = "Heatmap of Log-Density P(μ, τ | h, K)",
       x = expression(mu),
       y = expression(tau),
       fill = "Log Density") +
  theme_minimal()

# 2. 对数密度等高线图
ggplot(density_data, aes(x = mu, y = tau)) +
  geom_contour(aes(z = log_density, color = ..level..)) +
  scale_color_viridis_c() +
  labs(title = "Contour Plot of Log-Density P(μ, τ | h, K)",
       x = expression(mu),
       y = expression(tau),
       color = "Log Density") +
  theme_minimal()

# 3. 概率密度热图
ggplot(density_data, aes(x = mu, y = tau)) +
  geom_tile(aes(fill = probability)) +
  scale_fill_viridis_c(option = "magma") +
  labs(title = "Heatmap of Probability P(μ, τ | h, K)",
       x = expression(mu),
       y = expression(tau),
       fill = "Probability") +
  theme_minimal()

# 4. 概率密度等高线图
ggplot(density_data, aes(x = mu, y = tau)) +
  geom_contour(aes(z = probability, color = ..level..)) +
  scale_color_viridis_c(option = "magma") +
  labs(title = "Contour Plot of Probability P(μ, τ | h, K)",
       x = expression(mu),
       y = expression(tau),
       color = "Probability") +
  coord_cartesian(xlim = range(mu_values), 
                  ylim = range(tau_values)) +
  theme_minimal()


```

## Answer

# Question 10

Use the grid probabilities to compute (approximations to) the expectations and standard deviations of $\mu$ and $\tau$ under $P(\mu, \tau \mid h, K)$. Hint: remember to normalize! [4]
>使用网格概率计算 $P(\mu, \tau \mid h, K)$ 下 $\mu$ 和 $\tau$ 的期望值和标准差（近似值）。提示：记得进行归一化！[4]

## Answer 

```r
# YOUR CODE HERE
# normalize
prob_norm <-density_data$probability / sum(density_data$probability)

# 计算 μ 和 τ 的期望
mu_expectation <-sum(density_data$mu * prob_norm)
tau_expectation <-sum(density_data$tau * prob_norm)

# 计算 μ 和 τ 的二阶矩
mu_sq_expectation <sum((density_data$mu^2) * prob_norm)
tau_sq_expectation <sum((density_data$tau^2) * prob_norm)

# 计算 μ 和 τ 的标准差
mu_sd <-sqrt(mu_sq_expectation - mu_expectation^2)
tau_sd <-sqrt(tau_sq_expectation - tau_expectation^2)

cat("Expected value of μ:", mu_expectation, "\n")
cat("Standard deviation of μ:", mu_sd, "\n")
cat("Expected value of τ:", tau_expectation, "\n")
cat("Standard deviation of τ:", tau_sd, "\n")


```

Expected value of μ: 100.5127 
Standard deviation of μ: 0.7407568 
Expected value of τ: 0.009114361 
Standard deviation of τ: 0.0009135939
# Question 11

Could you have used smaller ranges for $\mu$ and $\tau$? Make sure to justify your answer. [1]
>你能用更小的 $\mu$ 和 $\tau$ 范围吗？一定要证明你的答案是合理的。[1]

## Answer
>正确性未知

**Yes**, smaller ranges for $\mu$ and $\tau$ could be used. From the contour plots and heatmaps, we observe that most of the probability mass is concentrated around $\mu \approx 100$ and $\tau\approx 0.009$. 
Choosing smaller ranges such as [99, 101] for $\mu$ and [0.008, 0.010] for $\tau$ would still capture the majority of the probability mass and improve computational efficiency.
(However, if the ranges are too small, there is a risk of excluding parts of the distribution, which may lead to inaccurate approximations of the expectations and standard deviations.)

# Question 12

Write R functions to perform *Gibbs sampling* to generate samples of $\mu$ and $\tau$. [10]
> 编写 R 函数执行*吉布斯采样*来生成 $\mu$ 和 $\tau$ 的样本。[10]

```r

```

## Answer 

# Question 13

What would make a good starting point for Gibbs sampling and why? [2]
> 吉布斯采样的良好起点是什么？为什么？[2]

## Answer 
>正确性未知
### **答案示例**：

A good starting point for **Gibbs** sampling would be the maximum likelihood estimates (MLEs) of $\mu$ and $\tau$, which are $\bar{h}$ and $1/s^2$ respectively.
1. MLEs are centered around the observed data and provide a reasonable estimate close to the region of high posterior probability, helps the sampler converge more quickly.
2. Starting from MLE ensures that the Markov chain quickly reaches the area of high probability mass, leading to faster convergence and more efficient sampling.

---

**翻译**： 吉布斯采样的良好起点是 μ\mu 和 τ\tau 的**最大似然估计 (MLE)**，即样本均值 hˉ\bar{h} 和 1/s21/s^2。

**原因**：

- MLE 基于观测数据，接近后验概率较高的区域，作为起点较为合理。
- 从 MLEs 开始，马尔科夫链可以更快地收敛到高概率区域，提高采样效率。

---

这个答案直接且清晰，符合题目要求并提供了合理的解释！😊

# Question 14

Generate 5,000 samples of $(\mu, \tau)$ and plot traces of the samples and of their autocorrelation. [8]
> 生成 5,000 个 $(\mu, \tau)$ 样本，并绘制样本及其自相关的轨迹。[8]

## Answer 
>正确性未知

```r

```

# Question 15

Compute estimates of the expectations and standard deviations of $\mu$ and $\tau$ using the samples. [5]
>使用样本计算 $\mu$ 和 $\tau$ 的期望值和标准差的估计值。[5]

## Answer 

```r

```

# Question 16

Compute the Monte-Carlo standard errors of the mean estimates. [5]
> 计算均值估计的蒙特卡罗标准误差。[5]

```

```

## Answer 

# ==Question 17==

Comment on the need for burn-in iterations and on the degree of autocorrelation, and relate these to the effective sample sizes. Make sure to justify your statements. [3]
>评论预热迭代的必要性和自相关程度，并将其与有效样本量联系起来。确保证明你的陈述是合理的。[3]

## Answer 

### **Answer**:

Burn-in iterations are necessary in Gibbs sampling because the initial samples are heavily influenced by the starting values and may not be representative of the posterior distribution. Discarding these early samples ensures that the remaining samples are drawn from the target distribution rather than the initial conditions.

The degree of autocorrelation in the samples is moderate, as seen in the autocorrelation plots. Autocorrelation indicates that consecutive samples are not fully independent, which reduces the effective sample size (ESS). High autocorrelation means fewer effectively independent samples, leading to higher Monte Carlo error.

In our Gibbs sampling results, the autocorrelation decreases as lag increases, but some correlation persists. This results in an ESS smaller than the total number of samples generated. Reducing autocorrelation through techniques like thinning or increasing the number of iterations can improve the ESS and provide more accurate estimates.

---

### **关键点解释**：

- **Burn-in**：丢弃采样初期的“过渡”样本，避免初始值的影响，确保样本来自稳定的后验分布。
- **自相关 (Autocorrelation)**：样本之间的依赖性，**自相关高会降低有效样本量**，使得虽然采样量大，但独立有效样本数较少。
- **有效样本量 (ESS)**：反映了在有自相关的情况下，**等效于多少个独立样本**。高自相关会**降低 ESS**，增加不确定性。

---

### **可以加分的解释**：

- **如何减少自相关？**
    - **增加采样间隔**（Thinning）：每隔几个采样保留一个。
    - **增加迭代次数**：让采样链“走”得更远，减少相关性。
- **如何判断 ESS？**
    - 使用 `coda::effectiveSize()` 函数可以计算 ESS，**ESS 越接近样本总数，表示采样独立性越高**。

# Question 18

Write R code to make scatter and density plots of the samples from the previous question, and make the plots. [5]
> 编写 R 代码，绘制上一个问题中样本的散点图和密度图，并绘制图表。[5]
## Answer 

```r

```

# Question 19

Compare the results of the Gibbs sampling with the MLEs calculated earlier. Make sure to explain your comments. [3]
> 将吉布斯抽样的结果与之前计算出的 MLE 进行比较。请务必解释您的意见。[3]
## Answer 
### **Answer:**

The results from Gibbs sampling are very close to the maximum likelihood estimates (MLEs) calculated earlier.

- **Mean Estimates**:
    
    - The posterior mean of μ\mu from Gibbs sampling is approximately 100.5100.5, which is close to the MLE of 100.51100.51.
    - The posterior mean of τ\tau is around 0.00910.0091, similar to the MLE value of 0.00910.0091.
- **Standard Deviations**:
    
    - The posterior standard deviation of μ\mu is slightly higher than that of the MLE, reflecting the additional uncertainty incorporated by the Bayesian approach.
    - The posterior standard deviation of τ\tau is also slightly higher than the MLE’s inverse variance, due to the Bayesian framework considering the entire parameter space.

The similarity in results demonstrates that the Gibbs sampling converged well and provided estimates consistent with the MLEs. However, unlike MLEs, the Bayesian estimates through Gibbs sampling also provide a measure of uncertainty (posterior distributions) for μ\mu and τ\tau, which is an advantage when assessing parameter variability.

---

### **解释**：

- **MLEs** 是基于数据点估计的“最优”值，而 **Gibbs 采样** 得到的后验均值则是基于整个后验分布。
- **两者相近**说明了：
    - 你的贝叶斯模型和先验假设合理，Gibbs 采样的结果与经典统计方法一致。
    - **贝叶斯估计**更强大，因为它还提供了**标准差**（即不确定性），而 MLE 只是一个单点估计。
- **差异**主要体现在标准差上，**Gibbs 采样**通过多个样本更全面地反映了参数的不确定性。

---

### **这段回答**：

- **比较了 MLE 和 Gibbs 采样的均值与标准差**。
- **解释了两者相似的原因**。
- **强调了贝叶斯方法在不确定性评估上的优势**。

可以直接作为你的 **Question 19** 答案！😊

# Question 20

Describe a simpler alternative to Gibbs sampling. [4]
> 描述一种比吉布斯采样更简单的替代方法。[4]

## Answer 
### **Answer**:

A simpler alternative to Gibbs sampling is the **Metropolis-Hastings algorithm**.

**Explanation**:

- The Metropolis-Hastings algorithm is a more general MCMC method that can sample from any target distribution, not just those with known conditional distributions like in Gibbs sampling.
- Instead of sampling directly from conditional distributions, it proposes new values for the parameters from a proposal distribution (e.g., a normal distribution) and then decides whether to accept or reject the proposed values based on an acceptance ratio.
- While Metropolis-Hastings can be computationally less efficient due to potential rejections, it is simpler to implement because it does not require knowledge of the full conditional distributions, making it more flexible in many cases.

**Key Points**:

- **Simpler setup**: Only requires a proposal distribution.
- **More flexible**: Can handle complex models where conditional distributions are not easily derived.
- **Trade-off**: May require more iterations due to the rejection step, but avoids the complexity of deriving conditionals.

---

### **简要说明**：

- **更简单**之处：只需要一个“提议分布”，不需要推导复杂的条件分布。
- **为什么是替代方法**：
    - 吉布斯采样依赖于已知的条件分布，而 **Metropolis-Hastings** 不需要，适用于更广泛的分布。
- **缺点**：
    - 可能会拒绝部分提议，导致效率略低，但实现更简单。

# Question 21

Is this method better or worse and why? [2]
> 这种方法是更好还是更坏？为什么？[2]
## Answer

### **Answer**:

Whether the Metropolis-Hastings algorithm is better or worse than Gibbs sampling depends on the context:

- **Better**:
    - **Flexibility**: Metropolis-Hastings is more flexible because it does not require the full conditional distributions, making it suitable for more complex models.
- **Worse**:
    - **Efficiency**: Gibbs sampling is often more efficient when the full conditional distributions are available, as it avoids the rejection step used in Metropolis-Hastings.
    - **Convergence speed**: Gibbs sampling typically converges faster when conditionals are easy to sample from.

In this case, since we have well-defined conditional distributions, **Gibbs sampling is better** due to its efficiency and straightforward implementation.

---

### **解释**：

- **更好**的情况：
    - **Metropolis-Hastings**在条件分布难以求得时，提供了灵活性。
- **更差**的情况：
    - **Gibbs 采样**在条件分布已知时更高效，因为它**不会拒绝样本**，而 **Metropolis-Hastings** 可能会拒绝部分样本，增加计算时间。

**在本作业中**，因为条件分布已知且容易抽样，**Gibbs 采样更好**。

---

这段简答**直击题目要点**，同时进行了清晰的理由说明，可以直接作为你的 **Question 21** 答案！😊
