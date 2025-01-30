---
layout: post
title: CV-workshop5
author: wichai
date: 2025-01-30 14:35
categories:
  - Study
  - Master
tags:
  - DU
  - CV
mermaid: true
math: true
pin: false
---
# Workshop 5
## MISCADA – Computer Vision
### Prof. Paolo Remagnino

# Colour detection and segmentation

- Go to  
  - [https://realpython.com/python-opencv-color-spaces/](https://realpython.com/python-opencv-color-spaces/)
- Read the article
- Use the proposed method to segment an image  
  - Some images have been posted in the Blackboard folder for workshop5
- Select an area of a given colour, for instance a rectangular area
- The colour of the pixels in that region can be employed to create the mean and standard deviation for the region colour
- Use that information to write a simple algorithm that detects pixels of that colour
- Plot the results

$P=\{(s_x,sy),...(e_x,ey)\}$
# Example

- You compute mean and standard deviation of P
- Try to do this with a region in the sky
- You then use the mean and deviation to select in the image those pixels that fit that Gaussian
- You could even create a heatmap where the expected colour is

![image.png](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/20250130143719.png)

# Colour segmentation

- With any colourful image
  - Segment in the (r, g) space, where r and g and the normalized red and green components
  - Segment in the (u, v) space, after having converted pixels from RGB to YUV

# Hough Transform

- Go to  
  - [https://docs.opencv.org/3.4/d9/db0/tutorial_hough_lines.html](https://docs.opencv.org/3.4/d9/db0/tutorial_hough_lines.html)
- Learn about the Hough transform and how to use it in OpenCV
- Experiment with the chess and go board images I have provided in the same folder
- Try now tuning all the tunable parameters
- Plot all the results
