#!/usr/bin/env Rscript

rm(list = ls())

## source: https://plotly-book.cpsievert.me/

#################################################################################

library(plotly)

#################################################################################

## convert a ggplot object x to a plotly chart
ggplotly(x)

