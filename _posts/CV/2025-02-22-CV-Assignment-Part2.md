---
layout: post
title: 2025-02-22
author: wichai
date: 2025-02-22 00:09
categories: [Study, Master]
tags: [DU, ]
mermaid: true
math: true
pin: false
---

# Part 2 (55%)
You must develop code to analyse video clips taken from the last Olympic games (Paris 2024).
To start with, you are asked to download the video clips from the last Olympic games. They have been prepared for you, instructions where data can be found are provided later.
For this part, you have additional tasks to solve; please read the following instructions for details:
>您必须编写代码来分析上届奥运会（巴黎 2024）的视频片段。
首先，您需要下载上届奥运会的视频片段。这些视频片段已经为您准备好了，稍后会提供数据查找说明。
对于这一部分，您还有其他任务需要解决；请阅读以下说明以了​​解详情：

**Task 3 (15%): Target detection** - for this part, you are asked to exploit one of the taught algorithms to extract bounding boxes that identify the targets in the scene. Targets are represented by either objects or people moving in the video clips.
Expected Output: Bounding rectangles should be used to show the target, as well as an ID and/or a different colour per target.
> **任务 3 (15%)：目标检测** - 对于这一部分，您需要利用其中一种教授的算法来提取识别场景中目标的边界框。目标由视频片段中移动的物体或人表示。
预期输出：应使用边界矩形来显示目标，以及每个目标的 ID 和/或不同颜色。

Hint: For this part I am expecting you to exploit the latest **YOLO and SAM**(and!!!) versions to detect the targets. Targets will have to be in and on the court, so one or more criteria will have to be defined to discard any proposals (deep network suggestions of bounding rectangles) that does not fit. You can also use the idea that at most two players are on each side of the court.
Marking: the implementation exploits existing deep architectures, so validation and testing will be essential to get full marks. Ideally, the result will have to show “tight” bounding rectangles or closed polylines for the extracted targets, with an error measure such as the intersection over union (IoU) as a viable metric. Comparison of existing architectures applied to the problem attracts 10%, the other 5% is for the most suitable metric to assess the result.
> 提示：对于这一部分，我希望您利用最新的 YOLO 和 SAM 版本来检测目标。目标必须在球场内，因此必须定义一个或多个标准以丢弃任何不适合的提议（深度网络对边界矩形的建议）。您还可以使用最多两名球员在球场两侧的想法。
评分：实施利用了现有的深度架构，因此验证和测试对于获得满分至关重要。理想情况下，结果必须显示提取目标的“紧密”边界矩形或封闭折线，并使用诸如交并比 (IoU) 之类的误差度量作为可行指标。应用于问题的现有架构的比较占 10%，另外 5% 用于评估结果的最合适指标。

**Task 4 (20%): Target tracking** - for this part, you are asked to use one of the taught techniques to track the targets. Tracking does mean using a filter to estimate and predict the dynamics of the moving target, not simply detecting targets in each frame.
Expected Output: For this task you should provide short video clips using the processed image frames, the current position of the targets in the scene and their trajectories. Targets should be highlighted with a bounding rectangle in colour or a polygonal shape and their trajectories with a polyline in red (do see the examples in figure 2).
>对于这一部分，要求您使用所教授的技术之一来跟踪目标。跟踪确实意味着使用过滤器来估计和预测移动目标的动态，而不仅仅是检测每帧中的目标。
预期输出：对于此任务，您应该使用处理后的图像帧、场景中目标的当前位置及其轨迹提供简短的视频剪辑。目标应使用彩色或多边形的边界矩形突出显示，其轨迹应使用红色折线突出显示（请参见图 2 中的示例）。

Hint: For this task, you can use the dynamic filters you have been taught to track targets in the scene. You can feel free to use any deep learning method as well you have read during the four weeks.
Marking: the accuracy of the tracking will be a determining factor to obtain full marks, you are recommended to use the metrics you used to solve Task 3. Full marks if any spatial-temporal filter is implemented and manages to track players on the court. A comparison of at least two filters attracts 8%. The other 5% is for the generation of a video clip as qualitative output and 7% for quantitative results.
>提示：对于此任务，您可以使用已学过的动态过滤器来跟踪场景中的目标。您也可以随意使用您在四周内阅读的任何深度学习方法。
评分：跟踪的准确性将是获得满分的决定性因素，建议您使用用于解决任务 3 的指标。如果实施了任何时空过滤器并设法跟踪球场上的球员，则可获得满分。至少两个过滤器的比较可获得 8%。另外 5% 用于生成视频剪辑作为定性输出，7% 用于定量结果。

**Task 5 (20%): Optical flow** – for this task, you are asked to use one of the algorithms taught in class to estimate and visualise the optical flow of the analysed scene.
Expected output: Once you have run the algorithm of your choice you can use any of methods used in the workshop or any method you find one the Internet to visualise the optical flow. A video clip must be generated, with optical flow overlapped to the original clip. Figure 3 shows two different ways to visualise optical flow.
>对于此任务，您需要使用课堂上教授的算法之一来估计和可视化所分析场景的光流。
预期输出：运行您选择的算法后，您可以使用研讨会中使用的任何方法或您在互联网上找到的任何方法来可视化光流。必须生成视频剪辑，并将光流重叠到原始剪辑上。图 3 显示了两种不同的光流可视化方法。

Hint: For this task, you can use any of the algorithms taught to use for the detection and visualisation of optical flow. Again, you can feel free to use any deep learning method as well you have read during the four weeks.
Marking: 10% for the detection of the optical flow, trying to disambiguate between moving camera and targets and 10% for the visualisation. The latter must be integrated in a video clip, with flow overlapped over the video clip frames.
>提示：对于此任务，您可以使用任何教授的用于检测和可视化光流的算法。同样，您也可以随意使用您在四周内阅读过的任何深度学习方法。
评分：10% 用于检测光流，尝试消除移动相机和目标之间的歧义，10% 用于可视化。后者必须集成在视频剪辑中，并将光流重叠在视频剪辑帧上。
