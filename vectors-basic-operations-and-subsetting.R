## A vector sequence can be any data type, and run in both directions and over zero
v1 <- c(1:10)
v2 <- c(10:1)
v3 <- c(-5:4)
v4 <- c(5:-4)

v5 <- c(1,2)
v6 <- c(-1,4,-7)
v7 <- c("Joe", "Alice", "Bill")
v8 <- 3

v9 <- c("a", "b", "c")
v10 <- c("male", "female")

## Multiply a vector by a constant (works for any operation)
v1 * 3
v1 + 2
v1 - 3
v1 / 2
sqrt(v1)

## Multiply each element in a vector by each element in another vector (works for any operation)
v1 + v2
v1 - v2
v1 * v2
v1 / v2

## Add two vectors of different lengths, element by element (recycling)
v1 + v5
v5 + v6 # still works but gives a warning that the shorter vector is not an exact multiple of the longer one

## Subset a particular element by its position
v3[2]
v3[2:5]
v3[c(2,5)]