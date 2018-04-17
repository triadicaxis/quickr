## create a vector by generating a sequence
seq(from=1, to=7, by=.5)

## create a vector by repeating a sequence
rep(1:3, times=5)

## combine the seq and rep functions
rep(seq(from=1, to=7, by=.5), times=5) 
rep(c("male", "female"), times=5)