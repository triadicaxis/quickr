## check entire vectors against conditions with an ifelse function
## similar to IF function in Excel

## Some simple examples
v1 <- c(1,1,0,1,0,0,0,1)

ifelse(v1==1, "Yes", "No")
ifelse(v1==1, v1*3, v1)
ifelse(v1==1, v1*3, "Zero")

## Examples with missing values
v1[2] <- NA

ifelse(v1==1, v1*3, "Zero")
ifelse(is.na(v1), "foo", v1)
ifelse(is.na(v1), 16, v1)