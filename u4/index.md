---
# Page settings
layout: default
head_title: Intro R
keywords:
comments: false

# Hero section
title: Intro R
description: >

# Micro navigation
micro_nav: false

# Page navigation
page_nav:
    prev:
        content: Project Management - Git
        url: '/u3/'
    next:
        content: Homework 2.1 - Help
        url: '/u4/help/'
---

<!-- rmarkdown::render("index.Rmd", md_document()) -->

# Introduction to R

Download the `*.Rmd` [here](https://github.com/teachresources/RPP/blob/gh-pages/u4/index.Rmd) or from R

<!-- -->

    download.file(url = "https://raw.githubusercontent.com/teachresources/RPP/gh-pages/u4/index.Rmd", destfile = "introR.Rmd")

RStudio
-------

Some userful shortcuts: `Ctrl+Enter` (send code), `Ctrl+Shift+C`
(comment/uncomment), `Ctrl+1/2` (switch window focus)

Explore
[here](https://rstudio.com/wp-content/uploads/2016/01/rstudio-IDE-cheatsheet.pdf)
all the RStudio shortcuts

R Package Repositories
----------------------

-   CRAN (&gt;11,000 packages) general data analysis -
    [URL](http://cran.at.r-project.org/)
-   Bioconductor (&gt;1,800 packages) bioscience data analysis -
    [URL](http://www.bioconductor.org/)
-   Omegahat (&gt;90 packages) programming interfaces -
    [URL](https://github.com/omegahat?tab=repositories)

Installation of R Packages
--------------------------

1.  Install R for your operating system from
    [CRAN](http://cran.at.r-project.org/).

2.  Install RStudio from [RStudio](http://www.rstudio.com/ide/download).

3.  Install CRAN Packages from R console like this:

<!-- -->

    install.packages(c("pkg1", "pkg2")) 
    install.packages("pkg.zip", repos=NULL)

1.  Install Bioconductor packages as follows:

<!-- -->

    install.packages("BiocManager") 
    BiocManager::install("systemPipeR")

Getting Around
==============

Startup and Closing Behavior
----------------------------

-   **Starting R**: The R GUI versions, including RStudio, under Windows
    and Mac OS X can be opened by double-clicking their icons.
    Alternatively, one can start it by typing `R` in a terminal (default
    under Linux).

-   **Startup/Closing Behavior**: The R environment is controlled by
    hidden files in the startup directory: `.RData`, `.Rhistory` and
    `.Rprofile` (optional).

-   **Closing R**:

<!-- -->

    q()  

    Save workspace image? [y/n/c]: n

-   **Note**: When responding with `y`, then the entire R workspace will
    be written to the `.RData` file which can become very large. Often
    it is sufficient to just save an analysis protocol in an R source
    file. This way one can quickly regenerate all data sets and objects.

R Session
---------

After R is started, there is a console awaiting for input. At the prompt
(&gt;), you can enter numbers and perform calculations.

    1+4

List objects in current R session

    ls()

Collect information about the current R session

    sessionInfo()
    .libPaths()

Variable Assignment
-------------------

We assign values to variables with the assignment operator `<-`. Just
typing the variable by itself at the prompt will print out the value. We
should note that another form of assignment operator `=` is also in use.

    x <- 1
    y = 3
    x+y

Functions
---------

R functions are invoked by its name, then followed by the parenthesis,
and zero or more arguments. The following apply the function c to
combine three numeric values into a vector.

    sum(x+y)
    log(x+y)
    print(x)

Comments
--------

All text after the pound sign “\#” within the same line is considered a
comment.

    sum(x+y) # This is a comment

Getting Help
------------

R provides extensive documentation. For example, entering `?sum` or
`help(sum)` at the prompt gives documentation of the function c in R.
Please give it a try.

    help(sum)
    ?log

HomeWork2: Seeking help

Navigating directories
----------------------

Return content of current working directory

    dir()

Return path of current working directory

    getwd()

Change current working directory

    setwd("/home/user")

Removing Objects

    rm(y)
    ls()
    rm(list = ls()) # Removes all objects without warning

Basic Operators and Calculations
--------------------------------

-   Comparison operators
    -   equal: `==`
    -   not equal: `!=`
    -   greater/less than: `>` `<`
    -   greater/less than or equal: `>=` `<=`

<!-- -->

    1==1

    ## [1] TRUE

    x <- 2
    y <- 3
    x == y

    ## [1] FALSE

    x != y

    ## [1] TRUE

-   Logical operators
    -   AND: `&`

<!-- -->

    x <- 1:10
    y <- 10:1 
    x > 5 

    ##  [1] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE

    x > y & x > 5 

    ##  [1] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE

-   NOT: `!`

<!-- -->

    !x > y

    ##  [1]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE

Load a library/package
----------------------

    library("my_library") 

List functions defined by a library

    library(help="my_library")

Load library manual (PDF or HTML file)

    vignette("my_library") 

Execute an R script from within R

    source("my_script.R")

<!-- Note: Vignette X Manual  -->
Data Types
==========

*What are Data types in R?*

For correct processing, a programming language must know what can and
cannot be done to a particular value. For example, addition cannot be
performed on the words *hello* and *world*.

Similarly, you cannot change the numbers `1` and `-34.5` from lower to
uppercase. Due to this, R has a feature called the data types. Different
kinds of values are assigned different data types that help
differentiate them. These types have certain characteristics and rules
associated with them that define their properties.

R provides the `class()` and `typeof()` functions to find out what is
the class and type of any variable. R has five data types which are:

-   Numeric
-   Characters
-   Integers
-   Complex
-   Logical

Let’s go through these data types one-by-one.

Numeric data
------------

The numeric data type is for numeric values. It is the default data type
for numbers in R. Example: `1, 2, 3, ...`

    x <- c(1, 2, 3)
    x

    is.numeric(x)
    as.character(x)
    class(x) # Prints the object type.

Character data
--------------

The character data type stores character values or strings. Strings in R
can contain the alphabet, numbers, and symbols. The easiest way to
denote that a value is of character type in R is to wrap the value
inside single or double inverted commas. Example: `"a", "b", "c", ...`

    x <- c("1", "2", "3")
    x
    is.character(x)
    as.numeric(x)

Integers data
-------------

The Integer data type is used for integer values. To store a value as an
integer, we need to specify it as such. The integer data type is
commonly used for discrete only values like unique ids. We can store as
well as convert a value into an integer type using the as.integer()
function.

    int <- as.integer(16)
    class(int)
    int2 <- as.integer(x)
    int2
    class(int2)

Complex data
------------

The complex data type is to store numbers with an imaginary component.
Examples of complex values would be *1+2i*, *3i*, *4-5i*, *-12+6i*, etc.
Example: mix of both

    y <- c(1, "b", 3)

Logical data
------------

Example: `TRUE` of `FALSE`

    x <- 1:10 < 5
    x  
    !x
    which(x) # Returns index for the 'TRUE' values in logical vector
    y <- TRUE
    class(y)

Data Objects (Structures)
=========================

In any programming language, if you are doing programming, you need to
use different variables to store different data. Moreover, variables are
reserved in a memory location to store values. Also, this implies that,
once you create a variable you reserve some area in memory. Further,
data structures are the only way of arranging data so it can be used
efficiently on a computer.

If we see in contrast to different programming languages like C and
Java, R doesn’t have variables declared as some data type. Further, the
variables are appointed with R-objects and the knowledge form of the
R-object becomes the datatype of the variable. There are many types of
R-objects. The popularly used ones are:

-   Vector
-   Factor
-   Matrix
-   Lists
-   Data Frames

Now, we will discuss each of these R-objects in brief.

Vectors (1D)
------------

A vector is a sequence of elements that share the same data type. These
elements are known as components of a vector.

Definition: `numeric` or `character`

    myVec <- 1:10; names(myVec) <- letters[1:10]  
    myVec[1:5]
    myVec[c(2,4,6,8)]
    myVec[c("b", "d", "f")]

    c(TRUE, FALSE, TRUE, FALSE, FALSE) # here is a vector of logical values
    length(c("aa", "bb", "cc", "dd", "ee")) # number of elements in a vector is given by the length function

Factors (1D)
------------

R factors are variables. It takes a limited number of different values.
Hence, those variables are often known as categorical variables. In
order to categorise the data and store it on multiple levels, we use the
data object called R factor. They can store both strings and integers.
They are also useful in the columns which have a limited number of
unique values.

The factor is stored as integers. They have labels associated with these
unique integers. We need to be careful while treating factors like
strings. Factor contains a predefined set value called levels. By
default, R always sorts levels in alphabetical order.

Definition: vectors with grouping information

    factor(c("dog", "cat", "mouse", "dog", "dog", "cat"))

Matrices (2D)
-------------

A matrix in R is a two-dimensional rectangular data set and thus it can
be created using vector input to the matrix function. R is a tool for
expressing statistical and mathematical operations from which beginners
will learn how to create and access the R matrix. And, by the end of
this article, you will be able to perform addition, subtraction,
multiplication, and division operations on R matrices.

Definition: two dimensional structures with data of same type

    myMA <- matrix(1:30, 3, 10, byrow = TRUE) 
    class(myMA)
    myMA[1:2,]
    myMA[1, , drop=FALSE]

    mat <- matrix (
    c(2 , 4, 3, 1, 5, 7),       # the data elements
    nrow =2,                   # no. of rows
    ncol =3,                   # no. of columns
    byrow = TRUE)
    mat

Data Frames (2D)
----------------

Definition: two dimensional objects with data of variable types

    myDF <- data.frame(Col1=1:10, Col2=10:1) 
    myDF[1:2, ]
    cbind(myDF, Col3=LETTERS[1:10])

Lists
-----

R list is the object which contains elements of different types – like
strings, numbers, vectors and another list inside it. R list can also
contain a matrix or a function as its elements. The list is created
using the `list()` function in R. In other words, a list is a generic
vector containing other objects.

Definition: containers for any object type

    myL <- list(name="Fred", wife="Mary", no.children=3, child.ages=c(4,7,9)) 
    myL
    myL[[4]][1:2] 

Functions
---------

Definition: piece of code

    myfct <- function(arg1, arg2, ...) { 
        function_body 
    }

Subsetting of data objects
==========================

**(1.) Subsetting by positive or negative index/position numbers**

    myVec <- 1:26; names(myVec) <- LETTERS 
    myVec[1:4]
    names(myVec)

**(2.) Subsetting by same length logical vectors**

    myLog <- myVec > 10
    myVec[myLog] 

**(3.) Subsetting by field names**

    myVec[c("B", "K", "M")]

**(4.) Subset with `$` sign**: references a single column or list
component by its name

    iris$Species[1:8]

Important Utilities
===================

Combining Objects
-----------------

Vectors can be combined via the function c. For examples, the following
two vectors n and s are combined into a new vector containing elements
from both vectors.

The `c` function combines vectors and lists

    c(1, 2, 3)
    x <- 1:3; y <- 101:103
    c(x, y)
    iris$Species[1:8]
    w <- c("a", "b")
    c(x, w)

*Value Coercion: *

In the code snippet above, notice how the numeric values are being
coerced into character strings when the two vectors are combined. This
is necessary so as to maintain the same primitive data type for members
in the same vector.

The `cbind` and `rbind` functions can be used to append columns and
rows, respecively.

    ma <- cbind(x, y)
    ma
    rbind(ma, ma)

Accessing Dimensions of Objects
-------------------------------

Length and dimension information of objects

    length(iris$Species)
    dim(iris)

Accessing Name Slots of Objects
-------------------------------

Accessing row and column names of 2D objects

    rownames(iris)[1:8]
    colnames(iris)

Return name field of vectors and lists

    names(myVec)
    names(myL)

Sorting Objects
---------------

The function `sort` returns a vector in ascending or descending order

    sort(10:1)

The function `order` returns a sorting index for sorting an object

    sortindex <- order(iris[,1], decreasing = FALSE)
    sortindex[1:12]
    iris[sortindex,][1:2,]
    sortindex <- order(-iris[,1]) # Same as decreasing=TRUE

Sorting multiple columns

    iris[order(iris$Sepal.Length, iris$Sepal.Width),][1:2,]

Operators and Calculations
==========================

Comparison Operators
--------------------

Comparison operators: `==`, `!=`, `<`, `>`, `<=`, `>=`

    1==1

Logical operators: AND: `&`, OR: `|`, NOT: `!`

    x <- 1:10; y <- 10:1
    x > y & x > 5

Basic Calculations
------------------

Arithmetic operations of vectors are performed element-by-element.

    x + y
    sum(x)
    mean(x)
    apply(iris[1:6,1:3], 1, mean) 
    x
    2*x

To look up math functions, see Function Index
[here](http://cran.at.r-project.org/doc/manuals/R-intro.html#Function-and-variable-index)

Reading and Writing External Data
=================================

Import of tabular data
----------------------

Import of a tab-delimited tabular file

    myDF <- read.delim("data/example.csv", sep="\t")
    myDF <- read.delim("data/example.csv", sep=",")

Import of Excel file. Note: working with tab- or comma-delimited files
is more flexible and preferred.

    library(gdata)
    myDF <- read.xls("data/example.xls")

Import of Google Sheets. The following example imports a sample Google
Sheet from
[here](https://docs.google.com/spreadsheets/d/1U-32UcwZP1k3saKeaH1mbvEAOfZRdNHNkWK2GI1rpPM/edit#gid=472150521).
Detailed instructions for interacting from R with Google Sheets with the
required `googlesheets` package are
[here](https://github.com/jennybc/googlesheets).

Export of tabular data
----------------------

    write.table(myDF, file="results/myfile.xls", sep="\t", quote=FALSE, col.names=NA)

Line-wise export
----------------

    writeLines(month.name, "results/myData.txt")

Line-wise import
----------------

    myDF <- readLines("results/myData.txt")

Export R object
---------------

    mylist <- list(C1=iris[,1], C2=iris[,2]) # Example to export
    saveRDS(mylist, "results/mylist.rds")

Import R object
---------------

    mylist <- readRDS("results/mylist.rds")
