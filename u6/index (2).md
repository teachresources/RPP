---
# Page settings
layout: default
head_title: Data Manipulation
keywords:
comments: false

# Hero section
title: Data Manipulation
description: >

# Micro navigation
micro_nav: false

# Page navigation
page_nav:
    prev:
        content: RMarkdown
        url: '/u5/'
    next:
        content: Anova
        url: '/u6/'
---

Find [here](https://teachresources.github.io/RPP/u6/dataManipulation.Rmd) the correspondent `*Rmd`.

Data Manipulation
=================

Best Practices in Preparing Data Files for Importing into R
-----------------------------------------------------------

-   Use the first row as column headers (or column names). Generally,
    columns represent variables.
-   Use the first column as row names. Generally rows represent
    observations.
-   Each row name should be unique, so remove duplicated names.
-   Avoid names with blank spaces. Good column names: `specie_1` or
    `specie1`. Bad column name: `specie 1`.
-   Avoid names with special symbols: ?, $, \*, +, \#, (, ), -, /, }, {,
    |, &gt;, &lt; etc. Only underscore can be used.
-   Avoid beginning variable names with a number. Use letter instead.
    Good column names: sport\_100m or x100m. Bad column name: 100m
-   Column names must be unique. Duplicated names are not allowed.
-   R is case sensitive. This means that Name is different from Name or
    NAME.
-   Avoid blank rows in your data.
-   Delete any comments in your file.
-   If you have a column containing date, use the four digit format.
    Good format: 01/01/2016. Bad format: 01/01/16

R base functions for importing data
-----------------------------------

-   `read.csv()`: for reading “comma separated value” files (“.csv”).
-   `read.csv2()`: variant used in countries that use a comma “,” as
    decimal point and a semicolon “;” as field separators.
-   `read.delim()`: for reading “tab-separated value” files (“.txt”). By
    default, point (“.”) is used as decimal points.
-   `read.delim2()`: for reading “tab-separated value” files (“.txt”).
    By default, comma (“,”) is used as decimal points.

### Arguments

-   `file`: the path to the file containing the data to be imported
    into R.
-   `sep`: the field separator character. “ is used for tab-delimited
    file.
-   `header`: logical value. If TRUE, read.table() assumes that your
    file has a header row, so row 1 is the name of each column. If
    that’s not the case, you can add the argument header = FALSE.
-   `dec`: the character used in the file for decimal points.

<!-- -->

    # Read tabular data into R
    read.table(file, header = FALSE, sep = "", dec = ".")
    # Read "comma separated value" files (".csv")
    read.csv(file, header = TRUE, sep = ",", dec = ".", ...)
    # Or use read.csv2: variant used in countries that 
    # use a comma as decimal point and a semicolon as field separator.
    read.csv2(file, header = TRUE, sep = ";", dec = ",", ...)
    # Read TAB delimited files
    read.delim(file, header = TRUE, sep = "\t", dec = ".", ...)
    read.delim2(file, header = TRUE, sep = "\t", dec = ",", ...)

### Reading data From Excel Files (xls|xlsx) into R

    # Use readxl package to read xls|xlsx
    library("readxl")
    my_data <- read_excel("my_file.xlsx")
    # Use xlsx package
    library("xlsx")
    my_data <- read.xlsx("my_file.xlsx") 

Writing Data From R to txt|csv Files: R Base Functions
------------------------------------------------------

The R code below exports the built-in R mtcars data set to a
tab-separated ( sep = “) file called mtcars.txt in the current working
directory:

    # Loading mtcars data
    data("mtcars")
    # Writing mtcars data
    write.table(mtcars, file = "mtcars.txt", sep = "\t",
                row.names = TRUE, col.names = NA)

    write.table(mtcars, file = "mtcars.txt", sep = "\t",
                row.names = FALSE)

Accessing the data
------------------

-   Tibbles have nice printing method that show only the first 10 rows
    and all the columns that fit on the screen. This is useful when you
    work with large data sets.

-   When printed, the data type of each column is specified (see below):
    -   : for double
    -   : for factor
    -   : for character
    -   : for logical

<!-- -->

    library(tidyverse)
    library("tidyverse")
    my_data <- as_tibble(iris)
    my_data

    ## # A tibble: 150 x 5
    ##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ##           <dbl>       <dbl>        <dbl>       <dbl> <fct>  
    ##  1          5.1         3.5          1.4         0.2 setosa 
    ##  2          4.9         3            1.4         0.2 setosa 
    ##  3          4.7         3.2          1.3         0.2 setosa 
    ##  4          4.6         3.1          1.5         0.2 setosa 
    ##  5          5           3.6          1.4         0.2 setosa 
    ##  6          5.4         3.9          1.7         0.4 setosa 
    ##  7          4.6         3.4          1.4         0.3 setosa 
    ##  8          5           3.4          1.5         0.2 setosa 
    ##  9          4.4         2.9          1.4         0.2 setosa 
    ## 10          4.9         3.1          1.5         0.1 setosa 
    ## # … with 140 more rows

    tibble(iris)

    ## # A tibble: 150 x 5
    ##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ##           <dbl>       <dbl>        <dbl>       <dbl> <fct>  
    ##  1          5.1         3.5          1.4         0.2 setosa 
    ##  2          4.9         3            1.4         0.2 setosa 
    ##  3          4.7         3.2          1.3         0.2 setosa 
    ##  4          4.6         3.1          1.5         0.2 setosa 
    ##  5          5           3.6          1.4         0.2 setosa 
    ##  6          5.4         3.9          1.7         0.4 setosa 
    ##  7          4.6         3.4          1.4         0.3 setosa 
    ##  8          5           3.4          1.5         0.2 setosa 
    ##  9          4.4         2.9          1.4         0.2 setosa 
    ## 10          4.9         3.1          1.5         0.1 setosa 
    ## # … with 140 more rows

-   Note that, the type of data in each column is specified. Common
    types include:

    -   int: integers
    -   dbl: double (real numbers),
    -   chr: character vectors, strings, texts
    -   fctr: factor,
    -   dttm: date-times (date + time)
    -   lgl: logical (TRUE or FALSE)
    -   date: dates

Tidyr: Crucial Step Reshaping Data with R for Easier Analyses
=============================================================

![](http://www.sthda.com/sthda/RDoc/images/tidyr.png)

Reshaping data using tidyr package
----------------------------------

The tidyr package, provides four functions to help you change the layout
of your data set:

-   `gather()`: gather (collapse) columns into rows
-   s`pread()`: spread rows into columns
-   `separate()`: separate one column into multiple
-   `unite()`: unite multiple columns into one

### Installing and loading tidyr

    # Installing
    # install.packages("tidyr")
    # Loading
    library("tidyr")

### Example data sets

    my_data <- USArrests[c(1, 10, 20, 30), ]
    my_data

    ##            Murder Assault UrbanPop Rape
    ## Alabama      13.2     236       58 21.2
    ## Georgia      17.4     211       60 25.8
    ## Maryland     11.3     300       67 27.8
    ## New Jersey    7.4     159       89 18.8

    my_data <- cbind(state = rownames(my_data), my_data)
    my_data

    ##                 state Murder Assault UrbanPop Rape
    ## Alabama       Alabama   13.2     236       58 21.2
    ## Georgia       Georgia   17.4     211       60 25.8
    ## Maryland     Maryland   11.3     300       67 27.8
    ## New Jersey New Jersey    7.4     159       89 18.8

### `gather()`: collapse columns into rows

![](http://www.sthda.com/sthda/RDoc/images/tidyr-gather.png)

The function gather() collapses multiple columns into key-value pairs.
It produces a “long” data format from a “wide” one. It’s an alternative
of melt() function \[in reshape2 package\].

-   `data`: A data frame
-   `key`, `value`: Names of key and value columns to create in output
-   `…`: Specification of columns to gather. Allowed values are:
    -   variable names
    -   if you want to select all variables between a and e, use a:e
    -   if you want to exclude a column name y use -y
    -   for more options, see: `dplyr::select()`

<!-- -->

    my_data2 <- gather(my_data,
                       key = "arrest_attribute",
                       value = "arrest_estimate",
                       -state)
    my_data2

    ##         state arrest_attribute arrest_estimate
    ## 1     Alabama           Murder            13.2
    ## 2     Georgia           Murder            17.4
    ## 3    Maryland           Murder            11.3
    ## 4  New Jersey           Murder             7.4
    ## 5     Alabama          Assault           236.0
    ## 6     Georgia          Assault           211.0
    ## 7    Maryland          Assault           300.0
    ## 8  New Jersey          Assault           159.0
    ## 9     Alabama         UrbanPop            58.0
    ## 10    Georgia         UrbanPop            60.0
    ## 11   Maryland         UrbanPop            67.0
    ## 12 New Jersey         UrbanPop            89.0
    ## 13    Alabama             Rape            21.2
    ## 14    Georgia             Rape            25.8
    ## 15   Maryland             Rape            27.8
    ## 16 New Jersey             Rape            18.8

    my_data2 <- gather(my_data,
                       key = "arrest_attribute",
                       value = "arrest_estimate",
                       Murder, Assault)
    my_data2

    ##        state UrbanPop Rape arrest_attribute arrest_estimate
    ## 1    Alabama       58 21.2           Murder            13.2
    ## 2    Georgia       60 25.8           Murder            17.4
    ## 3   Maryland       67 27.8           Murder            11.3
    ## 4 New Jersey       89 18.8           Murder             7.4
    ## 5    Alabama       58 21.2          Assault           236.0
    ## 6    Georgia       60 25.8          Assault           211.0
    ## 7   Maryland       67 27.8          Assault           300.0
    ## 8 New Jersey       89 18.8          Assault           159.0

### `spread()`: spread two columns into multiple columns

![](http://www.sthda.com/sthda/RDoc/images/tidyr-spread.png)

The function `spread()` does the reverse of `gather()`. It takes two
columns (key and value) and spreads into multiple columns. It produces a
“wide” data format from a “long” one. It’s an alternative of the
function cast() \[in reshape2 package\].

-   `data`: A data frame
-   `key`: The (unquoted) name of the column whose values will be used
    as column headings.
-   `value`: The (unquoted) names of the column whose values will
    populate the cells.

<!-- -->

    my_data3 <- spread(my_data2, 
                       key = "arrest_attribute",
                       value = "arrest_estimate"
                       )
    my_data3

    ##        state UrbanPop Rape Assault Murder
    ## 1    Alabama       58 21.2     236   13.2
    ## 2    Georgia       60 25.8     211   17.4
    ## 3   Maryland       67 27.8     300   11.3
    ## 4 New Jersey       89 18.8     159    7.4

### `unite()`: Unite multiple columns into one

![](http://www.sthda.com/sthda/RDoc/images/tidyr-unite.png)

The function `unite()` takes multiple columns and paste them together
into one.

-   `data`: A data frame
-   `col`: The new (unquoted) name of column to add.
-   `sep`: Separator to use between values

<!-- -->

    my_data4 <- unite(my_data,
                      col = "Murder_Assault",
                      Murder, Assault,
                      sep = "_")
    my_data4

    ##                 state Murder_Assault UrbanPop Rape
    ## Alabama       Alabama       13.2_236       58 21.2
    ## Georgia       Georgia       17.4_211       60 25.8
    ## Maryland     Maryland       11.3_300       67 27.8
    ## New Jersey New Jersey        7.4_159       89 18.8

### `separate()`: separate one column into multiple

![](http://www.sthda.com/sthda/RDoc/images/tidyr-separate.png)

The function `sperate()` is the reverse of unite(). It takes values
inside a single character column and separates them into multiple
columns.

-   data: A data frame
-   col: Unquoted column names
-   into: Character vector specifying the names of new variables to be
    created.
-   sep: Separator between columns:
    -   If character, is interpreted as a regular expression.
    -   If numeric, interpreted as positions to split at. Positive
        values start at 1 at the far-left of the string; negative value
        start at -1 at the far-right of the string.

<!-- -->

    separate(my_data4,
             col = "Murder_Assault",
             into = c("Murder", "Assault"),
             sep = "_")

    ##                 state Murder Assault UrbanPop Rape
    ## Alabama       Alabama   13.2     236       58 21.2
    ## Georgia       Georgia   17.4     211       60 25.8
    ## Maryland     Maryland   11.3     300       67 27.8
    ## New Jersey New Jersey    7.4     159       89 18.8

### Chaining multiple operations

It’s possible to combine multiple operations using `maggrittr`
forward-pipe operator : %&gt;%.

In the following R code:

-   first, my\_data is passed to gather() function
-   next, the output of gather() is passed to unite() function

<!-- -->

    my_data %>% gather(key = "arrest_attribute",
                       value = "arrest_estimate",
                       Murder:UrbanPop) %>%
                unite(col = "attribute_estimate",
                      arrest_attribute, arrest_estimate)

    ##         state Rape attribute_estimate
    ## 1     Alabama 21.2        Murder_13.2
    ## 2     Georgia 25.8        Murder_17.4
    ## 3    Maryland 27.8        Murder_11.3
    ## 4  New Jersey 18.8         Murder_7.4
    ## 5     Alabama 21.2        Assault_236
    ## 6     Georgia 25.8        Assault_211
    ## 7    Maryland 27.8        Assault_300
    ## 8  New Jersey 18.8        Assault_159
    ## 9     Alabama 21.2        UrbanPop_58
    ## 10    Georgia 25.8        UrbanPop_60
    ## 11   Maryland 27.8        UrbanPop_67
    ## 12 New Jersey 18.8        UrbanPop_89

### Summary

You should tidy your data for easier data analysis using the R package
tidyr, which provides the following functions.

-   Collapse multiple columns together into key-value pairs (long data
    format): gather(data, key, value, …)
-   Spread key-value pairs into multiple columns (wide data format):
    spread(data, key, value)
-   Unite multiple columns into one: unite(data, col, …)
-   Separate one columns into multiple: separate(data, col, into)

Managing Data Frames with the `dplyr` package
=============================================

    install.packages("dplyr")
    library(dplyr)

dplyr Grammar
-------------

There are 8 fundamental data manipulation verbs that you will use to do
most of your data manipulations. Some of the key “verbs” provided by the
dplyr package are:

-   `select` : return a subset of the columns of a data frame, using a
    flexible notation
-   `filter` : extract a subset of rows from a data frame based on
    logical conditions
-   `arrange` : reorder rows of a data frame
-   `rename` : rename variables in a data frame
-   `mutate` : add new variables/columns or transform existing variables
-   `summarise` / `summarize` : generate summary statistics of different
    variables in the data frame, possibly within strata
-   `distinct` : Remove duplicate rows.
-   `%>%`: the “pipe” operator is used to connect multiple verb actions
    together into a pipeline

Select Data Frame Columns in R
------------------------------

![](https://www.datanovia.com/en/wp-content/uploads/dn-tutorials/data-manipulation-in-r/images/select-or-subset-columns-in-r.png)

In this section, you will learn how to select or subset data frame
columns by names and position using the R function `select()` and
`pull()` \[in `dplyr` package\]. We’ll also show how to remove columns
from a data frame.

You will learn how to use the following functions:

-   `pull()`: Extract column values as a vector. The column of interest
    can be specified either by name or by index.
-   `select()`: Extract one or multiple columns as a data table. It can
    be also used to remove columns from the data frame.

<!-- -->

    my_data <- as_tibble(iris)
    my_data

    ## # A tibble: 150 x 5
    ##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    ##           <dbl>       <dbl>        <dbl>       <dbl> <fct>  
    ##  1          5.1         3.5          1.4         0.2 setosa 
    ##  2          4.9         3            1.4         0.2 setosa 
    ##  3          4.7         3.2          1.3         0.2 setosa 
    ##  4          4.6         3.1          1.5         0.2 setosa 
    ##  5          5           3.6          1.4         0.2 setosa 
    ##  6          5.4         3.9          1.7         0.4 setosa 
    ##  7          4.6         3.4          1.4         0.3 setosa 
    ##  8          5           3.4          1.5         0.2 setosa 
    ##  9          4.4         2.9          1.4         0.2 setosa 
    ## 10          4.9         3.1          1.5         0.1 setosa 
    ## # … with 140 more rows

### Extract column values as a vector

    pull(iris, Species)

    my_data %>% pull(Species)

### Extract columns as a data table

Select column by position

    select(iris, 1, 2)
    my_data %>% select(1:3)
    my_data %>% select(1, 3)

Select columns by names

    my_data %>% select(Sepal.Length, Petal.Length)
    my_data %>% select(Sepal.Length:Petal.Length)

### Select column based on a condtion

    my_data %>% select_if(is.numeric)
    iris %>% select_if(is.numeric)

### Remove columns

    my_data %>% select(-Sepal.Length, -Petal.Length)
    my_data %>% select(-(Sepal.Length:Petal.Length))
    # Drop column 1
    my_data %>% select(-1)

    # Drop columns 1 to 3
    my_data %>% select(-(1:3))

    # Drop columns 1 and 3 but not 2
    my_data %>% select(-1, -3)

Subset Data Frame Rows in R
---------------------------

![](https://www.datanovia.com/en/wp-content/uploads/dn-tutorials/data-manipulation-in-r/images/subset-data-frame-rows-in-r.png)

This section describes how to subset or extract data frame rows based on
certain criteria.

In this tutorial, you will learn the following R functions from the
`dplyr` package:

-   `slice()`: Extract rows by position
-   `filter()`: Extract rows that meet a certain logical criteria. For
    example `iris %>% filter(Sepal.Length > 6)`.

<!-- -->

    my_data <- as_tibble(iris)
    my_data

### Extract rows by position

Key R function: `slice()` \[`dplyr` package\]

    my_data %>% slice(1:6)

### Filter rows by logical criteria

Key R function: `filter()` \[`dplyr` package\]. Used to filter rows that
meet some logical criteria.

Extract rows based on logical criteria

    my_data %>% filter(Sepal.Length > 7)
    my_data %>% filter(Sepal.Length > 6.7, Sepal.Width <= 3)
    my_data %>% filter(Sepal.Length > 6.7, Species == "versicolor")
    my_data %>% filter(
      Sepal.Length > 6.7, 
      Species %in% c("versicolor", "virginica" )
      )

### Remove missing values

    # Create a data frame with missing data
    friends_data <- data_frame(
      name = c("A", "B", "C", "D"),
      age = c(27, 25, 29, 26),
      height = c(180, NA, NA, 169),
      married = c("yes", "yes", "no", "no")
    )
    # Print
    friends_data

    friends_data %>% filter(is.na(height))
    friends_data %>% filter(!is.na(height))

Reorder Data Frame Rows in R
----------------------------

![](https://www.datanovia.com/en/wp-content/uploads/dn-tutorials/data-manipulation-in-r/images/reorder-data-frame-rows-in-r.png)

This section describes how to reorder (i.e., sort) rows, in your data
table, by the value of one or more columns (i.e., variables).

You will learn how to easily: - Sort a data frame rows in ascending
order (from low to high) using the R function `arrange()` \[`dplyr`
package\]

    my_data <- as_tibble(iris)
    my_data

### Arrange rows

    my_data %>% arrange(Sepal.Length)
    my_data %>% arrange(desc(Sepal.Length))
    my_data %>% arrange(Sepal.Length, Sepal.Width)

Rename Data Frame Columns in R
------------------------------

![](https://www.datanovia.com/en/wp-content/uploads/dn-tutorials/data-manipulation-in-r/images/rename-columns-data-frame-r.png)

n this section, you will learn how to rename the columns of a data frame
in R. This can be done easily using the function `rename()` \[`dplyr`
package\]. It’s also possible to use R base functions, but they require
more typing.

    my_data <- as_tibble(iris)
    my_data

### Renaming columns with dplyr::rename()

    my_data %>% 
      rename(
        sepal_length = Sepal.Length,
        sepal_width = Sepal.Width
        )

### Renaming columns with R base functions

    # get column names
    colnames(my_data)
    names(my_data)[1] <- "sepal_length"
    names(my_data)[2] <- "sepal_width"

Compute and Add new Variables to a Data Frame in R
--------------------------------------------------

![](https://www.datanovia.com/en/wp-content/uploads/dn-tutorials/data-manipulation-in-r/images/compute-and-add-new-variables.png)

This section describes how to compute and add new variables to a data
frame in R. You will learn the following R functions from the dplyr R
package:

-   `mutate()`: compute and add new variables into a data table. It
    preserves existing variables.
-   `transmute()`: compute new columns but drop existing variables.

<!-- -->

    my_data <- as_tibble(iris)
    my_data

### `mutate`: Add new variables by preserving existing ones

    my_data %>% 
      mutate(sepal_by_petal_l = Sepal.Length/Petal.Length)

### `transmute`: Make new variables by dropping existing ones

    my_data %>%
      transmute(
        sepal_by_petal_l = Sepal.Length/Petal.Length,
        sepal_by_petal_w = Sepal.Width/Petal.Width
        )

Compute Summary Statistics in R
-------------------------------

![](https://www.datanovia.com/en/wp-content/uploads/dn-tutorials/data-manipulation-in-r/images/compute-summary-statistics-in-r.png)

This section introduces how to easily compute statistcal summaries in R
using the dplyr package.

You will learn, how to:

Compute summary statistics for ungrouped data, as well as, for data that
are grouped by one or multiple variables. R functions: `summarise()` and
`group_by()`.

    my_data <- as_tibble(iris)
    my_data

### Summary statistics of ungrouped data

    my_data %>%
      summarise(
              count = n(),
              mean_sep = mean(Sepal.Length, na.rm = TRUE),
              mean_pet = mean(Petal.Length, na.rm = TRUE)
              )

### Summary statistics of grouped data

    my_data %>%
      group_by(Species) %>%
      summarise(
              count = n(),
              mean_sep = mean(Sepal.Length),
              mean_pet = mean(Petal.Length)
                )

    ToothGrowth %>%
    group_by(supp, dose) %>%
      summarise(
        n = n(),
        mean = mean(len),
        sd = sd(len)
      )

Identify and Remove Duplicate Data in R
---------------------------------------

![](https://www.datanovia.com/en/wp-content/uploads/dn-tutorials/data-manipulation-in-r/images/remove-duplicate-data-r.png)

This section describes how to identify and remove duplicate data in R.

You will learn how to use the following R base and dplyr functions:

-   `duplicated()`: for identifying duplicated elements and
-   `unique()`: for extracting unique elements
-   `distinct()` \[`dplyr` package\] to remove duplicate rows in a data
    frame.

<!-- -->

    my_data <- as_tibble(iris)
    my_data

### Find and drop duplicate elements

    x <- c(1, 1, 4, 5, 4, 6)
    duplicated(x)
    x[duplicated(x)] ## Extract duplicate elements
    x[!duplicated(x)] ## remove duplicated elements
    # Remove duplicates based on Sepal.Width columns
    my_data[!duplicated(my_data$Sepal.Width), ]

### Extract unique elements

    x <- c(1, 1, 4, 5, 4, 6)
    unique(x)
    unique(my_data)

### Remove duplicate rows in a data frame

The function `distinct()` \[`dplyr` package\] can be used to keep only
unique/distinct rows from a data frame. If there are duplicate rows,
only the first row is preserved. It’s an efficient version of the R base
function `unique()`.

Remove duplicate rows based on all columns:

my\_data %&gt;% distinct()

    my_data %>% distinct() 

Reference:
==========

1.  [R for Data Science](https://r4ds.had.co.nz/)
2.  [Preparing Data
    Files](http://www.sthda.com/english/wiki/best-practices-in-preparing-data-files-for-importing-into-r)
3. [DATA MANIPULATION IN R](https://www.datanovia.com/en/courses/data-manipulation-in-r/)
4. [Exploratory Data Analysis with R](http://leanpub.com/exdata)
