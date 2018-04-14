## useful functions are with(), within() and by()

## http://www.endmemo.com/program/R/with.php
## http://www.statmethods.net/stats/withby.html
## http://rfunction.com/archives/2182

## make some sample data
dat <- data.frame(matrix(rnorm(216), 72, 3),
                  c(rep("A",24), rep("B",24), rep("C",24)), c(rep("J",36), rep("K",36)))

colnames(dat) <- c("v1", "v2", "v3", "dim1", "dim2")

## use with()
with(dat, mean(dat$v1))

## use within()

## use by()
require(stats)
by(warpbreaks[, 1:2], warpbreaks[,"tension"], summary)
by(warpbreaks[, 1],   warpbreaks[, -1],       summary)
by(warpbreaks, warpbreaks[,"tension"], function(x) lm(breaks ~ wool, data = x)
   
   
   
tmp <- with(warpbreaks,
            by(warpbreaks, tension,
               function(x) lm(breaks ~ wool, data = x)))
sapply(tmp, coef)
