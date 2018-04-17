## sweep performs an operation on a whole dataframe, using a single row (MARGIN=2) or single column (MARGIN=1)
x <- c(1:10)
y <- c(11:20)
z <- c(21:30)

a <- c(3.2:12.2)
b <- rep(4.3:13.3)
c <- rep(5.4:14.4)

df1 <- data.frame(x, y, z)
df2 <- data.frame(a, b, c)

ref <- as.numeric(df2[8,])

## divide each row of the dataframe by the single row named ref
sweep(df1, MARGIN=2, ref, "/")
sweep(df2, MARGIN=2, ref, "/")
