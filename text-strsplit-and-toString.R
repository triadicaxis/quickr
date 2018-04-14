## text merge with toString()

x <- c("Green", "Red", "Black")
x

## Test it
toString(x)
toString(x, width=5)

## text split with strsplit()
## strsplit() function splits the elements of a character vector y into substrings 
## according to the matches to substring split within them.

## Example 1
y <- "r tutorial"
y <- strsplit(y, NULL)
unlist(y)

## Example 2
z <- "r tutorial"
z <- strsplit(z, "t")
unlist(z)