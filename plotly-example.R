#!/usr/bin/env Rscript

rm(list = ls())

library(tidyverse)
library(plotly)

## make up some fake data
df <- mtcars %>% rownames_to_column() %>% mutate(note = 'Some additional info about')
names(df)[names(df)=='rowname'] <- 'model'
df$make <- gsub('([a-zA-Z]+).*', '\\1', df$model)
df$note <- paste(df$note, df$model)
df <- df %>% group_by(make) %>% summarise(avg = mean(mpg)) %>% left_join(df)
df$make <- factor(df$make, levels = df$make[order(df$avg, increasing = TRUE)])

## example 1: create plotly scatterplot
df %>% plot_ly(x = ~disp, y = ~mpg, color = ~factor(cyl), size = ~wt) %>%   
  add_markers(hoverinfo = 'text', text = ~paste('Model:', model, '\nMiles per gallon:', mpg, '\nNote:', note)) %>%   
  layout(title ='My Scatterplot', annotations=list(yref='paper', xref='paper', y=1.05, x=1.1, text='Cylinders', showarrow=F))

## example 2: create bar chart
df %>% plot_ly(x = ~avg, y = ~make, type = 'bar', orientation = 'h', 
               hoverinfo = 'text', text = ~paste('Make:', make, '\nAverage miles per gallon:', mpg)) %>%   
  layout(barmode = 'group', title ='My Barchart')


Animals <- c("giraffes", "orangutans", "monkeys")
Count <- c(20, 14, 23)
data <- data.frame(Animals, Count, stringsAsFactors = FALSE)
data$Animals <- factor(data$Animals, levels = unique(data$Animals)[order(data$Count, decreasing = TRUE)])
plot_ly(data, x = ~Animals, y = ~Count, type = "bar", name = 'SF Zoo')

#################################################################################

## create plotly object, requires plotly
p <- df %>% 
  filter(!is.na(mpg)) %>% 
  group_by(make, cyl, gear) %>% 
  plot_ly(x = ~cyl, y = ~mpg)
plotly_data(p) ## view data inside the object

## pipe the object through layers
p %>%
  add_fun(function(p) {
    p %>% add_trace(x = ~cyl, y = ~mpg, type = 'bar', name = ~gear,
                    orientation = 'v', ## vertical or horizontal
                    text = ~make,
                    # textposition = 'outside',
                    hoverinfo = ~note)
  }) %>%
  add_fun(function(p) {
    p %>% layout(title = '',
                 xaxis = list(title = 'Number of cylinders', tickangle = 0),
                 yaxis = list(side = 'left', title = "Miles per gallon", showgrid = FALSE, zeroline = FALSE, domain = c(0, 30)),
                 showlegend = TRUE,
                 barmode = 'bar') ## group or stack
  })


# legendtitle <- list(yref='paper',xref="paper",y=1.05,x=1.1, text="Cylinders", showarrow=F)

df %>% plot_ly(x = ~disp, y = ~mpg, color = ~factor(cyl), size = ~wt) %>%   
  add_markers(hoverinfo = "text", text = ~paste("Model:", model, "\nMiles Per Gallon:", mpg, "\nNote:", note)) %>%   
  layout(title ="Custom Hover Text", annotations=list(yref='paper', xref="paper", y=1.05, x=1.1, text="Cylinders", showarrow=F))
  