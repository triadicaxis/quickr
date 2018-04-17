## The PLYR package is a tool for doing split-apply-combine (SAC) procedures:
## plyr splits data in any structure according to some variable, operates on each part separately and the recombines them
## generic format: ddply(x, .variables="v1", FUN)

## http://www.r-bloggers.com/a-fast-intro-to-plyr-for-r/

## make some sample data
dat <- data.frame(matrix(rnorm(216), 72, 3),
                  c(rep("A",24),rep("B",24), rep("C",24)),c(rep("J",36), rep("K",36)))

colnames(dat) <- c("v1", "v2", "v3", "dim1", "dim2")

## example 1. perform an operation on v1 to test, ddply() goes from dataframe to dataframe, which is most common
library("plyr")
ddply(dat, c("dim1","dim2"), function(df)mean(df$v1))

## example 2. perform many operations on each split
ddply(dat, c("dim1","dim2"), function(df)c(mean(df$v1),
                                           mean(df$v2),
                                           mean(df$v3),
                                           sd(df$v1),
                                           sd(df$v2),
                                           sd(df$v3)))

##  example 3. llply() from list to list
## very similar to lapply(dat, FUN)
llply(lst, FUN) 

## example 4. laply() from list to array
## very similar to sapply(dat, FUN)
laply(lst, FUN)

## example 5: useful function each() requires plyr
aggregate(height ~ gender, df, each(mean, sd))

## example 6: useful functions colwise() or numcolwise(), requires plyr
numcolwise(mean, na.rm=TRUE)(dat)
