## R has dedicated functions for performing set operations on two given vectors. 
## We can apply functions such as set union, intersection, difference, equality and membership, on "character" vectors
## All the set operation functions will discard any duplicated values.

# two character vectors 
set1 <- c("some", "random", "words", "some", "few") 
set2 <- c("some", "many", "none", "few")

# union() of set1 and set2 
union(set1, set2) ## duplicate values are discarded

## intersect() of set1 and set2
intersect(set1, set2)

## difference between set1 and set2
setdiff(set1, set2)

## setequal() ignores order of elements
set3 <- c("few", "some", "none", "many")
setequal(set1, set2)
setequal(set2, set3)

## identical(), elements must be in the same order to be TRUE
set4 <- c("few", "some", "none", "many")
identical(set2, set3)
identical(set3, set4)

## is the word 'none' an element of set1? How about set2?
"none" %in% set1
"none" %in% set2

## sort() increasing or decreasing
set5 <- c("b", "f", "e", "c", "a", "d")
sort(set5)
sort(set5, decreasing = TRUE)
