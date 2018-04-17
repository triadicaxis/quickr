## Transpose a matrix with a for loop (works with a dataframe too!)
m1 <- matrix(1:25, nrow=5, ncol=5) # original matrix
m2 <- matrix( , nrow=5, ncol=5) # create an empty matrix

for(i in 1:nrow(m1)){
  for(j in 1:ncol(m1)){
    m2[j,i] <- m1[i,j]
  }
}

## Try it
m2

## But much better to use the t() function, which works with a dataframe too!
t(m2)