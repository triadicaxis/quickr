## string manipulation: substr(), abbreviate(), which(), grep(), gregexpr(), sapply()
dat <- mtcars
dat$make <- row.names(dat)
row.names(dat) <- NULL

## clip strings to 4 characters
substr(dat$make, start=1, stop=4)

## substr() extract 'bcd' 
substr("abcdef", 2, 4)

## substr() replace 2nd letter with hash symbol 
x = c("may", "the", "force", "be", "with", "you") 
substr(x, 2, 2) <- "#"
x

## substring(), here same as substr()
substring("ABCDEF", 2, 4)

# substring() extract each letter 
substring("ABCDEF", 1:6, 1:6)

## abbreviate strings
abbreviate(dat$make, minlength=5)

## find the longest name
x <- nchar(dat$make)
dat$make[which(x == max(x))]
x[which(x == max(x))] ## position of the longest name

## get all names with "er"
grep(pattern="er", x=dat$make, value=TRUE, ignore.case=TRUE)

## position of all the "e"s
e <- gregexpr(pattern="e", text=dat$make, ignore.case=TRUE)
unlist(e)

## how many "e"s?
e <- gregexpr(pattern="e", text=dat$make, ignore.case=TRUE)
sapply(e, function(x) ifelse(x[1] > 0, length(x), 0))

## convert to upper / lower case
toupper(dat$make)
tolower(dat$make)

