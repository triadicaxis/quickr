## https://www.youtube.com/watch?v=7J_wS1uEt50
## Example 1. assume that var1 in df is a scale 1:10, we want to create three arbitrary categories: Low (0:4), Medium (5:6), High (7:10)

var1.dummy <- cut(df$var1, br=c(0, 4, 6, 10), labels=("Low", "Medium", "High"))

## regress var3 on var2.dummy
reg1 <- lm(var3.chg ~ var2, data=df)
summary(reg1)

## save the expected values as a new vector
expected1 <- reg1$fitted

## look at High rows only
subset(df, var1.dummy=="High")

tapply(reg1$fitted, list(var1.dummy), mean)


## Example 2. assume that var2 in df is a dichotomous var with 0 or 1
## regress var3 on var2.dummy

reg2 <- lm(var3.chg ~ var2, data=df)
summary(reg2)

## save the expected values as a new vector
expected2 <- reg2$fitted

## look at rows where var2=1
subset(df, var2==1)
