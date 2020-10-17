---
title: Rerandomization in clinical trials
date: "2020-04-20T00:00:00Z"
external_link: ""
image:
links:
summary: 
tags:
- Causal Inference
- Clinical Trial
url_code: ""
url_pdf: ""
url_slides: ""
url_video: ""
---

In many clinical trials, the ultimate goal is to estimate the treatment effect. Balanced randomization, which eliminate the effect of confounders, is the key to get correct causal effect. In a clinical trial with a large sample size, balanced randomization can be easily achieved. However, in a clinical trial with a smaller sample size, such as trials that need cluster randomization, a randomization can make treatment group and control group with significantly unbalanced covariates. In practice, one can only include a small amount of stratification in cluster randomization, leaving many other equally or more important covariates stay unbalanced. However, we can also rerandomize and check the balance of covariates until a certain criterion satisfied. In this project, I reviewed the general procedure for randomization proposed by Mogan and Rubin (2012) and a specific randomization procedure based on propensity score matching proposed by Xu and Kalbfleisch (2010). Please see the detailed [notes](rerandomization.pdf) here.
