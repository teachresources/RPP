---
# Page settings
layout: default
head_title: Troubleshooting and How to find help
keywords:
comments: false

# Hero section
title: Troubleshooting and How to find help
description: >

# Micro navigation
micro_nav: false

# Page navigation
page_nav:
    prev:
        content: Intro R
        url: '/u4/'
    next:
        content: Homework 2.2 - Papers
        url: '/u4/paper/'
---

# How to avoid common mistakes in R

Programming comes with a learning curve and you will no doubt encounter many error messages while you familiarise yourself with the workings of R. But fear not! Today we will tackle some of the most common coding errors and help you avoid them. You might have seen some of these error messages already, but after completing this tutorial, we hope they won't appear too often on your RStudio screens.

# Learn how to pick up on errors in R

In addition to keeping a record of your code, scripts are also useful for detecting simple coding errors before you've even run the code. If `RStudio` picks up on a character missing, a command that doesn't make sense due to spelling errors or similar, a little red _x_ appears next to that line of code. Scanning your code for _x_'s before running it is always a good idea and it's very convenient since you know exactly on which line you made a mistake. The other way `R` reports errors is through messages in the console, which appear after you run code that is not quite right. Although the error messages look scary (the red font and words like "fatal" sure give them a bad reputation), they are actually the second best option to no errors at all: `R` has identified there is a problem and from the message, you can figure out what it is and solve it!

# Get familiar with common errors and solutions

Before asking others for help, it’s generally a good idea for you to try to help yourself. R includes extensive facilities for accessing documentation and searching for help. There are also specialized search engines for accessing information about R on the internet, and general internet search engines can also prove useful.

## R Help: `help()` and `?`

The `help()` function and `?` help operator in R provide access to the documentation pages for R functions, data sets, and other objects, both for packages in the standard R distribution and for contributed packages. To access documentation for the standard `lm` (linear model) function, for example, enter the command `help(lm)` or `help("lm")`, or `?lm` or `?"lm"` (i.e., the quotes are optional).

To access help for a function in a package that’s not currently loaded, specify in addition the name of the package: For example, to obtain documentation for the `rlm()` (robust linear model) function in the `MASS` package, `help(rlm, package="MASS")`.

Standard names in R consist of upper- and lower-case letters, numerals (`0-9`), underscores (`_`), and periods (`.`), and must begin with a letter or a period. To obtain help for an object with a non-standard name (such as the help operator `?`), the name must be quoted: for example, `help('?')` or `?"?"`.

You may also use the `help()` function to access information about a package in your library — for example, `help(package="MASS")` — which displays an index of available help pages for the package along with some other information.

Help pages for functions usually include a section with executable examples illustrating how the functions work. You can execute these examples in the current R session via the `example()` command: e.g., `example(lm)`.

## Vignettes and Code Demonstrations: `browseVignettes()`, `vignette()` and `demo()`

Many packages include vignettes, which are discursive documents meant to illustrate and explain facilities in the package. You can discover vignettes by accessing the help page for a package, or via the `browseVignettes()` function: the command `browseVignettes()` opens a list of vignettes from all of your installed packages in your browser, while `browseVignettes(package=package-name)` (e.g., `browseVignettes(package="survival"))` shows the vignettes, if any, for a particular package. `vignette()` is employed similarly, but displays a list of vignettes in text form.

You can also use the `vignette("vignette-name")` command to view a vignette (possibly specifying the name of the package in which the vignette resides, if the vignette name is not unique): for example, `vignette("timedep")` or `vignette("timedep", package="survival")` (which are, in this case, equivalent).

Vignettes may also be accessed from the CRAN page for the package (e.g. [survival](https://cran.r-project.org/web/packages/survival/index.html)), if you wish to review the vignette for a package prior to installing and/or using it.

Packages may also include extended code demonstrations (“demos”). The command `demo()` lists all demos for all packages in your library, while `demo(package="package-name")` (e.g., `demo(package="stats")`) lists demos in a particular package. To run a demo, call the `demo()` function with the quoted name of the demo (e.g., `demo("nlm")`), specifying the name of the package if the name of the demo isn’t unique (e.g., `demo("nlm", package="stats")`, where, in this case, the package name need not be given explicitly).

## R Help on the Internet

__An online search for the error message (along with "R" and the function or package name) is always a good start__. Chances are someone has already encountered that error and has asked about it online. If the error message is very long, try paraphrasing based on what you think the problem might be (and delete references to your specific objects and file names). There are several really useful online forums and websites where people ask for and receive help, such as [Stackoverflow](http://stackoverflow.com) and [Rbloggers](https://www.r-bloggers.com/).

__For "how to ..." type queries, a search will often result in tutorials, and even Youtube videos as well__. For instance, " ggplot how to change axis titles" or "dplyr filtering on two conditions" will quickly get you what you need.

### A warning on warnings!

Errors are not the only scary red text that will appear in the console. Often, you will run code and get a message saying something like 'There were 13 warnings, use `warnings()`to see them'. It could also be a specific warning telling you that R is ignoring `NA`s (missing) data in a plot, or that a function generated unexpected results such as `NaN` (not a number). 

Warnings are not necessarily the end of the world, but you should see them as major red flags, and make sure you know what is going on before you pursue your analysis. Like error messages, a simple online search of the warning text will often put you on the right track. 

## Asking for Help

If you find that you can’t answer a question or solve a problem yourself, you can ask others for help, either locally (if you know someone who is knowledgeable about R) or on the internet. In order to ask a question effectively, it helps to phrase the question clearly, and, if you’re trying to solve a problem, to include a small, self-contained, reproducible example of the problem that others can execute. For information on how to ask questions, see, e.g., the R mailing list [posting guide](https://www.r-project.org/posting-guide.html), and the document about [how to create reproducible examples for R](https://stackoverflow.com/questions/5963269/how-to-make-a-great-r-reproducible-example) on Stack Overflow.

### Stack Overflow
[Stack Overflow](https://stackoverflow.com/) is a well organized and formatted site for help and discussions about programming. It has excellent searchability. Topics are tagged, and “r” is a very popular tag on the site with almost 150,000 questions (as of summer 2016). To go directly to R-related topics, visit http://stackoverflow.com/questions/tagged/r. For an example both of the value of the site’s organization and information that is very useful to R users, see “How to make a great R reproducible example?”, which is also mentioned above.

### R Email Lists
The R Project maintains a number of subscription-based [email lists](https://www.r-project.org/mail.html) for posing and answering questions about R, including the general R-help email list, the R-devel list for R code development, and R-package-devel list for developers of CRAN packages; lists for announcements about R and R packages; and a variety of more specialized lists. Before posing a question on one of these lists, please read the R mailing list instructions and the [posting guide](https://www.r-project.org/posting-guide.html).

## Cheat sheet! 

__Here are some of the most common error messages you'll meet when you get started, and what they actually mean:__

- __Error in `function-name(...)`: could not find function 'function-name'__ : This probably means that you are trying to use a function from a package you have not loaded. Type `??function-name` (or look it up online) to find out which package it comes from, and make sure the package is loaded using `library(package-name)`. Which leads us to...
- __Error in `library(package-name)`: there is no package called 'package-name'.__ : Did you install the package? Packages need to be installed once, using `install.packages('packag-name')`, after which they can be loaded with the `library()` command. 
- __Error in `function-name()`: object 'object-name' not found__: R tells you that it cannot find an object that should be in your environment. First, make sure that you have an object with this name in your Environment panel. It could be just a typo, for instance you defined the object as `dataset` yet you try to plot it calling `dataSet`. (And yes, R is also case-sensitive!) Or it could be that you haven't actually run the code which creates this object yet! 
- __Error: unexpected symbol in 'line-of-code'__ : Most likely you forgot (or had an extra!) comma, bracket or other punctuation sign somewhere. 
- __Cannot open file 'your-file-path': No such file or directory__: R cannot find the file you are trying to load, often because you forgot to specify your working directory, or because there is a mistake in your file path. (Hint: if you copied it from the Windows Explorer, you need to swap the backward slashes for forward slashes.) If you get __object 'your-file-path' not found__, then you probably forgot the quotation marks around the file path `read.csv(file = 'my-file-path/file.csv')`. 

# Practice! 

Practice truly is the best way to learn how to avoid errors in `R` - to get you started, we have written a purposefully wrong script - you can download the file from this [Github repository](https://github.com/ourcodingclub/CC-1-RBasics). There you will find the data `edidiv.csv`, as well as the wrong (`CC_2_RBasics_Wrong_Script.R`) and right script. Can you fix all the mistakes?

# Reference
+ This tutorial is original from [here](https://ourcodingclub.github.io/tutorials/troubleshooting/) and [here](https://www.r-project.org/help.html).
+ [More resources](https://www.r-bloggers.com/getting-help-in-r/).
+ [More resources](https://www.r-bloggers.com/getting-help-in-r/)