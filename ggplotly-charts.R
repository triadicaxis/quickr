#!/usr/bin/env Rscript

rm(list = ls())

## source: https://plotly-book.cpsievert.me/
## source: http://ropensci.github.io/plotly/ggplot2/

#################################################################################

library(plotly)
library(dplyr)
library(ggplot2)

## ggplotly() and plot_ly() are two ways to create plotly.js visualisations
## dataframes are highly recommended, especially when constructing a plot with multiple layers or groups

#################################################################################

## example: using ggplotly()

## create a ggplot2 object p
p <- ggplot(txhousing, aes(date, median)) +
  geom_line(aes(group = city), alpha = 0.2)

## convert the ggplot2 object p to a plotly chart: ggplotly(p)
subplot(
  p, ggplotly(p, tooltip = "city"), ## restrict tooltip to text only: ggplotly(p, tooltip = "text")
  ggplot(txhousing, aes(date, median)) + geom_bin2d(),
  ggplot(txhousing, aes(date, median)) + geom_hex(),
  nrows = 2, shareX = TRUE, shareY = TRUE,
  titleY = FALSE, titleX = FALSE
)

#################################################################################

## example: using native plot_ly()

tx <- group_by(txhousing, city) # use dplyr to group data
p <- plot_ly(tx, x = ~date, y = ~median) # initiate a plotly object with date on x and median on y
plotly_data(p) # plotly_data() returns data associated with a plotly object

# ..add a line highlighting houston

add_lines(
  # plots one line per city since p knows city is a grouping variable
  add_lines(p, alpha = 0.2, name = "Texan Cities", hoverinfo = "none"),
  name = "Houston", data = filter(txhousing, city == "Houston")
)

## ..rebuild chart with more readable syntax (original data cannot be recovered from pipeline)

allCities <- txhousing %>%
  group_by(city) %>%
  plot_ly(x = ~date, y = ~median) %>%
  add_lines(alpha = 0.2, name = "Texan Cities", hoverinfo = "none")

allCities %>%
  filter(city == "Houston") %>%
  add_lines(name = "Houston")

## ..rebuild chart but preserve original data inside the pipeline, syntax: 

allCities <- txhousing %>%
  group_by(city) %>%
  plot_ly(x = ~date, y = ~median) %>%
  add_lines(alpha = 0.2, name = "Texan Cities", hoverinfo = "none")

allCities %>%
  add_fun(function(plot) {
    plot %>% filter(city == "Houston") %>% add_lines(name = "Houston")
  }) %>%
  add_fun(function(plot) {
    plot %>% filter(city == "San Antonio") %>% add_lines(name = "San Antonio")
  })

## general syntax:
# p <- df %>% filter(!is.na(MYVAL) %>% group_by(YEAR, GROUPVAR, ...) %>% plot_ly(x = ~XVAR, y = ~MYVAL)
# p %>% add_fun(FUN1) %>% add_fun(FUN2) %>% add_fun(FUN3) %>% ...

#################################################################################

## it is useful to think of the function supplied to add_fun() as a layer function 

## ..reusable function for highlighting a particular city
layer_city <- function(plot, name) {
  plot %>% filter(city == name) %>% add_lines(name = name)
}

## ..reusable function for plotting overall median & IQR
layer_iqr <- function(plot) {
  plot %>%
    group_by(date) %>% 
    summarise(
      q1 = quantile(median, 0.25, na.rm = TRUE),
      m = median(median, na.rm = TRUE),
      q3 = quantile(median, 0.75, na.rm = TRUE)
    ) %>%
    add_lines(y = ~m, name = "median", color = I("black")) %>%
    add_ribbons(ymin = ~q1, ymax = ~q3, name = "IQR", color = I("black"))
}

## ..apply the function, select desired cities
allCities %>%
  add_fun(layer_iqr) %>%
  add_fun(layer_city, "Houston") %>%
  add_fun(layer_city, "San Antonio")

## The only requirement on a layering function is that the first argument is a plotly object and it returns a plotly object. 
## And since plotly's add_*() functions don't require a dataframe, you can supply those components directly to attribute.

#################################################################################

## As it turns out, we can even use these ideas when creating a plotly object via ggplotly()
## Since the ggplotly() function returns a plotly object, we can manipulate that object in the same way that we would manipulate any other plotly object. 

# install.packages("listviewer") ## great package for viewing lists and JSON
library(listviewer)

p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() + geom_smooth()

plotly_json(p)



