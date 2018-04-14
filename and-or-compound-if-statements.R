## compound statements: if A and B are both TRUE, then do C

## & means AND, where both must be true
## | means OR, where either one must be true
## && means AND, where if the first is false, the other is automatically ignored (don't use with ifelse!)
## || means OR, where if the first is true, the other is automatically ignored (don't use with ifelse!)

v1 <- c(1,1,0,1)
v2 <- c(2,1,0,1)
x <- 1
y <- 2

## Case 1: check if both are true
ifelse(v1==1 & v2==1, "Yes", "No")

# similarly, if x fails, y will still be checked
if (x==0 & y==2){
  print("Hello")
}

## Case 2: check if either one is true
ifelse(v1==1 | v2==1, "Yes", "No")

# similarly, if x fails, y will still be checked
if (x==0 | y==2){
  print("Hello")
}

## Case 3: if the first fails, don't bother checking the others (don't use with ifelse!)
if (x==0 && y==2){
  print("Hello")
}

## Case 4: if the first succeeds, don't bother checking the others (don't use with ifelse!)
if (x==0 || y==2){
  print("Hello")
}