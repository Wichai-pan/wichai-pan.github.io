---
layout: private
title: 2025-05-20
author: wichai
date: 2025-05-20 15:10
categories:
  - Study
  - Master
tags:
  - DU
mermaid: true
math: true
pin: false
---

### Look back
- Prepare write
	- Literature Review(14) and Project Plan
	- Ethical Assessment Form (if needed)
	- Risk Assessment (if needed)
- Cellpose 1/2/3/SAM
- AIM-CICs(2022)    an automatic identification method for cell-in-cell structures
	- detect: Faster-R-CNN + ResNet-50 &  classify: ResNet-101

---
![](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/20250520224940646.png)

---
![image.png](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/20250521005135562.png)

---
### Look forward
- Continue finding and reading literature
	- Unet method
	- CellViT
	- traditional method paper
- Finish formative assignment

21.5.2025

%% -- %%

---
### Look back

- AIM-CICs
	- Detection + Classification (not segmentation)
	- with code. no model weights (already email)
- Try to use Cellpose-SAM
	- need label to tune
- Learn to use ImageJ    
- Instanseg August 29, 2024

---
![image.png](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/20250526205034543.png)

---

![image.png](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/20250526205210911.png)

---
### Look forward
- Image label 
- Train and test a model based on Cellpose-SAM to ”panoptic segmentation”
- Try other segment model
27.05.2025

---
### Look back
- Labeling
- Tried YOLOv12
	- not very good
	- 90 images (70% train 20% cal 10% test)
	- Data Augmentation
- Label data for cellpose tarining (Not yet finished)
---
### Look forward
- Try more method (CellViT)
- Data Augmentation
04.06.2025

keep on searching papers

---
### Look back
- label data for cellpose-sam
- train models in cellpose-sam
	- some case  good
	- some case bad
	- The cells can be found, but they are closer to a circle, closer to the center
- Read paper
	- MedSAM
	- MedSAM2
	- MedSAM Adapter

---

![image.png](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/20250611132658897.png)

---

![image.png](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/20250611132735446.png)

---
![image.png](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/20250611141038055.png)

---
![image.png](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/20250611140734445.png)

---
![image.png](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/20250611141954269.png)

---

### Look forward
- Try training with different parameters
- Try more method (CellViT)
- Understand paper
11/6
---

### Look back
- cellpose-sam trained
	- average precision at iou threshold 0.5 = 0.704
- Focus on nucleus
	- Hover-Net H&E color different with Fluorescence staining
- Cell-Vit some problems with the ncc environment configuration

---
![Project Result 100.png](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/Project%20Result%20100.png)

---

![image.png](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/20250618020900178.png)

---
### Look forward
- CellViT/Deepcell
- Detection of nucleus
- Detection of cell membranes
18/06
---

### Look back
- CellViT 
	- environment done but image form need .wsi(.tiff etc.)
- The previously trained models were deployed locally and online
	- <https://huggingface.co/spaces/Wichai-pan/test>

---
![image.png](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/20250625033909819.png)

---
![image.png](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/20250625034725451.png)

---
### Look forward
- Wait for more data from Mary
- Separately segement the cell membrane and nucleus, and then judge based on the morphology.