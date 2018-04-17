## Create a dataframe from vectors
v1 <- c(10:1)
v2 <- c(-4:5)
v3 <- rep(c("a","b"), times=5)
v4 <- c(2.3, 1.1, 5.7, NA, NA, 2.2, 4.1, NA, 6.9, 1.5)

df <- data.frame(v1, v2, v3, v4, stringsAsFactors=FALSE)
df

## Check its dimensions and data types
nrow(df)
ncol(df)
dim(df)
str(df)

## Check and change the row and column labels
names(df) <- c("Joe", "Bill", "Alice", "Charles")
df

rownames(df) <- 2005:2014
df

rownames(df) <- NULL
df

## transpose the dataframe (i.e. switch rows to columns)
df2 <- data.frame()
for(i in 1:nrow(df)){
  for(j in 1:ncol(df)){
    df2[j,i] <- df[i,j]
  }
}
df2

## replace NAs with zeros (works for NaNs, too!)
df[is.na(df)] <- 0
df