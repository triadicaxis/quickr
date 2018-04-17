## with lets you perform calculations using elements from various columns

id <- c(1:10)
name <- c("Joe", "Bill", "Alice", "Charlie", "Amanda", "Bryony", "Felicity", "Hal", "Ben", "Sophia")
gender <- c("M", "M", "F", "M", "F", "F", "F", "M", "M", "F")
age <- c(18, 22, 51, 30, 13, 52, 40, 24, NA, 35)
sport <- c("soccer", "hockey", "tenis", "hockey", "soccer", NA, "soccer", "soccer", "hockey", "tenis")
height <- c(178.5, 189.2, NA, 172, 175.3, 185.1, 196.3, 167.6, 175.9, 183.4)

df <- data.frame(id, name, gender, age, sport, height, stringsAsFactors = FALSE)

## divide height by age (silly thing to do, but it's just a demo)
with(df, height/age)

## step 1. build a function to give the average age of females and their average height
FUN1 <- function(df){
      c(FUN2 = with(df, sum(height)/sum(age)))
}

## step 2. use plyr to perform the calculations
require(plyr)
df2 <- ddply(df, .variables="name", FUN1)
