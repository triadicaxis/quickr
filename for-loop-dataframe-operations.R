## Apply an operation to a dataframe with a for loop (discouraged, better ways exist)
v1 <- 10:1
v2 <- -4:5
v3 <- rep(c(0.8, 0.9), times=5)

df1 <- data.frame(v1, v2, v3) # original dataframe
df2 <- data.frame(NA, NA, NA) # create an empty dataframe

for(i in 1:nrow(df1)){
  for(j in 1:ncol(df1)){
    df2[i,j] <- df1[i,j]*3
  }
}

## Try it
df2

## But much faster to use the apply() function!