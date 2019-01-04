## using the mtcars dataset...

###############################################################################################################

## apply input: matrix, array, or dataframe columns containing only one class of values (e.g. numeric, character)
## apply output: vector, matrix, array, list (whichever is simplest)
## apply syntax: lapply(object, MARGIN = 1 or 2, function, ... additional arguments specific to the function)
## function iterates over selected margin: row MARGIN = 1, col MARGIN = 2, both MARGIN = c(1,2)

m <- as.matrix(mtcars) ## matrix example
apply(m, MARGIN = 2, mean)

df <- mtcars[ , c(1:2)] ## subsetted dataframe, where selected columns contain only numeric values
apply(df, MARGIN = 2, mean)

df <- mtcars[ , -c(3:ncol(mtcars))] ## subsetted dataframe by excluding specified columns
apply(df, MARGIN = 2, mean)

df <- mtcars[ , -c(3:ncol(mtcars))] ## subsetted dataframe by excluding specified columns
apply(df, MARGIN = 2, mean, na.rm = TRUE) ## the na.rm = TRUE argument belongs to the mean() function

###############################################################################################################

## lapply input: list, dataframe, vector
## lapply output: list (always)
## lapply syntax: lapply(object, function, ... additional arguments specific to the function)
## function iterates over columns (always)

l <- as.list(mtcars) ## list example
lapply(l, mean)

df <- mtcars ## dataframe example
lapply(df, mean, na.rm = TRUE) ## the na.rm = TRUE argument belongs to the mean() function

v <- as.vector(mtcars[1]) ## vector example
lapply(v, mean)

###############################################################################################################

## sapply input: list, dataframe, vector
## sapply output: vector, matrix, array, list (whichever is simplest)
## sapply syntax: sapply(object, function, ... additional arguments specific to the function)
## function iterates over columns (always)

l <- as.list(mtcars) ## list example
sapply(l, mean)

df <- mtcars ## dataframe example
sapply(df, mean, na.rm = TRUE) ## the na.rm = TRUE argument belongs to the mean() function

v <- as.vector(mtcars[1]) ## vector example
sapply(v, mean)

###############################################################################################################

## tapply input: vector, column of dataframe, elements of list
## tapply output: named vector 
## tapply syntax: tapply(x, index, function, ... additional arguments specific to the function)
## function iterates over subsets of vector, grouped by index. tapply() is very similar to aggregate()

x <- sample(seq(15, 65), replace = TRUE, size = 30) ## e.g. ages of workers
i <- rep(c("male", "female"), times=15) ## e.g. sex of workers
tapply(x, i, mean) ## vector example

df <- data.frame(x, i)
tapply(df$x, df$i, mean) ## dataframe example

l <- list(x=x, i=i)
tapply(l$x, l$i, mean) ## list example

temp <- tapply(df$x, df$i, mean) ## list example

