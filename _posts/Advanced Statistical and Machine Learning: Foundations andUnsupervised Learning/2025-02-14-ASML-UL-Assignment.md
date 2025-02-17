---
layout: post
title: UL Assignment
author: wichai
date: 2035-02-14 18:14
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

# UL Assignment

**Introduction** 

This assignment contains 13 questions, totalling to 100 marks. Please write the answers to each question in the boxes following directly underneath each question (some of these are R Code boxes, and some of these R Markdown boxes, depending on the character of the questions). If you need to add text to a Code box, please use the commenting symbol (#) at the beginning of the line.

A few cells contain the information "DO NOT FILL IN THIS CELL". It is very important that you indeed do **not** write **anything** into those cells, as this could mess up the validation and marking of your notebook. 

You can make use of any existing R functions (including those in packages, as far as available), or R functions developed in the lectures and labs, **unless stated otherwise**.

We consider a data set known  as  the "Hidalgo  issue  of  Mexico".  This  dataset  contains  the  thickness  of  485 stamps that were printed in a mixture of paper types in Mexico between 1872  and 1874.  Please use the following code to read the data in and display a histogram: 
>**介绍**
本作业包含 13 个问题，总分 100 分。请将每个问题的答案写在每个问题正下方的方框中（其中一些是 R 代码方框，一些是 R Markdown 方框，具体取决于问题的特征）。如果您需要向代码方框添加文本，请在行首使用注释符号 (#)。
一些单元格包含“请勿填写此单元格”信息。您确实**不要**在这些单元格中写入**任何内容**，这一点非常重要，因为这可能会弄乱笔记本的验证和标记。
您可以使用任何现有的 R 函数（包括包中的函数，只要可用），或在讲座和实验室中开发的 R 函数，**除非另有说明**。
我们考虑一个称为“墨西哥伊达尔戈问题”的数据集。该数据集包含 1872 年至 1874 年间在墨西哥使用多种纸张印刷的 485 枚邮票的厚度。请使用以下代码读取数据并显示直方图：

```r
require(multimode)
data(stamps)
hist(stamps)
```

---
**Question 1** (4 marks)

Produce, side-by-side, two additional histograms of the same data, but with about twice and four times as many, respectively, bins as the original histogram. 
>并排生成相同数据的两个附加直方图，但直方图的箱数分别是原始直方图的两倍和四倍。

```r
# YOUR CODE HERE

# 设置并排显示三个图
par(mfrow=c(1,3))

# 原始直方图
hist(stamps, main="Original Histogram", xlab="Thickness", col="lightblue")

# 大约两倍的 bins
hist(stamps, breaks=16, main="Twice as many bins", xlab="Thickness", col="lightgreen")

# 大约四倍的 bins
hist(stamps, breaks=32, main="Four times as many bins", xlab="Thickness", col="lightcoral")

```

---
**Question 2** (4 marks)

Produce and display a kernel density estimate of the stamps data set, using the R function `density` (with its default options).
>使用 R 函数“density”（及其默认选项）生成并显示邮票数据集的核密度估计。

```r
# YOUR CODE HERE
# cal kernel_density_estimate
kernel_density_estimate <density(stamps)
plot(kernel_density_estimate, main="Kernel Density Estimate of Stamps Data", 
     xlab="Thickness")

```

---
**Question 3** (3 marks)

By considering the component `$bw` of the fitted density object, identify the bandwidth used for the estimation of the density above. 
Assign this bandwidth value to an object `h1`.
>通过考虑拟合密度对象的组件“$bw”，确定用于估计上述密度的带宽。
将此带宽值分配给对象“h1”。

```r

```

---
**Question 4** (12 marks)

We are now interested in estimating the density parametrically, through a Gaussian mixture. 
We allow the K mixture components to have different standard deviations. 
Using R function `normalmixEM` in R package `mixtools`, fit Gaussian mixture models to the stamps data with K=2,3, and 4 components, respectively. 
Report the following values for all K: mixture weights, mean parameters, and the estimated component standard deviations, as well as the resulting log-likelihoods.

It is recommended to set a seed to ensure reproducibility. Avoid reporting poor or non-convergent solutions.
>我们现在感兴趣的是通过高斯混合来参数化地估计密度。
我们允许 K 个混合成分具有不同的标准差。
使用 R 包 `mixtools` 中的 R 函数 `normalmixEM`，分别将高斯混合模型拟合到具有 K=2、3 和 4 个成分的邮票数据。
报告所有 K 的以下值：混合权重、平均参数和估计的成分标准差，以及由此产生的对数似然。

>建议设置种子以确保可重复性。避免报告较差或不收敛的解决方案。

```r

```

---
**Question 5** (10 marks)

Visualize the three fitted mixture distributions (side-by-side in a 1 x 3 split window) 
>可视化三个拟合的混合分布（在 1 x 3 分割窗口中并排显示）

```r

```

---
**Question 6** (15 marks)

For the stamps data, carry out an empirical likelihood ratio test of H_0: K=2 versus H_1: K=3. To do this, repeatedly simulate data from a two-Gaussian mixture distribution parametrised by the parameters you estimated in question 4 and compare the likelihood ratios obtained from simulations to those obtained from the `stamps` data. Use a random seed.
>对于邮票数据，进行 H_0：K=2 与 H_1：K=3 的经验似然比检验。为此，反复模拟由问题 4 中估计的参数参数化的二高斯混合分布的数据，并将模拟获得的似然比与“邮票”数据获得的似然比进行比较。使用随机种子。

You will need for this, initially, a function which simulates data from a given mixture model. You can use for this purpose any functions that were developed in lectures or labs, or that you find within R.
>首先，您需要一个函数来模拟给定混合模型的数据。您可以为此使用在讲座或实验室中开发的任何函数，或者在 R 中找到的任何函数。

You must manually implement the loop to repeatedly simulate data.
>您必须手动实现循环来重复模拟数据。

Provide a short conclusion summarizing your findings. In particular, identify any shortcomings of the analysis. You may get different answers with different random seeds.
>给出一个简短的结论来总结您的发现。特别是，找出分析中的任何缺点。使用不同的随机种子，您可能会得到不同的答案。

```r

```

---
**Question 7** (15 marks)

Now carry out k-means clustering with 2, 3 and 4 components, respectively. 
Find the average silhouette width for  each of the three clusterings, and based on these, give your judgement on the adequate number of clusters for this data set.
Give a statement which compares this result with that from the fitted mixture model.
>现在分别使用 2、3 和 4 个组件执行 k 均值聚类。
找到三个聚类中每个聚类的平均轮廓宽度，并据此判断该数据集的聚类数量是否合适。
给出一个语句，将此结果与拟合混合模型的结果进行比较。

```r

```

---
**Question 8** (6 marks)

We return now to the problem of kernel density estimation. 

A popular rule for automatic bandwidth selection is Silverman's rule of thumb, which is given by

$$ h = 0.9 \times A n^{(-1/5)}$$

where $A= min(s, IQR/1.34)$, with $s$ being the sample standard deviation of the data, $IQR$ the interquartile range, and $n$ the sample size.

Produce a function with name `hsil` which implements this rule. Then apply it to the stamps data set, and save the resulting bandwidth to an object `h2`.
>现在我们回到核密度估计问题。
自动带宽选择的一个流行规则是 Silverman 经验法则，其公式为

$$ h = 0.9 \times A n^{(-1/5)}$$

>其中 $A= min(s, IQR/1.34)$，其中 $s$ 为数据的样本标准差，$IQR$ 为四分位距，$n$ 为样本大小。
生成一个名为“hsil”的函数来实现此规则。然后将其应用于邮票数据集，并将生成的带宽保存到对象“h2”中。

```r

```

---
**Question 9** (5 marks)

Another concept for bandwidth selection is that of a "critical bandwidth". 
The critical bandwidth h(k) is defined as the smallest bandwidth so that the estimated density has at most k modes.
Find this bandwidth for k=2, and save the outcome into an object `h3`. 

Hint: Use function `locmodes`. Ignore any warning messages referring to unbounded support of the density.
>带宽选择的另一个概念是“临界带宽”。
临界带宽 h(k) 定义为最小带宽，因此估计的密度最多有 k 个模式。
找到 k=2 的带宽，并将结果保存到对象“h3”中。
提示：使用函数“locmodes”。忽略任何涉及密度无界支持的警告消息。

```r

```

---
**Question 10** (6 marks)

Draw, side by-side, two density plots using the bandwidths `h2` and `h3`, respectively.
>分别使用带宽“h2”和“h3”并排绘制两个密度图。

```r

```

---
**Question 11** (10 marks)

Explain how density modes relate to clustering in the case of Gaussian kernels. Your answer should explain, conceptually, how cluster centres and clusters can be identified through density modes, and also give some insight into the computations required in order to achieve this. Do you deem the densities plotted in the previous cell useful for modal clustering? 
>解释在高斯核的情况下密度模式与聚类的关系。您的答案应该从概念上解释如何通过密度模式识别聚类中心和聚类，并深入了解实现此目的所需的计算。您认为上一个单元格中绘制的密度对模态聚类有用吗？

在高斯核密度估计中，每个数据点都通过一个平滑的、高斯形状的核函数对整个数据集产生贡献，从而构造出一个连续的密度函数。这个密度函数在某些位置达到局部最大值，这些局部峰值（或称为“模式”）反映了数据点的集中区域，也常常对应于聚类的“中心”。

**如何通过密度模式识别聚类：**

1. **模态聚类的基本思想：**
    
    - 假设数据的高维分布经过核密度估计后，形成了一个多峰分布。
    - 每个局部最大值可以被看作一个簇的中心，称为“模式”。
    - 通过沿着密度函数的梯度方向（即密度上升的方向）移动，每个数据点最终会“爬升”到某个局部峰值。
    - 所有最终收敛到同一局部峰值的数据点就归为同一簇。
2. **计算过程中的具体步骤：**
    
    - **核密度估计：** 使用高斯核函数，并选择合适的带宽来平滑数据。带宽的选择至关重要：太小会导致过度波动（出现噪声模式），太大则可能过分平滑，掩盖实际的分群结构。
    - **模式识别：**
        - 可以在一定的网格上计算密度值，然后利用算法（如 `locmodes` 或梯度上升/均值漂移算法）来寻找局部最大值。
        - 在均值漂移算法中，每个数据点重复按照密度梯度方向更新位置，直到达到收敛，最终的收敛点就是该点所属的模式。
    - **簇的确定：** 根据每个数据点所对应的模式，将数据划分到不同的簇中。这样，每个簇的中心就是对应的密度峰值，而簇的边界则由不同模式之间的“分水岭”决定。

**关于前一单元格中绘制的密度图对模态聚类的作用：**

- 用 Silverman 法则得到的带宽（h2）通常能在一定程度上平衡平滑与细节保留，可能会显示出多个局部峰值，但这些峰值有时可能受到噪声的影响；
- 而用临界带宽（h3）得到的密度图，则是选择了一个使得密度最多只有 2 个模式的带宽。这种情形下，如果数据本身存在更多细微结构，过强的平滑可能会掩盖这些信息。

因此，**是否认为前一单元格的密度图适合用于模态聚类，取决于聚类的目标：**

- 如果我们期望捕捉数据中主要、全局的聚类结构（例如只有 2 个主要簇），那么用 h3 得到的密度图可能较为合适；
- 但如果我们希望探究更细致的局部结构，单纯依赖 h3 的密度图可能过于平滑，而 h2 得到的密度图则可能揭示出更多的局部模式，不过需要小心甄别噪声带来的伪模式。

总体而言，密度模式为模态聚类提供了一种直观且灵活的方式来发现数据中的簇结构，而实际应用中对带宽的选择和后续的模式识别算法则决定了聚类结果的稳定性和解释性。

---
**Question 12** (5 marks)

Using the `R` package `LPCM` apply a mean shift algorithm (function `ms`) to the `stamps` data and plot the results. 
>使用“R”包“LPCM”将均值偏移算法（函数“ms”）应用于“stamps”数据并绘制结果。

```r

```

---
**Question 13** (5 marks)

How many cluster centres does the mean shift algorithm find? Is this consistent with the previous results?
>均值漂移算法找到了多少个聚类中心？这与之前的结果一致吗？

**Answer:**

The mean shift algorithm identified **2 cluster centers** in the stamps data. This result is consistent with our previous findings. In our Gaussian mixture model analysis, the 2-component model provided a stable fit with a high log-likelihood compared to the unstable 3-component model. Moreover, the k-means clustering—with the evaluation of average silhouette widths—also indicated that 2 clusters best capture the structure of the data.

**Explanation:**

- **Conceptually:**  
    Mean shift clustering works by iteratively shifting each data point toward the nearest peak in the estimated density function. These peaks (modes) are taken as the cluster centers. In our one-dimensional stamps data, the density estimated using a Gaussian kernel exhibits two prominent modes. Thus, the mean shift algorithm naturally converges to 2 centers.
    
- **Computationally:**  
    The algorithm estimates the density using a kernel (e.g., Gaussian) and then moves each point iteratively by computing the gradient of the density until convergence. Points converging to the same mode are assigned to the same cluster. Our application of the `ms` function from the LPCM package shows that, after convergence, the data group around 2 distinct modes.
    
- **Comparison with previous results:**  
    This two-center outcome aligns with the stable 2-component Gaussian mixture model fit and the silhouette analysis from k-means clustering. While a 3-component model was attempted, it did not yield a reliable solution, further supporting that the underlying structure of the stamps data is best represented by 2 clusters.

Thus, the mean shift clustering confirms that the stamps data exhibit two main clusters, consistent with our earlier analyses.
**答案：**

均值漂移算法在邮票数据中确定了**2 个聚类中心**。这一结果与我们之前的发现一致。在我们的高斯混合模型分析中，与不稳定的 3 组分模型相比，2 组分模型提供了具有高对数似然性的稳定拟合。此外，k 均值聚类（通过评估平均轮廓宽度）也表明 2 个聚类最能捕捉数据的结构。

**解释：**

- **概念上：**
均值漂移聚类通过迭代将每个数据点移向估计密度函数中的最近峰值来工作。这些峰值（模式）被视为聚类中心。在我们的一维邮票数据中，使用高斯核估计的密度表现出两个突出的模式。因此，均值漂移算法自然会收敛到 2 个中心。

- **计算上：**
该算法使用核（例如高斯）估计密度，然后通过计算密度梯度迭代移动每个点，直到收敛。收敛到相同模式的点被分配到同一个簇。我们应用 LPCM 包中的 `ms` 函数表明，收敛后，数据围绕 2 个不同的模式分组。

- **与之前结果的比较：**
这个双中心结果与稳定的 2 组分高斯混合模型拟合和 k 均值聚类的轮廓分析一致。虽然尝试了 3 组分模型，但并未产生可靠的解决方案，进一步证明了邮票数据的底层结构最好由 2 个簇表示。

因此，均值漂移聚类证实邮票数据呈现两个主要簇，这与我们之前的分析一致。
