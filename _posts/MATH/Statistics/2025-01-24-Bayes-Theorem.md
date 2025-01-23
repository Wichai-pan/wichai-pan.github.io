---
layout: post
title: Baye's Theorem 贝叶斯定理
author: wichai
date: 2025-01-22 22:08
categories:
  - Study
  - Master
tags:
  - Math
  - 数学
  - 概率
  - 贝叶斯
mermaid: true
math: true
pin: false
---

# Bayes' Theorem

[Bayes' Theorem 贝叶斯定理 - YouTube](https://www.youtube.com/watch?v=Pu675cHJ7bg)

[[2025-01-25-conditional-probability|条件概率]] & 样本空间 

Example:
![image.png](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/20250122222551.png)

![image.png](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/20250122222701.png)

- [05:13](https://www.youtube.com/watch?v=Pu675cHJ7bg&t=313#t=05:13.29) 
- $P(A|B)$: probability of A occurring of given B is true A在B发生的条件下发生的概率  （B时基础）

$$
P(A\cap B) = P(A|B)\times P(B) = P(B|A)\times P(A)
$$

> **Bayes' Theorem:** $$ P(H|E)=\frac{P(E|H)\cdot P(H)}{P(E)} $$

- $H$: Hypothesis 假设
- $E$: Evidence 已知的证据
- $\bar H$ : not H

变体

![image.png](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/20250122224147.png)

假设 成立/不成立

与初始直观不相符的例子
![image.png](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/20250122224356.png)

![image.png](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/20250122224533.png)

![image.png](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/20250122224724.png)

- [16:44](https://www.youtube.com/watch?v=Pu675cHJ7bg&t=1005#t=16:44.83) 患病例子
- 先验概率 后验概率？
- 两次检测的概率 
- [17:59](https://www.youtube.com/watch?v=Pu675cHJ7bg&t=1079#t=17:59.31)  

- 迭代运算 <- 核心精神 准确的判断一个假设是否正确

# 另一个讲解

[Bayes theorem, the geometry of changing beliefs - YouTube](https://www.youtube.com/watch?v=HZGCoVF3YvM)
基本一样的另一个例子 [一文搞懂贝叶斯定理（原理篇） - Blogs - 廖雪峰的官方网站](https://liaoxuefeng.com/blogs/all/2023-08-27-bayes-explain/index.html)
