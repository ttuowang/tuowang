---
title: Confidence interval for Kaplan-Meier estimator
author: Tuo Wang
date: '2021-02-10'
slug: []
categories: []
output: hugodown::md_document
tags:
  - Survival Analysis
  - Clinical Trial
rmd_hash: 0a2039c8cf612ca1

---

The Kaplan-Meier estimator is one of the most popular statistical methods in survival analysis. In this tutorial, I will present how to calculate the confidence interval for the Kaplan-Meier estimator in R.

Let $T$ denote the time to event. Let $C$ denote the time to censoring. Define $S(t) = P(T > t)$ as the survival function. Let $d_j$ and $n_j$ be the number of patients die and at risk at time $t_j$. Then the Kaplan-Meier estimator is

$$
\widehat{S}(t) = \prod_{j:t_j \leq t}(1 - \frac{d_j}{n_j}).
$$

Here I use the *ovarian* data in the R *survival* package as an example.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span class='kr'><a href='https://rdrr.io/r/base/library.html'>library</a></span><span class='o'>(</span><span class='nv'><a href='https://github.com/therneau/survival'>survival</a></span><span class='o'>)</span>
<span class='nv'>fit1</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://rdrr.io/pkg/survival/man/survfit.html'>survfit</a></span><span class='o'>(</span><span class='nf'><a href='https://rdrr.io/pkg/survival/man/Surv.html'>Surv</a></span><span class='o'>(</span><span class='nv'>futime</span>, <span class='nv'>fustat</span><span class='o'>)</span> <span class='o'>~</span> <span class='nv'>resid.ds</span>, data<span class='o'>=</span><span class='nv'>ovarian</span><span class='o'>)</span>
<span class='nf'><a href='https://rdrr.io/r/base/print.html'>print</a></span><span class='o'>(</span><span class='nv'>fit1</span><span class='o'>)</span>

<span class='c'>#&gt; Call: survfit(formula = Surv(futime, fustat) ~ resid.ds, data = ovarian)</span>
<span class='c'>#&gt; </span>
<span class='c'>#&gt;             n events median 0.95LCL 0.95UCL</span>
<span class='c'>#&gt; resid.ds=1 11      3     NA     638      NA</span>
<span class='c'>#&gt; resid.ds=2 15      9    464     329      NA</span>
</code></pre>

</div>

