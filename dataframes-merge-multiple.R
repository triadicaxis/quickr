## merge dataframes using Reduce and merge
## create some data

df1 <- data.frame(seq(from=1001, to=1006), LETTERS[seq(from=1, to=6)], rep(2009, times=6), stringsAsFactors = FALSE)
names(df1) <- c("sa3_code", "org_type", "fin_year")

df2 <- data.frame(seq(from=1011, to=1016), LETTERS[seq(from=3, to=8)], rep(2010, times=6), stringsAsFactors = FALSE)
names(df2) <- c("sa3_code", "org_type", "fin_year")

df3 <- data.frame(seq(from=1021, to=1026), LETTERS[seq(from=5, to=10)], rep(2011, times=6), stringsAsFactors = FALSE)
names(df3) <- c("sa3_code", "org_type", "fin_year")


## merge dataframes using Reduce and merge
Reduce(function(x, y) merge(x, y, all=TRUE), list(df1, df2, df3))
