## create a matrix of integers. By default, matrix elements are populated by columns.
mat <- matrix(1:9, nrow=3, ncol=3, byrow=FALSE)
mat

## creates a 3x3 matrix, where elements are populated by rows instead of columns.
mat2 <- matrix(c(1:9), nrow=3, byrow=TRUE) 
mat2

## run a few tests
mat[2,3] # extracts only the element in 2nd row and 3rd column from m (i.e. number 6).
mat[c(1,3),2] # extracts only the elements in the 1st and 3nd row from the 2nd column from m (i.e. numbers 2, 8).
mat[2,] # extracts the entire 2nd row from m (i.e. numbers 4, 5, 6).
mat[,3] # extracts the entire 2nd column from m (i.e. numbers 4, 5, 6).
mat*10 # multiplies every element in m by 10 (resulting in 10, 20, 30, 40, ., 90).