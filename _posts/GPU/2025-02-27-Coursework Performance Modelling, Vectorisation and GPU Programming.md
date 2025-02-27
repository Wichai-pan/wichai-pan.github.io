---
layout: post
title: "Coursework: Performance Modelling, Vectorisation and GPU Programming"
author: wichai
date: 2025-02-26 20:40
categories:
  - Study
  - Master
tags:
  - DU
  - GPU
  - AI
mermaid: true
math: true
pin: false
---

# Coursework: Performance Modelling, Vectorisation and GPU Programming

**Module:** Performance Modelling, Vectorisation and GPU Programming (COMP 52315)  
**Term:** Epiphany term, 2025  
**Lecturer:** Anne Reinarz¹ and Christopher Marcotte²  

## Submission
Please submit a zip-directory containing all files required for this assignment via the Gradescope submission point provided via Blackboard Learn Ultra at <https://blackboard.durham.ac.uk/ultra/courses/_57185_1/outline>.

## Deadlines
Consult the MISCADA learning and teaching handbook for submission deadlines.

## Plagiarism and collusion
Students suspected of plagiarism, either of published work or work from unpublished sources, including the work of other students, or of collusion will be dealt with according to Computer Science and University guidelines.

## Preface
You inherited the number crunching code contained in number_crunching.cpp. Your goal is to conduct a performance analysis of the code and develop a parallel implementation for GPUs to minimize its execution time while maintaining correctness.

## Question 1
The objective of this question is to examine the performance of number_crunching.cpp on CPUs. Please use Hamilton 8 for all measurements in this question. Use the slurm partition shared (add the #SBATCH -p shared directive to your job script) for development, and the partition test (add the #SBATCH -p test directive) for your final performance measurement. The test partition will allow you to reserve a whole node, and exclusive access will help you ensure reliability of the measurement and reproducibility of the result.

### (1.1)
In report_<CIS_username>.pdf, report the number of data accesses (loads and stores), the number of floating point operations, and the best case operational intensity of the functions function_a(), function_b(), function_c(), and function_d(). The best case operational intensity should be determined by hand — this task requires looking at the source code, but not running it. For clarity, you may want to use a table.

**Marking scheme.** Each function is worth 3 marks: one for the correct data access count, one for the correct floating point count, and one for the correct operational intensity. Marks will be awarded independently; if your data access and/or floating point operation count are incorrect, but you item them correctly in the formula for the operational intensity, you will still get the mark for operational intensity. Be sure to explain your process clearly in the report.

### (1.2)
Use the profiling tool gprof to determine the overall execution time and the hottest function(s) that requires the most execution time. In order to determine the influence of the problem size, carry out the profiling for $N = k \cdot 10^4$, where $k = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10$. Visualize the execution times graphically in report_<CIS_username>.pdf. Submit a script number_crunching_gprof.sh containing the commands you used to profile the code, and the file number_crunching_gprof.out with the output produced by gprof for the largest input data set.

¹[anne.reinarz@durham.ac.uk](mailto:anne.reinarz@durham.ac.uk)  
²[christopher.marcotte@durham.ac.uk](mailto:christopher.marcotte@durham.ac.uk)  

# Marking scheme

In your report the graph is worth 4 marks, the reported output is worth 5 marks and the explanation of the output using your results from Task (1.1) is worth 5 marks. If the script and output of the script are not provided a mark of zero will be given. 

## 1.3 
Use likwid to profile the memory and floating point performance of the hotspot function as determined in Task (1.2) for $N = 10^6$. Submit the instrumented code `number_crunching.likwid.cpp`, a shell script `number_crunching.likwid.sh` with the commands you used to run the benchmark, and a file number_crunching.likwid.out containing the output of those commands. In `report_<CIS_username>.pdf`, report the observed operational intensity and discuss the results.

**Marking scheme.** The correct instrumented code and shell script are worth up to 3 marks each, the correct output is worth 3 marks if correct and 0 otherwise. The write-up is worth 6 marks.

## 1.4 
Visualise the results obtained for the hotspot function as determined in Task (1.2) in the form of a roofline model. In `report_<CIS_username>.pdf`, outline what techniques could be applied to optimize the execution time of the code on CPUs based on this. Your discussion should be no longer than 150 words.

**Marking scheme.** Your discussion must take into account the roofline model and the results of Tasks (1.1)-(1.3). No marks will be given for a general discussion, which doesn’t take the measurements into account. The roofline model is worth 3 marks and the discussion is worth 6 marks.

# Question 2

Please use NCC to develop and test all subsequent implementation tasks.

## 2.1 
Use either CUDA, OpenMP or SYCL to develop a GPU implementation of `number_crunching.cpp` that exploits the loop-parallelismcontained in the compute functions `function_a()`, `function_b()`, `function_c()` and `function_d()`. Your source code as `number_crunching_loop.cpp` (dependent on your chosen programming model) and adjust the Makefile to build your GPU code by adding a target `loopgpu`.

**Marking scheme.** Only implementations that maintain correctness under concurrent execution will receive marks. An implementation is correct if it corresponds to the reference solution as computed by the sequential implementation for the same problem size $N$.

## 2.2 
Draw the task graph of the source code in `number_crunching.cpp` at function level and include it in the `report_<CIS_username>.pdf`.

**Marking scheme.** 1 mark is awarded for each function node with the correct data dependencies.

## 2.3 
Extend your GPU-implementation of `number_crunching.cpp` to also make use of task parallelism by executing independent compute functions simultaneously. Your implementation should allow to execute all data-independent functions, as determined in Task (2.2), concurrently. Submit your source code as `number_crunching_task.cu` or `number_crunching_task.cpp` (dependent on your chosen programming model) and adjust the Makefile to build your GPU code by adding a target `taskgpu`.

**Marking scheme.** Only implementations that maintain correctness under concurrent execution will receive marks. An implementation is correct if it corresponds to the reference solution as computed by the sequential implementation for the same problem size $N$.

## 2.4 
In `report_<CIS_username>.pdf`, write a short essay (500 words at most) that describes your approach to porting the code to GPUs and justifies the techniques used. Use plots as you see fit. In your report, you should:

- Explain why you chose the programming model you applied,
- Outline the memory management approach,

- Justify any code restructuring and performance optimization techniques,
- Outline how your approach allows for the overlapping execution of kernels in a task-parallel manner,
- Determine the runtime for a problem size $N$ of your choice and compare the corresponding runtime with the sequential runtime on CPUs. If applicable to your programming model, determine the optimal kernel configuration.

Marking scheme. A maximum of 4 marks is awarded for each of the points listed above. [20 marks]

| **题目序号** | **任务**                                                                                                                                                                                          | **评分标准**                                                                                         | **总分数** |
| :------: | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------- | :-----: |
| **1.1**  | 手动计算并报告 `function_a()`、`function_b()`、`function_c()` 与 `function_d()` 的1) 数据访问次数（读+写）2) 浮点运算次数3) 理论运算强度（operational intensity）                                                                  | - 每个函数： • 数据访问数正确计 1 分 • 浮点运算数正确计 1 分 • 运算强度正确计 1 分- 若前两项有误但在计算运算强度时逻辑正确，仍可得运算强度分- 需在报告中清晰说明推导过程 |  12 分   |
| **1.2**  | 使用 gprof 对不同规模 N（N = k×10^4，k=1..10）进行分析：1) 获取整体执行时间并找出热点函数2) 在报告中图表化显示执行时间3) 提交脚本 number_crunching_gprof.sh 及 gprof 输出 number_crunching_gprof.out                                              | - 报告中的执行时间图表：4 分gprof 输出结果：5 分- 结合 (1.1) 结果对输出进行解释：5 分- 若脚本与输出文件未提交，则本题计 0 分                     |  14 分   |
| **1.3**  | 使用 likwid 对 (1.2) 得到的热点函数（N=10^4 或题干给出的 N=10^6，需按要求）进行内存与浮点性能分析，比较实际运算强度并讨论结果；提交：• number_crunching_likwid.cpp（插桩代码）• number_crunching_likwid.sh（运行脚本）• number_crunching_likwid.out（输出结果）       | - 正确的插装代码：3 分- 正确的脚本：3 分- 输出结果正确：3 分（错误则 0 分）- 在报告中对实际运算强度及结果进行讨论：6 分                            |  15 分   |
| **1.4**  | 在报告中使用屋顶线（Roofline）模型可视化 (1.2) 中的热点函数性能测试结果，并结合 (1.1)-(1.3) 的数据简述可在 CPU 上优化该代码的技术，限 150 字（英文单词）                                                                                                 | - 屋顶线模型绘制：3 分- 结合测量结果进行有针对性的讨论：6 分- 若讨论仅泛泛而谈、不结合实际数据则不计分                                         |   9 分   |
| **2.1**  | 使用 CUDA、OpenMP 或 SYCL 之一，在 GPU 上实现 number_crunching.cpp，利用 `function_a()`、`function_b()`、`function_c()`、`function_d()` 中的循环并行。提交源代码（number_crunching_loop.cu / .cpp）并在 Makefile 中添加目标 `loopgpu` | - 必须在并行执行下保持正确性（结果与原顺序实现一致）- 正确且符合并行要求则可获满分                                                      |  18 分   |
| **2.2**  | 在函数级别绘制 `number_crunching.cpp` 中各函数的任务图，展现数据依赖关系，并写入报告。                                                                                                                                         | - 每个函数节点及其正确依赖关系：1 分/函数节点- 总计不超过 6 分                                                             |   6 分   |
| **2.3**  | 在 GPU 版本基础上增加任务并行（Task Parallelism），使数据无依赖的计算函数可并行执行。提交源代码（number_crunching_task.cu / .cpp）并在 Makefile 中添加目标 `taskgpu`                                                                          | - 并行执行下仍保持正确性（结果与顺序版一致）- 正确则可获满分                                                                 |   6 分   |
| **2.4**  | 在报告（report_<CIS_username>.pdf）中撰写不超过 500 字（英文单词）的短文，说明将代码移植至 GPU 的思路与使用的技术，并可含示意图表。需涵盖：1) 选择的编程模型与原因2) 内存管理方案3) 代码重构及优化4) 内核任务如何重叠执行5) 对比 GPU 与 CPU 的执行时间，并讨论最佳内核配置（若适用）                        | - 以上 5 大点，各 4 分，共 20 分                                                                           |  20 分   |
