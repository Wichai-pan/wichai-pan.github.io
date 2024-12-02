---
layout: post
title: Robotics Review
author: wichai
date: 2024-12-2 9:00 
categories: [Study, Master]
tags: [DU, Robotics]
mermaid: true
math: true
pin: false
---



10倒计算题



1. L2 气缸压力
2. 机械臂 关节 自由度 冗余度
3. 坐标系变换 transformation 旋转矩阵
4. alpha a d theta Manipulator Kinematics 
5. 车 omega 差速
6. 高斯误差 s x t theta
7. hk sk qk
8. 雅可比矩阵 (带入?)
9. ? Localisation 
10. ？？控制 PID
11. A* 路径规划
12. Probabilistic Mapping 算概率





# 1 Cylinders 

![image-20241202180233818](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/image-20241202180233818.png)





# 2

- 每个刚体需要 6 个参数来描述
  – 3 个位置
  – 3 个方向



n 个移动连杆 → 6n 个参数
n 个关节 → 5n 个约束
有多少个自由度？
6n – 5n = n 个自由度



$m_0$是末端执行器的自由度

max -> 6

冗余度 (n > m) n - m 





# 3 坐标系变换 旋转矩阵

- $^B_AR$ 坐标系A到坐标系B的旋转矩阵

$$
^AP =\ ^A_BR\ ^BP +\ ^AP_{Borg} \\
$$

$$
\begin{bmatrix}
    ^AP \\ 
    1
  \end{bmatrix}
  = \begin{bmatrix}
    ^A_BR &\ ^AP_{Borg} \\
    0\ 0\ 0 & 1
  \end{bmatrix}
  = \begin{bmatrix}
    ^BP\\
    1
  \end{bmatrix}
$$

eg.<img src="https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/image-20241202184007196.png" alt="image-20241202184007196" style="zoom:50%;" />


- Inverse Transform 逆变换
  $$
    ^A_B T = \begin{bmatrix} 
    ^A_B R & ^A P_{Borg} \\ 
    0\ 0\ 0 & 1 \end{bmatrix}
  $$

  $$
    ^A_B T^{-1} = ^B_A T = 
    \begin{bmatrix} 
    ^A_B R^T & -^A_B R^T \cdot\ ^AP_{Borg} \\ 
    0\ 0\ 0 & 1 \end{bmatrix}
  $$

# 4 alpha a d theta (L5)

> 右手定则
>
> **右手法则**是判断旋转角度正负的基础规则：
>
> - **规则**：用右手握住旋转轴，拇指指向轴的正方向（例如，$Z_i$轴的正方向），其余四指的弯曲方向为**正旋转方向**。
> - **正角度**：如果旋转是沿着右手四指弯曲的方向，则角度为正。
> - **负角度**：如果旋转是反方向（即与右手四指弯曲方向相反），则角度为负。
{: .prompt-tip }

**$\alpha_{i-1}$**：绕$x_{i-1}$轴，从$z_{i-1}$到$z_i$的夹角。

**$a_{i-1}$**：沿$x_{i-1}$轴，从$z_{i-1}$到$z_i$的距离。(与x垂直)

**$d_i$**：沿$x_i$轴，从$x_{i-1}$到$x_i$的距离。

**$\theta_i$**：绕$z_i$轴，从$x_{i-1}$到$x_i$的夹角 (与z垂直)


- Forward Kinematics:  
  $$
    ^{i-1}_iT = ^{i-1}_RT\ ^R_QT\ ^Q_PT\ ^P_iT
  $$

  $$
  {}^{i-1}_i T(\alpha_{i-1}, a_{i-1}, \theta_i, d_i) = R_x(\alpha_{i-1}) D_x(a_{i-1}) R_z(\theta_i) D_z(d_i)
  $$

  $$
  {}^{i-1}_i T =
  \begin{bmatrix}
  c\theta_i & -s\theta_i c\alpha_{i-1} & s\theta_i s\alpha_{i-1} & a_{i-1} c\theta_i \\
  s\theta_i & c\theta_i c\alpha_{i-1} & -c\theta_i s\alpha_{i-1} & a_{i-1} s\theta_i \\
  0 & s\alpha_{i-1} & c\alpha_{i-1} & d_i \\
  0 & 0 & 0 & 1
  \end{bmatrix}
  $$



eg.1.

![image-20241202205115377](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/image-20241202205115377.png)

eg.2. ？？

![image-20241202205435270](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/image-20241202205435270.png)

eg.3.

eg.4.