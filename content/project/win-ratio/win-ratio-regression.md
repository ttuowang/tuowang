---
date: "2020-04-27T00:00:00Z"
external_link: ""
image:
  caption: Figure 2 in Luo et al (2014). An Alternative Approach to Confidence Interval Estimation for the Win Ratio Statistic
  focal_point: Smart
links:
summary: Develop a semiparametric proportional win fractions (PWF) regression framework for (prioritized) composite endpoints.
tags:
- Survival Analysis
- Clinical Trial
title: Proportional win-fractions regression (win ratio regression)
url_code: "https://cran.r-project.org/web/packages/WR/index.html"
url_pdf: "https://onlinelibrary.wiley.com/doi/10.1111/biom.13382"
url_slides: ""
url_video: ""
---

The win ratio is gaining traction as a simple and intuitive approach to analysis of prioritized composite endpoints in clinical trials. To extend it from two-sample comparison to regression, we propose a novel class of semi- parametric models that includes as special cases both the two-sample win ratio and the traditional Cox proportional hazards model on time to the first event. Under the assumption that the covariate-specific win and loss fractions are proportional over time, the regression parameter can be interpreted as the log win ratio associated with one-unit increase in the covariate and is unrelated to the censoring distribution. A class of U-statistic estimating functions, in the form of an arbitrary covariate-specific weight process integrated by a pairwise residual process, is constructed to obtain consistent estimators for the regression parameter. The asymptotic properties of the estimators are derived using uniform weak convergence theory for U-processes. Visual inspection of a “score” process provides useful clues as to the plausibility of the proportionality assumption. Extensive numerical studies using both simulated and real data from a major cardiovascular trial show that the multiple regression methods provide valid inference on covariate effects and outperform the two-sample win ratio in both efficiency and robustness. The proposed methodology is implemented in the R-package WR publicly available from the Comprehensive R Archive Network (CRAN).
