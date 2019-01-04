## source: https://www.youtube.com/watch?v=i2VH5jIL76Y

## function can iterate over every element of a vector or dataframe
## function structure: inputs > function() > outputs
## function syntax: 

# FUN <- function(INPUTS) {
#   OUTPUT 1 <- expression 1 involving INPUTS
#   OUTPUT 2 <- expression 2 involving INPUTS
#   OUTPUT n <- expression n involving INPUTS
#   return(OUTPUTS)
# }

## note that an expression always evaluates to a single value

##################################################################################

## examnple 1: number cubed, 1 input, 1 output

FUN1 <- function(x){
  out <- x^3
  return(out)
}

FUN1(3) ## input is a single number
FUN1(seq(5)) ## input is a vector
FUN1(mtcars) ## input is a dataframe

##################################################################################

## examnple 2: number squared and cubed, 1 input, 2 outputs

FUN2 <- function(x){
  out1 <- x^2
  out2 <- x^3
  return(c(squared = out1, cubed = out2))
}

FUN2(3) ## input is a single number, outputs in a named vector

##################################################################################

## examnple 3: number squared and cubed, 1 input, 2 outputs as list

FUN3 <- function(x){
  out1 <- x^2
  out2 <- x^3
  return(list(squared = out1, cubed = out2))
}

FUN3(seq(5)) ## input is a vector, outputs in a named list
FUN3(mtcars) ## input is a dataframe, outputs in a named list

##################################################################################

## examnple 4: number squared and cubed, 1 input, 2 outputs as dataframe

FUN4 <- function(x){
  out1 <- x^2
  out2 <- x^3
  return(data.frame(squared = out1, cubed = out2))
}

FUN4(seq(5)) ## input is a vector, outputs in a dataframe
FUN4(mtcars) ## input is a dataframe, outputs in a dataframe

##################################################################################

## examnple 5: generate a graph, 1 input, 1 output, return plot()

GRAPH <- function(x){
  out <- x^3
  return(plot(x, out, xlab = "Number", ylab = "Cubed"))
}

GRAPH(seq(15))

##################################################################################

## examnple 6: number to the power of another number, 2 inputs, 2 outputs as dataframe

FUN6 <- function(x, y){
  out1 <- x*y
  out2 <- x^y
  return(data.frame(multiple = out1, exponent = out2))
}

FUN6(x = 3, y = 4) ## inputs are both single numbers, outputs in a dataframe
FUN6(x = seq(5), y = 3) ## input x is a vector, input y is a single number, outputs in a dataframe
FUN6(x = seq(5), y = runif(5)) ## inputs are vectors, outputs in a dataframe
FUN6(x = mtcars, y = mtcars) ## inputs are dataframes, outputs in a dataframe

##################################################################################

## examnple 7: number to the power of another number, 2 inputs, 2 outputs, return plot()

GRAPH2 <- function(x, y){
  out1 <- x*y
  out2 <- x^y
  return(plot(c(x, y), c(out1, out2), xlab = "Number", ylab = "Result"))
}

GRAPH2(x = 3, y = 4) ## x and y must have equal length
GRAPH2(x = seq(5), y = runif(5)) ## x and y must have equal length
