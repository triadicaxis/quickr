## NaN, NA and NULL are the missing value types in R
## NaN is not a number, NA is a missing value, while NULL is the absence of anything

v1 <- c(1, 2, NaN, 8, 3, NaN, 3)
v2 <- c("Joe", NA, "Bill")
v3 <- c(1, NULL, 3)
v4 <- c("Alice", "Pat", NA)
df <- data.frame(v2, v4)
x <- NULL

## Check if elements are missing
v1
is.nan(v1)

v2
!is.na(v2)

df
any(is.na(df))

## Ignore or remove missing elements
v1[!is.nan(v1)]
v2[!is.na(v2)]
sum(v1, na.rm=TRUE) # works even for NaN!
  
## Check if there are element gaps in the vector
v3
is.null(v3) # NULL is not detected in a vector!

x
is.null(x) # but NULL is detected in a single value object