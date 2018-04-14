## start by creating an empty list of the full size needed and then fill it

## for now, however, let's start with the basics
## simple list
list1 <- list(1,2,3)
list2 <- list(c(1,2,3))

list1
list2

## named list
list3 <- list(c(1:3), 3:-1)
names(list3) <- c("A", "B")

list3

## list containing a dataframe, a vector, a matrix and a number
v1 <- c(10:1)
v2 <- c(-4:5)
v3 <- rep(c("a","b"), times=5)
v4 <- c(2.3, 1.1, 5.7, NA, NA, 2.2, 4.1, NA, 6.9, 1.5)

df <- data.frame(v1, v2, v3, v4, stringsAsFactors=FALSE)
vec <- -6.5:6
mat <- matrix(1:12, nrow=3, ncol=4)
x <- 3.1415

list4 <- list(df, vec, mat, x)
list4

## list containing a list (i.e. recursive list)
list5 <- list(df, 1:10, list3)
list5

## recreate list5 but this time with names item1 .. item3
list6 <- list(item1=df, item2=1:10, item3=list3)
list6

names(list6) ## shows the names of the elements in the list
list6[["item2"]] ## we can refer to any element by its name
list6[[1]]$v4 ## we can even subset the vector inside the df in item1
list6[[1]][ ,"v4"] ## or we can subset it with the [row, column] notation

## add another element to list6 by referring to a name that doesn't exist yet
list6[["newItem"]] <- 3:6
names(list6)

## create an empty list and fill it (recommended approach, more efficient)
emptyList <- vector(mode="list", length=4)
emptyList
length(emptyList)

## now fill in the list, first element gets 5
emptyList[[1]] <- 5
emptyList
