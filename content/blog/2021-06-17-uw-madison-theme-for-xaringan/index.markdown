---
author: Tuo Wang
categories:
  - Data Science
  - Data Visualization
date: "2021-06-17"
draft: false
excerpt: University of Wisconsin-Madison theme for xaringan presentation
subtitle:
title: UW-Madison theme for xaringan
---

In May, I passed my Ph.D. prelim exam! When I was preparing the prelim slides, I really wanted to try something new. I'm tired of the `beamer` slides (no offense, just because they are everywhere). Then I found the [`xaringan`](https://github.com/yihui/xaringan) R package. The `xaringan` package enable us to create slides in R Markdown with [`remark.js`](https://remarkjs.com/#1). The name comes from Sharingan from the anime Naruto! 🤣😆🤣

I think `xaringan` is game-changer for presentation, especially you need present any R codes. Like the `beamer` slides, `xaringan` has many themes. However, there is no theme for University of Wisconsin-Madison. Therefore, when I was creating my prelim slides using `xaringan`, I created a UW-Madison theme inspired by [Joseph Casillas's](https://www.jvcasillas.com/) [Rutgers theme](https://github.com/jvcasillas/ru_xaringan). Recently, [Yihui](https://yihui.org/en/about/), the author of `xaringan`, approved my pull request about the UW-Madison theme. This is actually my first pull request! Here are some a couple of screenshots for the theme:

![demo1](1.png)

![demo2](2.png)

![demo3](3.png)

![demo4](4.png)


## UW-Madison theme for xaringan

Here is a summary about the UW-Madison theme:

- [Github repositories](https://github.com/ttuowang/Xaringan-wisconsin-theme)

- [Demo](https://ttuowang.github.io/Xaringan-wisconsin-theme/#1)

- How to install `xaringan`:


```r
devtools::install_github('yihui/xaringan')
```

- How to enable the UW-Madison theme:

```md
output:
  xaringan::moon_reader:
    lib_dir: libs
    css: ["uwm", "uwm-fonts"]
    nature:
      highlightStyle: github
      highlightLines: true
      countIncrementalSlides: false
      ratio: "16:9"
```

## Some great tutorials and extensions for xaringan

- Here are some great tutorials:

  - [Xaringan github](https://github.com/yihui/xaringan)

  - [Yihui's tutorial](https://slides.yihui.org/xaringan/#1)
  
  - [Making Slides in the Tada!-verse](https://apreshill.github.io/data-vis-labs-2018/slides/06-slides_xaringan.html#1)
  
  - [Making slides in R Markdown](http://arm.rbind.io/slides/xaringan.html#1)

- Some useful extensions for `Xaringan`

  - [`xaringanExtra` R package](https://github.com/gadenbuie/xaringanExtra)
  
  - [`xaringanthemer` R packge](https://pkg.garrickadenbuie.com/xaringanthemer/index.html)
  
  - [Xaringan Gallery](https://xaringan.gallery/)
  
  - [`DT` R package for interactive tables](https://rstudio.github.io/DT/)

## Some Tips

- Do not forget to try the option **`yolo: true`** under **`xaringan::moon_reader`** in the YAML metadata of your R Markdown document. A picture of smiling Karl will be randomly insert in the slides.

- Use [`DT`](https://rstudio.github.io/DT/) for interactive tables.

- [`xaringanExtra` R package](https://github.com/gadenbuie/xaringanExtra) has many other additional and powerful features.

- Insert emoji by using [`emo`](https://github.com/hadley/emo) R package 🤔 😆 👍


- Insert icon by using [`icons`](https://github.com/mitchelloharawild/icons) R package <svg viewBox="0 0 512 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M459.37 151.716c.325 4.548.325 9.097.325 13.645 0 138.72-105.583 298.558-298.558 298.558-59.452 0-114.68-17.219-161.137-47.106 8.447.974 16.568 1.299 25.34 1.299 49.055 0 94.213-16.568 130.274-44.832-46.132-.975-84.792-31.188-98.112-72.772 6.498.974 12.995 1.624 19.818 1.624 9.421 0 18.843-1.3 27.614-3.573-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319-28.264-18.843-46.781-51.005-46.781-87.391 0-19.492 5.197-37.36 14.294-52.954 51.655 63.675 129.3 105.258 216.365 109.807-1.624-7.797-2.599-15.918-2.599-24.04 0-57.828 46.782-104.934 104.934-104.934 30.213 0 57.502 12.67 76.67 33.137 23.715-4.548 46.456-13.32 66.599-25.34-7.798 24.366-24.366 44.833-46.132 57.827 21.117-2.273 41.584-8.122 60.426-16.243-14.292 20.791-32.161 39.308-52.628 54.253z"></path></svg> <svg viewBox="0 0 488 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M488 261.8C488 403.3 391.1 504 248 504 110.8 504 0 393.2 0 256S110.8 8 248 8c66.8 0 123 24.5 166.3 64.9l-67.5 64.9C258.5 52.6 94.3 116.6 94.3 256c0 86.5 69.1 156.6 153.7 156.6 98.2 0 135-70.4 140.8-106.9H248v-85.3h236.1c2.3 12.7 3.9 24.9 3.9 41.4z"></path></svg> <svg viewBox="0 0 581 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"></path></svg> <svg viewBox="0 0 448 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <g groupmode="layer" id="layer6" label="icon">    <path style="stroke-width:0.0659789" d="m 195.58936,208.73772 c 0,15.55383 -5.86902,28.16291 -13.10872,28.16291 -7.23968,0 -13.10867,-12.60908 -13.10867,-28.16291 0,-15.55387 5.86899,-28.16291 13.10867,-28.16291 7.2397,0 13.10872,12.60904 13.10872,28.16291 z m 83.04548,0 c 0,15.55383 -5.862,28.16291 -13.09252,28.16291 -7.2305,0 -13.09249,-12.60908 -13.09249,-28.16291 0,-15.55387 5.86199,-28.16291 13.09249,-28.16291 7.23052,0 13.09252,12.60904 13.09252,28.16291 z m 21.96974,61.46161 h -13.87517 c 0,7.29744 2.7024,13.98368 7.09441,19.32768 -4.72014,11.84302 -32.98544,26.65577 -69.8283,26.65577 -36.82843,0 -65.10814,-14.81275 -69.82831,-26.65577 4.37454,-5.344 7.11019,-12.03024 7.11019,-19.32768 h -13.89092 c 0,9.78066 -8.65587,17.73435 -19.28133,17.73435 v 13.89093 c 5.37419,0 10.40628,-1.36019 14.90551,-3.54725 10.18882,17.10874 41.62511,31.79636 80.98486,31.79636 39.37421,0 70.79606,-14.68806 80.98313,-31.79636 4.50098,2.18706 9.5313,3.54725 14.90725,3.54725 v -13.89093 c -10.62545,0 -19.28132,-7.95369 -19.28132,-17.73435 z m 117.28038,109.71743 c -4.15663,-7.71829 -7.75029,-9.26573 -14.50079,-11.35825 -5.79681,-1.75045 -15.98394,-0.93758 -24.76446,2.48321 -1.99981,0.78224 -3.8128,2.04791 -5.71982,3.07822 -5.68618,3.04633 -9.1087,2.45258 -13.43684,-2.17129 -2.48499,-2.67179 -10.28161,-9.71986 -20.98357,-19.87502 21.84286,-25.99994 35.03161,-59.46839 35.03161,-96.0776 0,-36.59347 -13.18705,-70.07766 -35.03161,-96.07762 10.70245,-10.14072 18.48285,-17.17083 20.96781,-19.85749 4.32822,-4.62564 7.75024,-5.21934 13.43816,-2.15684 1.90574,1.01584 3.71831,2.28153 5.7185,3.06245 8.76483,3.42254 18.96761,4.23495 24.76445,2.4688 6.73441,-2.07679 10.34372,-3.6238 14.50087,-11.34209 2.54709,-5.95344 3.48458,-11.20295 1.62571,-17.8752 -1.86068,-6.64165 -9.46874,-10.90724 -19.03197,-12.56316 -7.6719,-1.34397 -4.51493,-2.59213 -4.65583,-9.468711 -0.18747,-10.311783 -3.89115,-18.419016 -12.68781,-23.921393 -6.6561,-4.124714 -14.28158,-4.452841 -21.6556,-4.187273 -10.14079,0.328256 -20.59338,5.344023 -23.15669,11.374448 -3.04628,7.124642 0.37754,11.718326 3.17276,16.812531 3.6097,6.515201 1.84315,13.046118 -2.82889,18.484628 -5.0465,5.92152 -17.45257,18.65572 -24.51508,26.17102 -25.06193,-18.99999 -56.23486,-30.4191 -90.12417,-30.4191 -33.90681,0 -65.07794,11.41911 -90.15608,30.4366 -7.06252,-7.53413 -19.46858,-20.26876 -24.51509,-26.19024 -4.67202,-5.43851 -6.42246,-11.969465 -2.82885,-18.500849 2.79689,-5.078456 6.21901,-9.671709 3.18715,-16.796782 -2.57774,-6.046201 -13.030368,-11.046317 -23.171111,-11.374445 -7.374426,-0.281805 -15.015709,0.04641 -21.671779,4.18727 -8.780534,5.48487 -12.499272,13.60961 -12.687824,23.905221 -0.124726,6.890999 3.031854,8.140915 -4.655843,9.484885 -9.561485,1.6415 -17.155086,5.92152 -19.03019,12.54695 -1.859358,6.67182 -0.921823,11.93754 1.62575,17.87522 4.155321,7.71831 7.76465,9.2815 14.499032,11.35828 5.796817,1.76616 15.999662,0.93756 24.780653,-2.4688 1.999796,-0.79666 3.812763,-2.06236 5.718512,-3.06246 5.687867,-3.06248 9.094227,-2.48325 13.436804,2.14068 2.498994,2.70415 10.281618,9.73427 20.967886,19.87498 -21.841565,25.99993 -35.028558,59.48413 -35.028558,96.07763 0,36.60922 13.203203,70.10827 35.031598,96.09335 -10.688023,10.13896 -18.468447,17.18704 -20.967846,19.85879 -4.343895,4.6239 -7.750271,5.21761 -13.436834,2.17133 -1.905707,-1.0321 -3.718281,-2.29772 -5.718504,-3.07822 -8.780534,-3.42078 -18.98381,-4.23365 -24.780657,-2.48324 -6.734352,2.09299 -10.343688,3.63995 -14.49904,11.35822 -2.547104,5.95348 -3.484635,11.20474 -1.62575,17.8752 1.875142,6.63988 9.468751,10.90547 19.031982,12.56312 7.688094,1.34227 4.531117,2.59343 4.655816,9.4687 0.187316,10.31178 3.905529,18.42078 12.687821,23.92142 6.656065,4.1248 14.29739,4.45283 21.671813,4.18732 10.140709,-0.31182 20.593369,-5.34406 23.171069,-11.37445 3.03186,-7.11021 -0.39022,-11.73414 -3.18714,-16.81256 -3.59358,-6.50076 -1.84318,-13.03168 2.82885,-18.48462 5.0465,-5.90577 17.45257,-18.65568 24.51508,-26.18674 25.07815,19.01568 56.24927,30.43657 90.15609,30.43657 33.90552,0 65.06181,-11.42089 90.1242,-30.43657 7.06248,7.53106 19.48473,20.28134 24.53083,26.18674 4.67198,5.45294 6.42242,11.98386 2.82883,18.48462 -2.81265,5.07842 -6.21902,9.70235 -3.18892,16.81256 2.58078,6.03171 13.03171,11.06206 23.17239,11.37445 7.37448,0.2657 15.01576,-0.0624 21.67363,-4.18732 8.78048,-5.50064 12.48295,-13.60964 12.67204,-23.92142 0.13947,-6.87527 -3.01614,-8.12643 4.67197,-9.4687 9.54574,-1.65765 17.15515,-5.92324 19.01406,-12.56312 1.86893,-6.67186 0.91523,-11.92127 -1.63058,-17.8752 z M 224.0117,396.26067 c -77.34318,0 -140.264262,-62.92105 -140.264262,-140.26421 0,-77.3274 62.921082,-140.24852 140.264262,-140.24852 77.31126,0 140.24858,62.92112 140.24858,140.24852 0,77.34316 -62.93689,140.26421 -140.24858,140.26421 z" id="path2"></path>  </g></svg>

- If you don't like the default font size and color, you can change them by using html syntax `<span style='font-size:55pt; color:#cc0033'> some text! </span>`

- If you want to change any elements of this theme, feel free to edit the source file as you like.

- The best way to learn about `Xaringan` is reading other people's source codes.



