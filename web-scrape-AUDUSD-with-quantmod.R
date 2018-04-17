
## Tutorial https://www.youtube.com/watch?v=a4ytQbxfNh0
## Working with XTS objects, which have three components: index, matrix, attributes.
## The index of and XTS object is always a time series.

## Clear memory and load the required packages
rm(list=ls())
require("TTR") # required for quantmod
require("quantmod") # required for XTS objects

## First method: use the getFX function, here for AUD/USD
getFX('AUD/USD',
      from = Sys.Date() - 499,
      to = Sys.Date(),
      env = parent.frame(),
      verbose = FALSE,
      warning = TRUE,
      auto.assign = TRUE)

plot(AUDUSD)

## Alternative method: use the getSymbols function, here for USD/EUR
getSymbols("USD/EUR", src="oanda")

plot(USDEUR)


