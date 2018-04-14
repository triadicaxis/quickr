## https://cran.r-project.org/web/packages/rio/vignettes/rio.html
## read in some data
orig <- mtcars

## convert to XML, requires rio
library(rio)
export(orig, "C:/Users/Orange/Documents/R-Projects/mtcars.xml")

## view the XML file in a normal text editor (eg. notepad)
## now open it as a dataframe in R
library(rio)
newdf <- import("C:/Users/Orange/Documents/R-Projects/mtcars.xml")

## View the new df in RStudio
## then convert it back to XML, view it in RStudio
library(XML)
xm <- newXMLNode("a")
newXMLNode("b", attrs = c(x = 1, y = 'abc'), parent = xm)
newXMLNode("c", "With some text", parent = xm)
xm

## check that they're the same
