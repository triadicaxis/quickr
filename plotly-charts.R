#!/usr/bin/env Rscript

rm(list = ls())

## source: https://www.youtube.com/watch?v=EuCOW-S5S6s
## source: https://plotly-book.cpsievert.me/

#################################################################################

library(plotly)

#################################################################################

## example 1: simple bar chart

df <- aggregate (mpg ~ cyl + hp, mtcars, mean) ## simplify mtcars

## make chart
plot_ly(df, x = ~cyl, y = ~mpg, type = "bar")

#################################################################################

## example 2: customise tooltip

df <- aggregate (mpg ~ cyl + hp, mtcars, mean) ## simplify mtcars
df$note <- ifelse(df$cyl == 4, "Four cylinder engine", ifelse(df$cyl == 6, "Six cylinder engine", "Eight cylinder engine")) ## add a note column

## make chart
plot_ly(df, x = ~cyl, y = ~mpg, type = "bar", text = ~note)

#################################################################################

## example 3: clustered or stacked bar chart

df <- mtcars ## full mtcars

## make chart
plot_ly(df, x = ~cyl, y = ~mpg, type = "bar", name = "Cylinders") %>% 
  add_trace(y = ~hp, name = "Horse Power") %>% 
  layout(barmode = "group") ## barmode = "group" or "stack"

#################################################################################

## example 4: clustered or stacked bar chart, customise bar colour
## can use HEX, RGB, or RGBA (## RGBA = RGB plus opacity, 1 = 100%)

df <- mtcars ## full mtcars

## make chart
plot_ly(df, x = ~cyl, y = ~mpg, type = "bar", name = "Cylinders", color = "rgba(0,92,175,1)") %>% ## using RGBA
  add_trace(y = ~hp, name = "Horse Power", color = "rgba(86,180,223,1)") %>%
  layout(barmode = "group") ## barmode = "group" or "stack"

#################################################################################

## example 5: clustered or stacked bar chart, customise individual bar colours

x <- c("Small", "Medium", "Large")
y <- c(20, 14, 11)
note <- c("Small firms", "Medium firms", "Large firms")
df <- data.frame(x, y, note)

## make chart
plot_ly(df, x = ~x, y = ~y, type = "bar", text = ~y, textposition = "outside",
        marker = list(color = c("rgba(0,92,175,1)", "rgba(0,92,175,1)", "rgba(86,180,223,1)"))) %>%
  layout(title = "", xaxis = list(title = "Firm size"), yaxis = list(title = "Number", showgrid = FALSE, zeroline = FALSE)) ## hide horizontal gridlines

#################################################################################

## source: https://plot.ly/r/graphing-multiple-chart-types/

library(plotly)

airquality_sept <- airquality[which(airquality$Month == 9),]
airquality_sept$Date <- as.Date(paste(airquality_sept$Month, airquality_sept$Day, 1973, sep = "."), format = "%m.%d.%Y")

plot_ly(airquality_sept) %>%
  add_trace(x = ~Date, y = ~Wind, type = 'bar', name = 'Wind',
            marker = list(color = '#C9EFF9'),
            hoverinfo = "text",
            text = ~paste(Wind, ' mph')) %>%
  add_trace(x = ~Date, y = ~Temp, type = 'scatter', mode = 'lines', name = 'Temperature', yaxis = 'y2',
            line = list(color = '#45171D'),
            hoverinfo = "text",
            text = ~paste(Temp, '°F')) %>%
  layout(title = 'New York Wind and Temperature, September 1973',
         xaxis = list(title = ""),
         yaxis = list(side = 'left', title = 'Wind in mph', showgrid = FALSE, zeroline = FALSE),
         yaxis2 = list(side = 'right', overlaying = "y", title = 'Temperature in degrees F', showgrid = FALSE, zeroline = FALSE))

#################################################################################

## combined
# TBC