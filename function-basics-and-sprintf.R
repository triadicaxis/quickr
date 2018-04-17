rm(list=ls())

## Hello world function with no required arguments
say.hello <- function(){
  print("Hello world")
}
## Then call the function
say.hello()

## sprintf function for creating strings with %s
sprintf("Hello %s", "Bob")
sprintf("Hello %s, today's date is %s", "Bob", Sys.Date())

## create a function that takes one argument, name.
## First create the function
hello.person <- function(name){
  print(sprintf("Hello %s", name))
}
## Then call the function and specify the required argument
hello.person("Bob")

## Create a function that takes two arguments, first name and last name
hello.you <- function(firstName, lastName){
  print(sprintf("Hello %s %s", firstName, lastName))
}
## Now call the newly created hello.you function
hello.you("Alice", "Smith")
## Can also call it and specify the argument names in ANY order
hello.you(lastName="Smith", firstName="Alice")

## Create a function that contains a default argument, which can be left unspecified
hello.there <- function(firstName, lastName="Smith"){
  print(sprintf("Hello %s %s", firstName, lastName))
}
## Now call the function and specify Alice Jones
hello.there("Alice", "Jones")
## Now call the function and only specify Alice
hello.there("Alice")

## Add the catch-all argument ...
just.hello <- function(firstName, lastName="Smith", ...){
  print(sprintf("Hello %s %s", firstName, lastName))
}

## Now call the function and try to specify extra arguments 
just.hello("Alice", "Jones", "Goodbye") # the extra argument is simply ignored
