
## XML basically performs two functions: parsing (reading), and writing
library("XML")

## Example 1: use xmlParse
dat1 <- xmlParse("http://www.forexfactory.com/calendar.php", isHTML = TRUE, useInternalNodes = FALSE)

## Example 2: use htmlParse
dat2 <- htmlParse("http://www.forexfactory.com/calendar.php", useInternalNodes = FALSE)

## Example 3: use htmlTreeParse
dat3 <- htmlTreeParse("http://www.forexfactory.com/calendar.php")

## in a worst-case scenario we can use tidyHTML() from the R package "RTidyHTML", and then pass the result to htmlParse()

root <- xmlRoot(dat3)
root

child <- xmlChildren(root)
child

## first check length(child), in this case=2
subchild1 <- xmlChildren(child[[1]]) 
subchild1

subchild2 <- xmlChildren(child[[2]])
subchild2
