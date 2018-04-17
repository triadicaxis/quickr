## read in some data
orig <- mtcars

## save as .json, requires jsonlite
library(jsonlite)
js <- toJSON(orig, pretty = TRUE)
cat(js, file = "C:/Users/black/Documents/R_Projects/R_Testlab/mtcars.json")

## view the .json file in a normal text editor (eg. notepad)
## now open it as a dataframe in R
library(jsonlite)
newdf <- fromJSON(txt = "C:/Users/black/Documents/R_Projects/R_Testlab/mtcars.json")

## View the new df in RStudio
## then convert it back to .json, view it in RStudio
library(jsonlite)
js2 <- toJSON(newdf, pretty = TRUE)
js2

## check that they're the same
identical(js, js2)
identical(orig, newdf)

newdf[!which(newdf == orig), ]
newdf[which(newdf == orig), ]
