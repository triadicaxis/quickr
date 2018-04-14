## aggregate is like a pivot table: it applies a specified function over a specified subset of data
## notation: aggregate(formula, data, FUN=mean, na.rm=TRUE)
## formula format: y ~ x1 + x2 + .. + xn, where x is a categorical variable

gender <- c("M", "M", "M", "M", "F", "F", "F", "M", "F", "F", "M", "F")
age <- c(18, 22, 51, 30, 13, 52, 40, 24, 28, 35, NA, 29)
sport <- c("soccer", "hockey", "tenis", "hockey", "soccer", "soccer", "soccer", "NA", "hockey", "tenis", "hockey", "soccer")
height <- c(183.5, 189.2, 163.1, NA, 175.3, 168.1, 178.3, 197.6, 175.9, 170.2, 182.3, 160.0)

df <- data.frame(gender, age, sport, height)
df

## example 1: calculate the average height by gender y=f(x)
aggregate(height ~ gender, df, FUN=mean, na.rm=TRUE)

## example 2: calculate the average height by gender, by sport y=f(x1, x2)
aggregate(height ~ gender + sport, df, FUN=mean, na.rm=TRUE) # na.rm=TRUE only removes NAs from the y variable

## example 3: calculate the average height and average age by gender y1, y2 = f(x)
aggregate(cbind(height, age) ~ gender, df, mean) # FUN= and na.rm=TRUE are optional in all cases

## example 4: calculate the average height and average age by gender, by sport y1, y2 = f(x1, x2)
aggregate(cbind(height, age) ~ gender + sport, df, mean)

## example 5: calculate the average height and standard deviation of height by gender, each() requires plyr
library(plyr)
aggregate(height ~ gender, df, each(mean, sd))
