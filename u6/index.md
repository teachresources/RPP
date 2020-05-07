---
# Page settings
layout: default
head_title: RMarkdown
keywords:
comments: false

# Hero section
title: RMarkdown
description: >

# Micro navigation
micro_nav: false

# Page navigation
page_nav:
    prev:
        content: Intro R
        url: '/u4/'
    next:
        content: Explore Data
        url: '/u6/'
---

# Introduction to R Markdown 

<iframe width="800" height="450" src="https://www.youtube.com/embed/DNS7i2m4sB0" frameborder="0" allowfullscreen></iframe>

R Markdown allows you to create documents that serve as a neat record of your analysis. In the world of reproducible research, we want other researchers to easily understand what we did in our analysis, otherwise nobody can be certain that you analysed your data properly. You might choose to create an RMarkdown document as an appendix to a paper or project assignment that you are doing, upload it to an online repository such as Github, or simply to keep as a personal record so you can quickly look back at your code and see what you did. RMarkdown presents your code alongside its output (graphs, tables, etc.) with conventional text to explain it, a bit like a notebook.

RMarkdown uses [Markdown syntax](https://daringfireball.net/projects/markdown/). Markdown is a very simple 'markup' language which provides methods for creating documents with headers, images, links etc. from plain text files, while keeping the original plain text file easy to read. You can convert Markdown documents to many other file types like `.html` or `.pdf` to display the headers, images etc..

##  Download R Markdown

To get RMarkdown working in RStudio, the first thing you need is the `rmarkdown` package, which you can get from [CRAN](https://cran.r-project.org/web/packages/rmarkdown/index.html) by running the following commands in R or RStudio:

``` r
install.packages("rmarkdown")
library(rmarkdown)
```

#  Create an RMarkdown file

To create a new RMarkdown file (`.Rmd`), select `File -> New File -> R Markdown...`_ in `RStudio`, then choose the file type you want to create. For now we will focus on a `.html` `Document`, which can be easily converted to other file types later.

The newly created `.Rmd` file comes with basic instructions, but we want to create our own RMarkdown script, so go ahead and delete everything in the example file. 

Now save the `.Rmd` file to the repository you downloaded earlier [from Github](https://github.com/ourcodingclub/CC-2-RMarkdown).

Now open the `RMarkdown_Tutorial.R` practice script from the repository you downloaded earlier in another tab in `RStudio` and use the instructions below to help you convert this script into a coherent RMarkdown document, bit by bit.

If you have any of your own `R` scripts that you would like to make into an R Markdown document, you can also use those! 

# The YAML Header

At the top of any RMarkdown script is a `YAML` header section enclosed by `` --- ``. By default this includes a title, author, date and the file type you want to output to. Many other options are available for different functions and formatting, see [here for `.html` options](http://rmarkdown.rstudio.com/html_document_format.html) and [here for `.pdf` options](http://rmarkdown.rstudio.com/pdf_document_format.html). Rules in the header section will alter the whole document. Have a flick through quickly to familiarise yourself with the sorts of things you can alter by adding an option to the `YAML` header. 

Insert something like this at the top of your new `.Rmd` script:

```
---
title: "Edinburgh Biodiversity"
author: John Doe
date: 22/Oct/2016
output: html_document
---
```

By default, the `title`, `author`, `date` and `output` format are printed at the top of your `.html` document. This is the minimum you should put in your header section. 

Now that we have our first piece of content, we can test the `.Rmd` file by compiling it to `.html`. To compile your `.Rmd` file into a `.html` document, you should press the `Knit` button in the taskbar:

![RStudio Knit HTML screenshot](images/Knit_HTML_Screenshot.jpg)

By default, RStudio opens a separate preview window to display the output of your .Rmd file. If you want the output to be displayed in the `Viewer` window in `RStudio` (the same window where you would see plotted figures / packages / file paths), select “View in Pane” from the drop down menu that appears when you click on the `Knit` button in the taskbar, or in the `Settings gear icon` drop down menu next to the `Knit` button. 

A preview appears, and a `.html` file is also saved to the same folder where you saved your `.Rmd` file.

# Code Chunks

Below the `YAML` header is the space where you will write your code, accompanying explanation and any outputs. Code that is included in your `.Rmd` document should be enclosed by three backwards apostrophes ```` ``` ```` (grave accents!). These are known as code chunks and look like this:

````
```{r}
norm <- rnorm(100, mean = 0, sd = 1)
```
````

Inside the curly brackets is a space where you can assign rules for that code chunk. The code chunk above says that the code is R code. We'll get onto some other curly brace rules later.

__Have a go at grabbing some code from the example R script and inserting it into a code chunk in your `.Rmd` document.__

You can run an individual chunk of code at any time by placing your cursor inside the code chunk and selecting `Run -> Run Current Chunk`:

![RStudio run current chunk screenshot](images/run_sel.png)

## More on Code Chunks

It's important to remember when you are creating an RMarkdown file that if you want to run code that refers to an object, for example:

````
```{r}
plot(dataframe)
```
````

you must include instructions showing what `dataframe` is, just like in a normal R script. For example: 

````
```{r}
A <- c("a", "a", "b", "b")
B <- c(5, 10, 15, 20)
dataframe <- data.frame(A, B)
plot(dataframe)
```
````

Or if you are loading a dataframe from a `.csv` file, you must include the code in the `.Rmd`: 

````
```{r}
dataframe <- read.csv("~/project/data/dataframe.csv")
```
````

Similarly, if you are using any packages in your analysis, you will have to load them in the `.Rmd` file using `library()` as in a normal `R` script. 

````
```{r}
library(dplyr)
```
````

## Hiding code chunks

If you don't want the code of a particular code chunk to appear in the final document, but still want to show the output (e.g. a plot), then you can include `echo = FALSE` in the code chunk instructions. 


````
```{r, echo = FALSE}
A <- c("a", "a", "b", "b")
B <- c(5, 10, 15, 20)
dataframe <- data.frame(A, B)
plot(dataframe)
```
````

Similarly, you might want to create an object, but not include both the code and the output in the final `.html` file. To do this you can use, `include = FALSE`. Be aware though, when making reproducible research it's often not a good idea to completely hide some part of your analysis:

````
```{r, include = FALSE}
richness <- 
  edidiv %>%
    group_by(taxonGroup) %>%
    summarise(Species_richness = n_distinct(taxonName))
```
````

In some cases, when you load packages into RStudio, various warning messages such as "Warning: package 'dplyr' was built under R version 3.4.4" might appear. If you do not want these warning messages to appear, you can use `warning = FALSE`.

````
```{r, warning = FALSE}
library(dplyr)
```
````

## More Code Chunk Instructions

<table>
  <tr>
    <th>Rule</th>
    <th>Example<br>(default)</th>
    <th>Function</th>
  </tr>
  <tr>
    <td>eval</td>
    <td>eval=TRUE</td>
    <td>Is the code run and the results included in the output?</td>
  </tr>
  <tr>
    <td>include</td>
    <td>include=TRUE</td>
    <td>Are the code and the results included in the output?</td>
  </tr>
  <tr>
    <td>echo</td>
    <td>echo=TRUE</td>
    <td>Is the code displayed alongside the results?</td>
  </tr>
  <tr>
    <td>warning</td>
    <td>warning=TRUE</td>
    <td>Are warning messages displayed?</td>
  </tr>
  <tr>
    <td>error</td>
    <td>error=FALSE</td>
    <td>Are error messages displayed?</td>
  </tr>
  <tr>
    <td>message</td>
    <td>message=TRUE</td>
    <td>Are messages displayed?</td>
  </tr>
  <tr>
    <td>tidy</td>
    <td>tidy=FALSE</td>
    <td>Is the code reformatted to make it look “tidy”?</td>
  </tr>
  <tr>
    <td>results</td>
    <td>results="markup"</td>
    <td><b> How are results treated? </b> <br> "hide" = no results <br>"asis" = results without formatting <br>"hold" = results only compiled at end of chunk (use if many commands act on one object)</td>
  </tr>
  <tr>
    <td>cache</td>
    <td>cache=FALSE</td>
    <td>Are the results cached for future renders?</td>
  </tr>
  <tr>
    <td>comment</td>
    <td>comment="##"</td>
    <td>What character are comments prefaced with?</td>
  </tr>
  <tr>
    <td>fig.width, fig.height</td>
    <td>fig.width=7</td>
    <td>What width/height (in inches) are the plots?</td>
  </tr>
  <tr>
    <td>fig.align</td>
    <td>fig.align="left"</td>
    <td>"left" "right" "center"</td>
  </tr>
</table>

## Inserting Figures
Inserting a graph into RMarkdown is easy, the more energy-demanding aspect might be adjusting the formatting.

By default, RMarkdown will place graphs by maximising their height, while keeping them within the margins of the page and maintaining aspect ratio. If you have a particularly tall figure, this can mean a really huge graph. In the following example we modify the dimensions of the figure we created above. To manually set the figure dimensions, you can insert an instruction into the curly braces:

````
```{r, fig.width = 4, fig.height = 3}
A <- c("a", "a", "b", "b")
B <- c(5, 10, 15, 20)
dataframe <- data.frame(A, B)
plot(dataframe)
```
````

# Inserting Tables

### Standard R Markdown

While R Markdown can print the contents of a data frame easily by enclosing the name of the data frame in a code chunk:

````
```{r}
dataframe
```
````

this can look a bit messy, especially with data frames with a lot of columns. Including a formal table requires more effort.

### kable() function from knitr package

The most aesthetically pleasing and simple table formatting function I have found is `kable()` in the `knitr` package. The first argument tells kable to make a table out of the object `dataframe` and that numbers should have two significant figures. Remember to load the `knitr` package in your `.Rmd` file as well.

````
```{r}
library(knitr)
kable(dataframe, digits = 2)
```
````

### pander function from pander package

If you want a bit more control over the content of your table you can use ``pander()`` in the `pander` package. Imagine I want the 3rd column to appear in italics:

````
```{r}
library(pander)
plant <- c("a", "b", "c")
temperature <- c(20, 20, 20)
growth <- c(0.65, 0.95, 0.15)
dataframe <- data.frame(plant, temperature, growth)
emphasize.italics.cols(3)   # Make the 3rd column italics
pander(dataframe)           # Create the table
```
````

Find more info on pander [here](https://cran.r-project.org/web/packages/pander/pander.pdf).

### Manually creating tables using markdown syntax 

You can also manually create small tables using markdown syntax.

For example: 

```
| Plant | Temp. | Growth |
|:------|:-----:|-------:|
| A     | 20    | 0.65   |
| B     | 20    | 0.95   |
| C     | 20    | 0.15   |
```

will create something that looks like this:

<table>
  <tr>
    <th>Plant</th>
    <th>Temp.</th>
    <th>Growth</th>
  </tr>
  <tr>
    <td>A</td>
    <td>20</td>
    <td>0.65</td>
  </tr>
  <tr>
    <td>B</td>
    <td>20</td>
    <td>0.95</td>
  </tr>
  <tr>
    <td>C</td>
    <td>20</td>
    <td>0.15</td>
  </tr>
</table>

The ``:-----:`` tells markdown that the line above should be treated as a header and the lines below should be treated as the body of the table. Text alignment of the columns is set by the position of ``:``:

<table>
  <tr>
  <th>Syntax</th>
  <th>Alignment</th>
  </tr>
  <tr>
    <td>`:----:`</td>
    <td>Centre</td>
  </tr>
  <tr>
    <td>`:-----`</td>
    <td>Left</td>
  </tr>
  <tr>
    <td>`-----:`</td>
    <td>Right</td>
  </tr>
  <tr>
    <td>`------`</td>
    <td>Auto</td>
  </tr>
</table>

### Creating tables from model outputs 

Using `tidy()` from the package `broom`, we are able to create tables of our model outputs, and insert these tables into our  markdown file. The example below shows a simple example linear model, where the summary output table can be saved as a new R object and then added into the markdown file. 


````
```{r}
library(broom)
A <- c(20, 15, 10)
B <- c(1, 2, 3)

lm_test <- lm(A ~ B)            # Creating linear model 
summary(lm_test)                # Obtaining linear model summary statistics

table_obj <- tidy(lm_test)      # Using tidy() to create a new R object called table 
pander(table_obj, digits = 3)   # Using pander() to view the created table, with 3 sig figs  
```
````

## Formatting Text

Markdown syntax can be used to change how text appears in your output file. Here are a few common formatting commands:

`*Italic*` 

*Italic*

<hr>

`**Bold**`

**Bold**

<hr>

This is  \`code` in text 

This is `code` in text

<hr>

`# Header 1`

# Header 1

<hr>

`## Header 2`

## Header 2

Note that when a `#` symbol is placed inside a code chunk it acts as a normal R comment, but when placed in text it controls the header size.

<hr>

`* Unordered list item`

<li> Unordered list item </li>

<hr>

`1. Ordered list item`

1. Ordered list item

<hr>

`[Link](https://www.google.com)`

[Link](https://www.google.com)

<hr>

`$A = \pi \times r^{2}$`

The `$` symbols tells R markdown to use [LaTeX equation syntax](http://reu.dimacs.rutgers.edu/Symbols.pdf).


# Creating `.pdf` files in Rmarkdown

Creating `.pdf` documents for printing in A4 requires a bit more fiddling around. RStudio uses another document compiling system called [LaTeX](https://www.latex-project.org/) to make `.pdf` documents.

If you are using Windows, go to the [MikTeX website](https://miktex.org/download) and download the appropriate "Complete MikTeX Installer" for your system, either 32-bit or 64-bit.

If you are using a Mac, go to the [MacTeX website](https://tug.org/mactex/mactex-download.html) and download the "MacTeX.pkg".

Running these installers will install a version of LaTeX onto your system, which R will then be able to call on to compile the `.pdf`.

Becoming familiar with [LaTeX](https://tobi.oetiker.ch/lshort/lshort.pdf) will give you a lot more options to make your R Markdown `.pdf` look pretty, as LaTeX commands are mostly compatible with R Markdown, though some googling is often required.

To compile a `.pdf` instead of a `.html` document, change `output:` from `html_document` to `pdf_document`. 

## Common problems when compiling a `.pdf`

- Text is running off the page

Add a `global_options` argument at the start of your `.Rmd` file:

````
```{r global_options, include = FALSE}
knitr::opts_chunk$set(message=FALSE, 
tidy.opts=list(width.cutoff=60)) 
```
````

This code chunk won't be displayed in the final document due to the `include = FALSE` call and should be placed immediately after the YAML header to affect everything below that. 

`tidy.opts = list(width.cutoff = 60)` defines the margin cutoff point and wraps text to the next line. Play with the value to get it right.


<hr> 

- I lose my syntax highlighting

Use the `xelatex` engine to compile your `.pdf`:

````
- - -
author: John Doe
output: pdf_document 
latex_engine: xelatex
- - -
````

By default, R markdown uses the base LaTeX engine to compile pdfs, but this may limit certain options when it comes to formatting. There are lots of other engines to play around with as well.

<hr>

- My page margins are too big/small

Add a `geometry` argument to the YAML header

````
- - - 
title: "R Markdown Tutorial Demo"
author: "John Godlee"
date: "30/11/2016"
output: pdf_document
latex_engine: xelatex
geometry: left = 0.5cm, right = 1cm, top = 1cm, bottom = 1cm
- - - 
````

`geometry` is a LaTeX command.

<hr>

- My plot/table/code is split over two pages

Add a page break before the dodgy element:

````
\pagebreak
```{r}
Codey codey code code
```
````

<hr>

- I want to change the font

Add a font argument to your header section

```
--- 
title: "R Markdown Tutorial Demo"
author: "John Godlee"
date: "30/11/2016"
output: pdf_document
latex_engine: xelatex
mainfont: Arial
--- 
```

`mainfont` is a LaTeX command.


## Reference:

1.  [R for Data Science](https://r4ds.had.co.nz/)
2.  [R Markdown: The Definitive
    Guide](https://bookdown.org/yihui/rmarkdown/)
    <a href="https://ourcodingclub.github.io/tutorials/rmarkdown/" class="uri">https://ourcodingclub.github.io/tutorials/rmarkdown/</a>
    <a href="http://www.jacolienvanrij.com/Tutorials/tutorialMarkdown.html" class="uri">http://www.jacolienvanrij.com/Tutorials/tutorialMarkdown.html</a>
