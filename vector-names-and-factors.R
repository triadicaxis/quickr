## A vector sequence can be any data type, and run in both directions and over zero
v1 <- c(-1,4,-7)
v2 <- c("male", "female", "female", "female", "male")

## Naming elements in a vector
names(v1)
names(v1) <- c("A", "B", "C")
v1

## Factors are just categorical variables
## A level is each unique value in the given vector
fac <- as.factor(v2)
fac

## Under the hood, factors simply list the unique values of a vector in alphabetical order
as.numeric(fac)