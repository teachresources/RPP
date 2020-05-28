---
# Page settings
layout: default
head_title: Graphics and Visualization
keywords:
comments: false

# Hero section
title: Graphics and Visualization
description: >

# Micro navigation
micro_nav: false

# Page navigation
page_nav:
    prev:
        content: Statistics in R
        url: '/u7/'
    next:
        content: Multivariate Statistical Analysis 
        url: '/u9/'
---

Find [here](https://teachresources.github.io/RPP/u8/ggplot2.Rmd) the
correspondent `*Rmd`. Find
[here](https://rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf)
the `ggplot2 Cheatsheet`.

*`ggplot2`*
===========

Introduction
------------

`ggplot2` is a powerful and a flexible R package, implemented by Hadley
Wickham, for producing elegant graphics.

The concept behind ggplot2 divides plot into three different fundamental
parts: Plot = `data` + `Aesthetics` + `Geometry.`

The principal components of every plot can be defined as follow:

-   `data` is a data frame
-   `Aesthetics` is used to indicate x and y variables. It can also be
    used to control the color, the size or the shape of points, the
    height of bars, etc…..
-   `Geometry` defines the type of graphics (histogram, box plot, line
    plot, density plot, dot plot, ….)

There are two major functions in `ggplot2` package: `qplot()` and
`ggplot()` functions:

-   `qplot()` stands for quick plot, which can be used to produce easily
    simple plots.
-   `ggplot()` function is more flexible and robust than qplot for
    building a plot piece by piece.

Amazing resources
-----------------

-   [ggplot2 gallery](https://www.r-graph-gallery.com/all-graphs.html)
-   [ggplot2 manual](https://ggplot2.tidyverse.org/reference/)
-   [ggplot2 gallery -
    official](https://exts.ggplot2.tidyverse.org/gallery/)
-   [ggplot2 -
    Essentials](http://www.sthda.com/english/wiki/ggplot2-essentials)

Grammar of Graphics
-------------------

Just as the grammar of language helps us construct meaningful sentences
out of words, the *Grammar of Graphics* helps us to construct graphical
figures out of different visual elements. This grammar gives us a way to
talk about parts of a plot: all the circles, lines, arrows, and words
that are combined into a diagram for visualizing data. Originally
developed by Leland Wilkinson, the Grammar of Graphics was adapted by
Hadley Wickham to describe the components of a plot, including

-   **Data**: Always start with the data, identify the dimensions you
    want to visualize.
-   **Aesthetics**: Confirm the axes based on the data dimensions,
    positions of various data points in the plot. Also check if any form
    of encoding is needed including size, shape, color and so on which
    are useful for plotting multiple data dimensions.
-   **Scale**: Do we need to scale the potential values, use a specific
    scale to represent multiple values or a range? Geometric objects:
    These are popularly known as ‘geoms’. This would cover the way we
    would depict the data points on the visualization. Should it be
    points, bars, lines and so on?
-   **Statistics**: Do we need to show some statistical measures in the
    visualization like measures of central tendency, spread, confidence
    intervals?
-   **Facets**: Do we need to create subplots based on specific data
    dimensions?
-   **Coordinate system**: What kind of a coordinate system should the
    visualization be based on — should it be cartesian or polar?

![Grammar of Graphics](./ggplot.png) \*
[Immage](https://www.google.com/imgres?imgurl=https%3A%2F%2Fblog.gtwang.org%2Fwp-content%2Fuploads%2F2016%2F07%2Fggplot-grammar-of-graphics-stack-1.png&imgrefurl=http%3A%2F%2Fbloggotype.blogspot.com%2F2016%2F08%2Fholiday-notes2-grammar-of-graphics.html&tbnid=ojkzfa9VdM9L3M&vet=12ahUKEwjz-ZqTltXpAhVyI30KHYEfCvMQMygBegUIARDmAQ..i&docid=TvXMfSWvpc8D6M&w=1921&h=1431&q=ggplot2%20grammar&ved=2ahUKEwjz-ZqTltXpAhVyI30KHYEfCvMQMygBegUIARDmAQ)
reference. \#\# Install and Load Library

    ## install & load ggplot library
    #install.package("ggplot2")
    library("ggplot2")
    library(tidyverse)

Data
----

    head(mtcars)

    ##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
    ## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
    ## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
    ## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
    ## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
    ## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
    ## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

The Basics (Data/Aesthetics/Geometries)
---------------------------------------

In order to create a plot, you:

-   Call the `ggplot()` function which creates a blank canvas
-   Specify aesthetic mappings, which specifies how you want to map
    variables to visual aspects. In this case we are simply mapping the
    displ and hwy variables to the x- and y-axes.
-   You then add new layers that are geometric objects which will show
    up on the plot. In this case we add geom\_point to add a layer with
    points (dot) elements as the geometric shapes to represent the data.

<!-- -->

    # create canvas
    ggplot(mtcars)

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-3-1.png)

    # variables of interest mapped
    ggplot(mtcars, aes(x = cyl, y = mpg))

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-3-2.png)

    # data plotted
    ggplot(mtcars, aes(x = cyl, y = mpg)) +
      geom_point()

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-3-3.png)

Note that when you added the geom layer you used the addition (`+`)
operator. As you add new layers you will always use + to add onto your
visualization.

Aesthetic Mappings
------------------

The aesthetic mappings take properties of the data and use them to
influence visual characteristics, such as position, color, size, shape,
or transparency. Each visual characteristic can thus encode an aspect of
the data and be used to convey information.

All aesthetics for a plot are specified in the `aes()` function call
(later in this tutorial you will see that each `geom` layer can have its
own `aes` specification). For example, we can add a mapping from the
class of the cars to a color characteristic:

    ggplot(mtcars, aes(x = cyl, y = mpg, color = gear)) +
      geom_point()

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-4-1.png)

    class(mtcars$cyl)

    ## [1] "numeric"

    color <- as.character(mtcars$cyl)

    ggplot(mtcars, aes(x = cyl, y = mpg, color = color)) +
      geom_point()

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-4-2.png)

    ggplot(mtcars, aes(x = cyl, y = mpg, color = factor(gear))) +
      geom_point()

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-4-3.png)

    ggplot(mtcars, aes(x = cyl, y = mpg)) +
      geom_point(color = "blue")

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-4-4.png)

    ggplot(mtcars, aes(cyl, mpg, color = factor(gear), size = hp)) + #hp = horsepower
      geom_point()

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-4-5.png)

Specifying Geometric Shapes
---------------------------

Building on these basics, `ggplot2` can be used to build almost any kind
of plot you may want. These plots are declared using functions that
follow from the Grammar of Graphics.

The most obvious distinction between plots is what geometric objects
(geoms) they include. ggplot2 supports a number of different types of
geoms, including:

-   `geom_point` for drawing individual points (e.g., a scatter plot)
-   `geom_line` for drawing lines (e.g., for a line charts)
-   `geom_smooth` for drawing smoothed lines (e.g., for simple trends or
    approximations)
-   `geom_bar` for drawing bars (e.g., for bar charts)
-   `geom_histogram` for drawing binned values (e.g. a histogram)
-   `geom_polygon` for drawing arbitrary shapes
-   `geom_map` for drawing polygons in the shape of a map! (You can
    access the data to use for these maps by using the map\_data()
    function).

<!-- -->

    # Left column: x and y mapping needed!
    ggplot(mtcars, aes(x = cyl, y = mpg)) +
      geom_point()

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-5-1.png)

    ggplot(mtcars, aes(x = cyl, y = mpg)) +
      geom_line()

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-5-2.png)

    # plot with both points and smoothed line
    ggplot(mtcars, aes(x = cyl, y = mpg)) +
        geom_point() +
        geom_smooth(method = "lm")

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-5-3.png)

    ggplot(mtcars, aes(x = cyl, y = mpg)) +
      geom_point(color = "blue") +
      geom_smooth(method = "lm", color = "red")

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-5-4.png)

    # color aesthetic passed to each geom layer
    ggplot(mtcars, aes(x = cyl, y = mpg, color = cyl)) +
      geom_point() +
      geom_smooth(method = "lm", se = FALSE)

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-5-5.png)

    # color aesthetic specified for only the geom_point layer
    ggplot(mtcars, aes(x = cyl, y = mpg)) +
      geom_point(aes(color = factor(cyl))) +
      geom_smooth(method = "lm", se = FALSE)

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-5-6.png)

    # Right column: no y mapping needed!
    ggplot(data = mtcars, aes(x = gear)) +
      geom_bar()  

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-5-7.png)

    ggplot(data = mtcars, aes(x = gear)) +
      geom_histogram() 

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-5-8.png)

    ggplot(data = iris, aes(x = Sepal.Length)) +
      geom_histogram() 

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-5-9.png)

    ggplot(mtcars, aes(factor(gear), mpg)) + geom_violin()

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-5-10.png)

    ggplot(mtcars, aes(factor(gear), mpg))  + 
      geom_violin() +
      geom_point(shape = 1, position = "jitter")

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-5-11.png)

Statistical Transformations
---------------------------

If you look at the below bar chart, you’ll notice that the the y axis
was defined for us as the count of elements that have the particular
type. This count isn’t part of the data set (it’s not a column in mpg),
but is instead a **statistical transformation** that the `geom_bar`
automatically applies to the data. In particular, it applies the
`stat_count` transformation.

    ggplot(mtcars, aes(x = gear)) +
      geom_bar()

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-6-1.png)

    class_count <- dplyr::count(mpg, class)
    class_count

    ## # A tibble: 7 x 2
    ##   class          n
    ##   <chr>      <int>
    ## 1 2seater        5
    ## 2 compact       47
    ## 3 midsize       41
    ## 4 minivan       11
    ## 5 pickup        33
    ## 6 subcompact    35
    ## 7 suv           62

    ggplot(class_count, aes(x = class, y = n)) +
      geom_bar(stat = "identity")

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-6-2.png)

    ggplot(class_count, aes(x = class, y = n, fill=class)) +
      geom_bar(stat = "identity")

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-6-3.png)

We can also call `stat_` functions directly to add additional layers.
For example, here we create a scatter plot of highway miles for each
displacement value and then use `stat_summary` to plot the mean highway
miles at each displacement value.

    ggplot(mpg, aes(displ, hwy)) + 
      geom_point(color = "grey") + 
      stat_summary(fun = "mean", geom = "line", size = 1, linetype = "dashed")

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-7-1.png)

Position Adjustments
--------------------

In addition to a default statistical transformation, each geom also has
a default `position adjustment` which specifies a set of “rules” as to
how different components should be positioned relative to each other.
This position is noticeable in a `geom_bar` if you map a different
variable to the color visual characteristic:

    # bar chart of class, colored by drive (front, rear, 4-wheel)
    ggplot(ToothGrowth, aes(x = supp, y=len,  fill = dose)) + 
        geom_bar(stat = "identity")

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-8-1.png)

    ggplot(ToothGrowth, aes(x = supp, y=len,  fill = factor(dose))) + 
        geom_bar(stat = "identity")

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-8-2.png)

The `geom_bar` by default uses a position adjustment of “`stack`”, which
makes each rectangle’s height proprotional to its value and stacks them
on top of each other. We can use the `position` argument to specify what
position adjustment rules to follow:

    # position = "dodge": values next to each other
    ggplot(mpg, aes(x = class, fill = drv)) + 
      geom_bar(position = "dodge")

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-9-1.png)

    # position = "fill": percentage chart
    ggplot(mpg, aes(x = class, fill = drv)) + 
      geom_bar(position = "fill")

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-9-2.png)

Managing Scales
---------------

Whenever you specify an aesthetic mapping, ggplot uses a particular
scale to determine the range of values that the data should map to. Thus
when you specify

    # color the data by engine type
    ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
      geom_point()

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-10-1.png)

`ggplot` automatically adds a scale for each mapping to the plot:

    # same as above, with explicit scales
    ggplot(economics, aes(date, unemploy)) +
      geom_point() +
      scale_y_continuous() +
      scale_colour_discrete()

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-11-1.png)

    ggplot(economics, aes(date, unemploy)) + 
      geom_line() +
      scale_y_continuous(limits = c(0, max(economics$unemploy)))

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-11-2.png)

    ggplot(economics, aes(date, unemploy)) + 
      geom_line() +
      scale_y_continuous(limits = c(0, max(economics$unemploy))) +
      scale_x_date(limits = c(as.Date("2000-01-01"), as.Date(Sys.time())))

    ## Warning: Removed 390 row(s) containing missing values (geom_path).

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-11-3.png)

Each scale can be represented by a function with the following name:
`scale_`, followed by the name of the aesthetic property, followed by an
\_ and the name of the scale. A `continuous` scale will handle things
like numeric data (where there is a continuous set of numbers), whereas
a `discrete` scale will handle things like colors (since there is a
small list of distinct colors).

While the default scales will work fine, it is possible to explicitly
add different scales to replace the defaults. For example, you can use a
scale to change the direction of an axis:

    # milage relationship, ordered in reverse
    ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
      geom_point() +
      scale_x_reverse() +
      scale_y_reverse()

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-12-1.png)

A common parameter to change is which set of colors to use in a plot.
While you can use the default coloring, a more common option is to
leverage the pre-defined palettes from `colorbrewer.org`. These color
sets have been carefully designed to look good and to be viewable to
people with certain forms of color blindness. We can leverage color
brewer palletes by specifying the `scale_color_brewer()` function,
passing the pallete as an argument.

    # default color brewer
    ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
      geom_point() +
      scale_color_brewer()

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-13-1.png)

    # specifying color palette
    ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
      geom_point() +
      scale_color_brewer(palette = "Set3")

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-13-2.png)

    ggplot(mpg, aes(displ, hwy, color = class)) +
      geom_point() + 
      scale_color_hue(h = c(270, 360)) # blue to red

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-13-3.png)

\[colorbrewer.org\]\](<a href="https://colorbrewer2.org/#type=sequential&amp;scheme=BuGn&amp;n=3" class="uri">https://colorbrewer2.org/#type=sequential&amp;scheme=BuGn&amp;n=3</a>)

### Scales

    ggplot(midwest, aes(area, poptotal)) + 
      geom_point() + 
      scale_y_log10()

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-14-1.png)

    mpg %>%
      group_by(class) %>% 
      summarize(maxhwy = max(hwy)) %>% 
      ggplot(aes(class, maxhwy)) +
        geom_col() +
        scale_x_discrete(labels = toupper(sort(unique(mpg$manufacturer))))

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-14-2.png)

    ggplot(ToothGrowth, aes(x=dose, y=len)) + 
      geom_boxplot()

    ## Warning: Continuous x aesthetic -- did you forget aes(group=...)?

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-14-3.png)

    ggplot(ToothGrowth, aes(x=factor(dose), y=len)) + 
      geom_boxplot()

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-14-4.png)

    ggplot(ToothGrowth, aes(x=factor(dose), y=len)) + 
      geom_boxplot() +
      scale_x_discrete(name ="Dose (mg)",limits=c("2","1","0.5"))

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-14-5.png)

Facets
------

`Facets` are ways of grouping a data plot into multiple different pieces
(subplots). This allows you to view a separate plot for each value in a
categorical variable. You can construct a plot with multiple facets by
using the facet\_wrap() function. This will produce a “row” of subplots,
one for each categorical variable (the number of rows can be specified
with an additional argument):

    ggplot(mpg, aes(displ, hwy)) +
      geom_point() +
      facet_wrap(~ year)

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-15-1.png)

    ggplot(mpg, aes(displ, hwy)) +
      geom_point() +
      facet_wrap(~ manufacturer)

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-15-2.png)

You can also facet\_grid to facet your data by more than one categorical
variable. Note that we use a tilde (~) in our facet functions. With
facet\_grid the variable to the left of the tilde will be represented in
the rows and the variable to the right will be represented across the
columns.

    ggplot(mpg, aes(x = displ, y = hwy)) +
      geom_point() +
      facet_grid(year ~ cyl)

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-16-1.png)

Labels & Annotations
--------------------

Textual labels and annotations (on the plot, axes, geometry, and legend)
are an important part of making a plot understandable and communicating
information. Although not an explicit part of the Grammar of Graphics
(the would be considered a form of geometry), `ggplot` makes it easy to
add such annotations.

You can add titles and axis labels to a chart using the`labs()` function
(not labels, which is a different R function!):

    ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
      geom_point() +
      labs(title = "Fuel Efficiency by Engine Power",
           subtitle = "Fuel economy data from 1999 and 2008 for 38 popular models of cars",
           x = "Engine power (litres displacement)",
           y = "Fuel Efficiency (miles per gallon)",
           color = "Car Type")

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-17-1.png)

`ggplot2` offers us a very highly level of customizability in the
`theme` function and pre-set themes.

    ggplot(mpg, aes(displ, hwy, color = class)) + 
      geom_point() +
      theme_classic()

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-18-1.png)

    ggplot(mpg, aes(displ, hwy, color = class)) + 
      geom_point() +
      theme_classic() +
      theme(legend.position = "bottom",
            legend.background = element_rect(fill = "#EEEEEE", color = "black"),
            legend.title = element_blank(),
            axis.title = element_text(size = 16))

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-18-2.png)

    ggplot(mpg, aes(displ, hwy, color = class)) + 
      geom_point() +
      theme_classic() +
      theme(legend.position = c(1, 1),
            legend.justification = c(1,1),
            legend.direction = "horizontal",
            legend.title = element_blank()) +
      xlab("Engine Displacement") +
      ylab("Highway Fuel Economy (miles / gallon") +
      ggtitle("Highway fuel economy versus engine displacement",
              "or why do you need that big truck again? ")

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-18-3.png)

It is also possible to add labels into the plot itself (e.g., to label
each point or line) by adding a new geom\_text or geom\_label to the
plot; effectively, you’re plotting an extra set of data which happen to
be the variable names:

    # a data table of each car that has best efficiency of its type
    best_in_class <- mpg %>%
      group_by(class) %>%
      filter(row_number(desc(hwy)) == 1)

    ggplot(mpg, aes(x = displ, y = hwy)) + 
      geom_point(aes(color = class)) +
      geom_label(data = best_in_class, aes(label = model), alpha = 0.5)

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-19-1.png)

However, note that two labels overlap one-another in the top left part
of the plot. We can use the geom\_text\_repel function from the ggrepel
package to help position labels.

    library(ggrepel)

    ggplot(mpg, aes(x = displ, y = hwy)) + 
      geom_point(aes(color = class)) +
      geom_text_repel(data = best_in_class, aes(label = model))

![](ggplot2_files/figure-markdown_strict/unnamed-chunk-20-1.png)

Saving plots
------------

Let’s save that great plot we just made. Saving plots in ggplot is done
with the `ggsave()` function:

    ggsave("hwy_vs_displ.png")
    ggsave("hwy_vs_displ.png", width = 6, height = 6)

Animation
---------

    # Get data
    library(gapminder)
     
    # Charge libraries
    library(ggplot2)
    library(gganimate)
     
    # Make a ggplot, but add frame=year: one image per year
    ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, color = continent)) +
      geom_point() +
      scale_x_log10() +
      theme_bw() +
      # gganimate specific bits
      labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
      transition_time(year) +
      ease_aes('linear')

    # Save at gif
    anim_save("271-ggplot2-animated-gif-chart-with-gganimate1.gif")

![](271-ggplot2-animated-gif-chart-with-gganimate1.gif)

Maps
----

    # Load the library
    library(leaflet)

    # Note: if you do not already installed it, install it with:
    # install.packages("leaflet")

    # Background 1: NASA
    m <- leaflet() %>% 
       addTiles() %>% 
       setView( lng = 2.34, lat = 48.85, zoom = 5 ) %>% 
       addProviderTiles("NASAGIBS.ViirsEarthAtNight2012")
    m
     
    # Background 2: World Imagery
    m <- leaflet() %>% 
       addTiles() %>% 
       setView( lng = 2.34, lat = 48.85, zoom = 3 ) %>% 
       addProviderTiles("Esri.WorldImagery")
    m

    # save the widget in a html file if needed.
    library(htmlwidgets)
    saveWidget(m, file="backgroundMapTile.html")

[Tidyuesday](https://duvancho321.github.io/Tidyuesday/Folder/2020/2020-01-07/)

Reference:
==========

1.  [ggplot2
    essentials](http://www.sthda.com/english/wiki/ggplot2-essentials)
2.  [ggplot2: Elegant Graphics for Data
    Analysis](https://ggplot2-book.org/)
3.  [UC Business Analytics R Programming
    Guide](https://uc-r.github.io/ggplot_intro)
4.  [R graphics with ggplot2
    workshop](https://tutorials.iq.harvard.edu/R/Rgraphics/Rgraphics.html)
5.  [Visualizations I: Intro to
    ggplot2](http://joeystanley.com/downloads/180216-ggplot2-part1)
