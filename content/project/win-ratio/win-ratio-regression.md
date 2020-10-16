---
date: "2016-04-27T00:00:00Z"
external_link: ""
image:
  caption: Figure 2 in Luo et al (2014). An Alternative Approach to Confidence Interval Estimation for the Win Ratio Statistic
  focal_point: Smart
links:
summary: Develop a semiparametric proportional win fractions (PWF) regression framework for (prioritized) composite endpoints.
tags:
- Survival Analysis
- Clinical Trial
title: Proportional win-fractions regression
url_code: "https://cran.r-project.org/web/packages/WR/index.html"
url_pdf: ""
url_slides: ""
url_video: ""
---

The win ratio is gaining traction as a simple and intuitive approach to analysis of prioritized composite endpoints. To extend it from two-sample testing to regression, we propose a general class of semiparametric models that encompasses both the sequential-comparison-based win ratio and the Cox proportional hazards model on time to the first event as special cases. Under the assumption that the covariate-specific win and loss fractions are proportional over time, i.e., that the covariate-specific curtailed win ratio is time-constant, the regression parameter is free from influence by the censoring distribution and can be interpreted as the log win ratio associated with one-unit increase in the covariate. Consistent estimators for the regression parameter are derived based on a class of U-statistic weighted estimating equations, with correct asymptotic variances estimated using U-statistic theory. Deviation from the proportionality assumption may be visually detected by graphing a “score process” as a function of time, similar to the partial-likelihood score process for the proportional hazards model. Extensive simulation studies suggest that the proposed methods perform well under realistic sample sizes. Data from a major cardiovascular clinical trial are analyzed using the proposed regression model as an illustration.
