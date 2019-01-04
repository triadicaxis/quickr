## seq(from = 1, to, by = 1)
seq(9) ## 9 numbers default from = 1, to = 9
seq(9, 0) ## 9 numbers from = 9, to = 0
seq(from=9, to=2, by=-.5) ## use explicit syntax

## runif(n, min = 0, max = 1)
runif(9) ## 9 numbers default min = 0, max = 1
runif(9, 10, 15) ## 9 numbers between 10 and 15
ceiling(runif(9, 10, 15)) ## 9 numbers between 10 and 15 rounded up to nearest integer
ceiling(runif(n=9, min=10, max=15)) ## use explicit syntax

## rep(x, times = 1)
rep(3)
rep(3, 5) ## replicate 3 five times
rep(x=3, times=5) ## use explicit syntax

## combining the above
rep(seq(from=9, to=0, by=-.5), times=5)
rep(runif(n=9, min=10, max=15), times=2)
