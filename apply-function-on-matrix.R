## use the apply function to iterate over a matrix, but NOT a dataframe
mat <- matrix(1:9, nrow=3, ncol=3, byrow=FALSE)
mat

## apply sum over each row (MARGIN=1) of the matrix, but better to use rowSums()
apply(mat, MARGIN=1, sum)

## apply square root over each column (MARGIN=2) of the matrix, but better to use colSums()
apply(mat, MARGIN=2, sum)

## use colSums () and rowSums() instead. Also works for a dataframe!
rowSums(mat)
colSums(mat)

## if the matrix contains NAs, the result will also be NA
mat2 <- mat
mat2[2,1] <- NA

rowSums(mat2)
colSums(mat2)

## can remove the NA if appropriate
rowSums(mat2, na.rm=TRUE)
colSums(mat2, na.rm=TRUE)