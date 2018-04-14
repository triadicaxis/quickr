## create two dataframes with a common variable

id1 <- seq(from=1, to=12, by=1)
gender <- c("M", "M", "M", "M", "F", "F", "F", "M", "F", "F", "M", "F")
age <- c(18, 22, 51, 30, 13, 52, 40, 24, 28, 35, NA, 29)
sport <- c("soccer", "hockey", "tenis", "hockey", "soccer", "soccer", "soccer", "NA", "hockey", "tenis", "hockey", "soccer")
height <- c(183.5, 189.2, 163.1, NA, 175.3, 168.1, 178.3, 197.6, 175.9, 170.2, 182.3, 160.0)

df1 <- data.frame(id1, gender, age, sport, height, stringsAsFactors=FALSE) ## strings must be character!
df1

id2 <- seq(from=1, to=12, by=1) 
name <- c("Bill", "Joe", "Adam", "Charlie", "Alice", "Felicity", "Jodi", "Ben", "Sophia", "Louise", "Hal", "Bryony")
status <- c("single", "single", "divorced", "married", "single", "married", NA, "single", "married", "married", "divorced", "single")
children <- c(0, 0, 3, 1, 0, 4, 2, 1, 0, 2, 2, 0)

df2 <- data.frame(id2, name, status, children, stringsAsFactors=FALSE) ## strings must be character!
df2

## use the merge function
mergedDf <- merge(x=df1, y=df2, by.x="id1", by.y="id2") ## by.x and by.y can have different column names, here id1 and id2

## alternatively, use the join() function from the plyr package (faster!)
## However, the common columns must have the same name. So we must rename id1 and id2 first.
require(plyr)
df1 <- rename(df1, c(id1="id2")) # rename id1 in df1 to id2
joinedDf <- join(x=df1, y=df2, by="id2")

## Now see that df1 id1 column has been changed to id2, and that joinedDf is identical to mergedDf
df1
joinedDf == mergedDf
