## Sources:
## http://stackoverflow.com/questions/4723424/how-do-i-combine-two-vectors-of-different-length-in-r
## http://stackoverflow.com/questions/15303283/how-to-do-vlookup-and-fill-down-like-in-excel-in-r
## https://ryouready.wordpress.com/2009/01/23/r-combining-vectors-or-data-frames-of-unequal-length-into-one-data-frame/
## http://stackoverflow.com/questions/15799964/which-on-two-vectors-of-unequal-length
## http://stackoverflow.com/questions/1169248/r-function-for-testing-if-a-vector-contains-a-given-element

## %in% returns a logical vector of the same length as x, wherever x has the same values as y
x %in% y

## match returns the index positions of first matching values of y in x, otherwise NA
match(x, y, nomatch=NA)

## which gives the index positions of matching values of y in x, and can also be used for arrays
which(x %in% y, arr.ind = FALSE, useNames = TRUE)

## merge two dataframes x and y by common columns or row names
merge(x, y, by.x = 1, by.y = 1, all = TRUE)


## example 1.
## Task: Create a dataframe of all ISIC Codes and Industries at the 2-digit level.
## Here isic is a dataframe with all possible industry codes at all digit levels. We only want the 2 digit codes.

x <- grepl("^[0-9]{2}$", isic$Code) ## returns logical vector of length(isic) wherever it finds 2 digits in Code
df <- subset(isic, x, select=c(Code, Industry)) ## applies x to isic and selects columns Code & Industry from it


## example 2.
## Task: Extract the 2012 values for all ISIC Codes occuring in a dataframe in that year. Sort them from highest to lowest.
## Here dat is a dataframe with a column named Year, Code and Value. We want all the values for 2012.
## Also isic$Code = full list of ISIC codes and dat$Code = only ISIC codes occuring in the data.

df <- dat[grep("2012", dat$Year), ] ## filters dat by year 2012
x <- isic$Code %in% df$Code ## matches industry codes found df against those in isic (logical, length(isic))
vec <- ifelse(x, df$Value, NA) ## finds corresponding values in column Value in df

## example 3.
## Task: Filter Australian wage data for years 2012 onwards

df <- dat[dat$Country %in% "AUS" & dat$Var %in% "WAGE" & dat$Year >= 2012, ] ## excludes NAs
## alternatively df <- dat[dat$Country == "AUS" & dat$var == "WAGE" & dat$Year >= 2012, ] ## includes NAs
df <- df[grep("^[D][0-9]{2}$", df$Code), ] ## filters out 2-digit level, (Codes in dat are preceded by "D" eg. D08)
df$Code <- gsub("D", "", df$Code) ## removes the "D" from industry codes (global substitution)
df <- df[order(df$Year, df$Code), ] ## sorts results by Year then by Code, in ascending order
