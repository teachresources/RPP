---
# Page settings
layout: default
head_title: Practice!
keywords:
comments: false

# Hero section
title: Practice!
description: >

# Micro navigation
micro_nav: false

# Page navigation
page_nav:
    prev:
        content: Homework 2.2 - Paper
        url: '/u4/paper/'
    next:
        content: Explore Data
        url: '/u5/'
---

# Step1: Open RStudio

# Step 2: Install swirl
Type the following into the console:

```
install.packages("swirl")
```

# Step 3: Start swirl
This is the only step that you will repeat every time you want to run swirl. First, you will load the package using the ```library()``` function. Then you will call the function that starts the magic! 

Type the following, pressing Enter after each line:

```
library("swirl")
install_course("R Programming")
```

If it does not work, you can install manually:

* Download [this](http://swirlstats.com/scn/R_Programming.swc) file. 
* Save this file on your RPP Directory:
* Select the file you just downloaded: *R_Programming.swc*.

Run:

```
swirl::install_course() 
```

# Step4: Have fun!

```
swirl()
```
* Select `R Programming`
* Practice 1 to 6! 