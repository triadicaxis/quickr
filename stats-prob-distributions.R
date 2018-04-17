## all statistics relies on probability distributions, so let's look at NORMAL, BINOMIAL

## NORMAL:

rnorm(10) ## draw 10 random numbers from standard normal distribution
rnorm(10, mean=100, sd=20) ## same thing, but non-standard normal distribution

## what is the probability (density) of each random number occuring
x <- rnorm(10)
dnorm(x)

## visualise the probability (density) with ggplot2
require(ggplot2)

v1 <- rnorm(1000)
prob.v1 <- dnorm(v1)
df1 <- data.frame(x=v1, y=prob.v1)
ggplot(df1) + aes(x=x, y=y) + geom_point() + labs(x="Random variable", y="Probability density")

## probability distribution of a random number = cumulative probability of observing that number or smaller (i.e. left tail)

## example 1. generate 10 random numbers and estimate their probability of occuring (i.e. left tail)
x <- rnorm(10)
pnorm(x)

## example 2. what is the probability of observing numbers lower than -2, 0, 2 drawn from a standard normal distribution (i.e. left tail)
x <- c(-2, 0, 2) 
pnorm(x) ## since this is standard normal, -2 and 2 are located two standard deviations from the mean of 0

## example 3. what is the probability of observing a number between -3 and 0 drawn from a standard normal distribution (i.e. left tail)
pnorm(0) - pnorm(-3) ## slightly less than 50%

## BINOMIAL:

## binomial = a series of trials where the result can be either success of failure
rbinom(n=1, size=10, prob=0.4) ## gives No. of successes for 1 trial where 10 observations are drawn randomly (10 obs in total)
rbinom(n=5, size=10, prob=0.4) ## gives No. of successes for 5 trials with 10 observations each, drawn randomly (50 obs in total)

rbinom(n=1, size=1, prob=0.4) ## reduces to a Bernouli random variable, 1 trial, y/n
rbinom(n=5, size=1, prob=0.4) ## reduces to a Bernouli random variable, 5 trials, y/n
rbinom(n=10, size=1, prob=0.4) ## reduces to a Bernouli random variable, 10 trials, y/n

## visualise the binomial distribution
v2 <- rbinom(n=1000, size=10, prob=0.3)
df2 <- data.frame(success=v2)
ggplot(df2, aes(x=success)) + geom_histogram(binwidth=1)

