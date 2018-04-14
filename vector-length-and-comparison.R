## A vector sequence can be any data type, and run in both directions and over zero
v1 <- c(1:10)
v2 <- c(10:1)
v3 <- c("Joe", "Alice", "Bill")

## Check the number of elements in a vector
length(v1)
length(v1 + v2)
nchar(v3)

## Compare the elements of a vector to a constant, or to another vector 
v1 <= 3
v1 < v2
any(v1 < v2)
all(v1 < v2)