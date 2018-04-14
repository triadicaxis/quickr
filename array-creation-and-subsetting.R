## array is just a vector with 3 or more dimensions
## array(data=NA, dim=length(data), dimnames=NULL)
## data is the vector the fill the array
## dim are the row and column numbers

v <- 1:60
v

## method 1: create an array of five 3x4 matrices, and populate it with data
arr <- array(data=v, dim=c(3,4,5))

## Try it out
arr
arr[1,,]
arr[1,2,]
arr[2,3,1]

## ## method 2: alternatively, just specify the vector's higher dimensions
dim(v) <- c(3,4,5)
v

## Try it out
v
v[1,,]
v[1,2,]
v[2,3,1]
