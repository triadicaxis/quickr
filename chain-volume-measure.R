rm(list=ls())
## Laspeyres volume measure (CVM)

## chain volume measures value quantities by using prices in a base period which is updated annually. 
## These annually reweighted (rebased) volume change measures are then linked, or "chained" together to produce a time series of chain volume measures.
## chain volume measures must have a reference period or reference year, in which the index equals 100.
## The chain volume measure in the reference period expressed in dollar terms equals the corresponding current price value.
## As with constant price estimates, chain volume indexes can also be expressed in dollar terms by multiplying the index value for the period in question by the current price value in the reference period.
## Updating the reference period results in revisions to the levels of chain volume measures for their entire history. However, re–referencing does not alter growth rates.

################################## Method 1: use the micEcon package (the easy way)
## see http://cran.r-project.org/web/packages/micEcon/micEcon.pdf

library("micEcon")
data(Missong03E7.7)

priceIndex(prices=c("p.beef", "p.veal", "p.pork"), ## 
           quantities=c("q.beef", "q.veal", "q.pork"),
           base=1, 
           data=Missong03E7.7,
           method = "Laspeyres",
           na.rm = FALSE, weights = FALSE)

################################## Method 2: calculate everything manually (the hard way)

rm(list=ls())

## set up vectors and dataframe as per ABS article: Demystifying Chain Volume Measures

Pa <- c(1,2,3) # price of apples over 3 consecutive periods
Po <- c(3,4,5) # price of oranges over 3 consecutive periods
Qa <- c(5,8,13) # qauntity of apples over 3 consecutive periods
Qo <- c(3,5,10) # quantity of oranges over 3 consecutive periods

n <- nrow(df) # total number of periods
t <- c(1:n) # vector of individual periods
ref <- n-2 # the selected reference period

df <- as.data.frame(cbind(t, Pa, Po, Qa, Qo))

################################## the following equations are still in pseudo code

## Step 1. create Laspeyres index

IdxNum <- vector(mode="numeric", length=n)

FUN.Idx <- function(t){
  for(i in 1:n){
    IdxNum[i] <- Pa[t[i-1]]*Qa[t[i]]
  }
}


sum (Pa[t[i-1]]*Qa[t[i]]) 

/ 
  
sum (Pa[t[i-1]]*Qa[t[i-1]]

## suppose that x is a vector of CVM for apples

x <- vector(mode="numeric", length=n)

## if t < ref, then FUN1
FUN1 <- function(t){
  Pa[ref] * Qa[ref] * (Pa[t[i-1]]*Qa[t[i]]) / (Pa[t[i-1]]*Qa[t[i-1]])
}

FUN1(t[1:3])


## if t == ref, then FUN2
FUN2 <- function(t){
  Pa[ref] * Qa[ref]
}

FUN2(t)

## if t > ref, then FUN3
FUN3 <- function(t){
  Pa[ref] * Qa[ref] * ( (Pa[t[i-1]]*Qa[t[i]]) / (Pa[t[i-1]]*Qa[t[i-1]]) ) ** -1
}

FUN3(t)

## generate CVM vector for apples
for(i in 1:n){
  if(t[i] < ref){
    x[i] <- FUN1(x) ## applies to range t[1:(ref-1)]
  } else if(t[i] == ref){
    x[i] <- FUN2(x) ## applies to range t[i] == ref
  } else { 
    x[i] <- FUN3(x) ## applies to range t[(ref+1):n]
  }
}

x

################################### end of pseudo code
