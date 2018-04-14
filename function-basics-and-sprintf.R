rm(list=ls())

## Hello world function with no required arguments
say.hello <- function(){
  print("Hello world")
}
## Then call the function
say.hello()

## sprintf function for creating strings with %s
sprintf("Hello %s", "Stan")
sprintf("Hello %s, today's date is %s", "Stan", Sys.Date())

## create a function that takes one argument, name.
## First create the function
hello.person <- function(name){
  print(sprintf("Hello %s", name))
}
## Then call the function and specify the required argument
hello.person("Stan")

## Create a function that takes two arguments, first name and last name
hello.you <- function(firstName, lastName){
  print(sprintf("Hello %s %s", firstName, lastName))
}
## Now call the newly created hello.you function
hello.you("Martina", "Bucifal")
## Can also call it and specify the argument names in ANY order
hello.you(lastName="Bucifal", firstName="Martina")

## Create a function that contains a default argument, which can be left unspecified
hello.there <- function(firstName, lastName="Bucifal"){
  print(sprintf("Hello %s %s", firstName, lastName))
}
## Now call the function and specify Martina Radilova
hello.there("Martina", "Radilova")
## Now call the function and only specify Martina
hello.there("Martina")

## Add the catch-all argument ...
just.hello <- function(firstName, lastName="Bucifal", ...){
  print(sprintf("Hello %s %s", firstName, lastName))
}

## Now call the function and try to specify extra arguments 
just.hello("Martina", "Radilova", "Goodbye") # the extra argument is simply ignored