## stitch together text or variables with the paste() function
paste("Hello", "World")
paste("Hello", "World", sep="--")
paste("Hello", c("Joe", "Bill", "Alice"))

## to insert values from variables into sentences, use the sprintf() function
person <- "Joe"
size <- 8
time <- 3

sprintf("Hello %s, your party of %s will be seated in %s minutes.", person, size, time)
# the wildcard is %s