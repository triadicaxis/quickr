## subsetting is essentially filtering data by some criteria
id <- c(1:10)
gender <- c("M", "M", "F", "M", "F", "F", "F", "M", "M", "F")
age <- c(18, 22, 51, 30, 13, 52, 40, 24, 28, 35)
sport <- c("soccer", "hockey", "tenis", "hockey", "soccer", "soccer", "soccer", "soccer", "hockey", "tenis")
height <- c(178.5, 189.2, 181, 172, 175.3, 185.1, 196.3, 167.6, 175.9, 183.4)

df <- data.frame(id, gender, age, sport, height)

# 1. subset dataframe based on variable values
df1 <- df[which(df$gender=="F" & df$age >= 30), ]
df1

# 2. include specified columns
vars <- c("id", "age", "sport")
df2 <- df[vars]
df2

# 3. exclude specified columns
vars <- names(df) %in% c("age", "height")
df3 <- df[!vars]
df3

# another method for including variables with a similar pattern of column labels
names(df) <- c("v1", "v2", "v3", "v4", "v5") # had to change the labels to use this method
vars <- paste("v", 1:3, sep="")
df4 <- df[vars]
df4


