## create first dataframe

v1 <- seq(from=8, to=88, by=8)
v2 <- seq(from=9, to=99, by=9)
v3 <- seq(from=5, to=55, by=5)

df1 <- data.frame(v1, v2, v3, stringsAsFactors=FALSE)

## create second dataframe

v4 <- seq(from=8/.9, to=88/.9, by=8/.9)
v5 <- seq(from=9/.8, to=99/.8, by=9/.8)
v6 <- seq(from=5/.7, to=55/.7, by=5/.7)

df2 <- data.frame(v4, v5, v6, stringsAsFactors=FALSE)

## create for loop to 

v7 <- c()
for(i in 1:nrow(df1)){
  v7[i] <- sum(df1[i, ])
}
