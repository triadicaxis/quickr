## Extract all numbers from the character vector
x <- c("2.11abc.def","a.b-15.1cde",".562342rfg", "abcdef")

## Method 1: use gsubfn package
library(gsubfn)
getNumberPart <- function(x) {
  pat <- "(-?(\\d*\\.*\\d+|\\d+\\.))"
  strapply(x, pattern=pat, FUN=as.numeric, simplify=TRUE, empty=NA)
}

getNumberPart(x)

## Method 2: use stringr package
x <- c("2.11abc.def","a.b-15.1cde",".562342rfg", "abcdef")

library(stringr)
x1 <- str_extract(x, "[[:digit:]]+\\.*[[:digit:]]*")
x2 <- as.numeric(str_extract_all(x,"\\(?[0-9,.]+\\)?")[[1]])
x3 <- str_extract(x, "[0-9]+")
x5 <- regmatches(x,regexpr("[0-9]+",x))
x6 <- regmatches(x,regexpr("\\(?[0-9,.]+\\)?",x))

## Method 3. use base R, no packages required
x <- c("2.11abc.def","a.b-15.1cde",".562342rfg", "abcdef")
x7 <- unlist(regmatches(x, gregexpr('\\(?[0-9,.]+', x)))
x7 <- as.numeric(gsub('\\(', '-', gsub(',', '', x)))

# pattern is by finding a set of numbers in the start and capturing them
as.numeric(gsub("([0-9]+).*$", "\\1", years))


# pattern is to just remove _years_old
as.numeric(gsub(" years old", "", years))


# or split by space, get the element in first index
as.numeric(sapply(strsplit(years, " "), "[[", 1))

# pattern is to just remove _years_old
as.numeric(gsub(" years old", "", years))


# or split by space, get the element in first index
as.numeric(sapply(strsplit(years, " "), "[[", 1))

x <- c('Ab_Cd-001234.txt','Ab_Cd-001234.txt')
sub('.*-([0-9]+).*','\\1',x)

## use stringr, the regular expressions package
## library(stringr)
# library(stringr)
# x1 <- str_extract(vDescr[5], "[[:digit:]]+\\.*[[:digit:]]*")
# x2 <- str_extract_all(vDescr[5],"\\(?[0-9,.]+\\)?")[[1]]
# x3 <- sub('.*-([0-9]+).*','\\1',vDescr)


# x4 <- gsub("[^0-9]", "", vDescr[5])
# x1 <- str_extract(vDescr[5], "[[:digit:]]+\\.*[[:digit:]]*")
# x2 <- as.numeric(str_extract_all(vDescr[5],"\\(?[0-9,.]+\\)?")[[1]])
# x3 <- str_extract(vDescr[5], "[0-9]+")
# x5 <- regmatches(vDescr[5],regexpr("[0-9]+",vDescr[5]))
# x6 <- regmatches(vDescr[5],regexpr("\\(?[0-9,.]+\\)?",vDescr[5]))

# base R, stringr not required:
# x <- unlist(regmatches(vDescr[5], gregexpr('\\(?[0-9,.]+', vDescr[5])))
# x <- as.numeric(gsub('\\(', '-', gsub(',', '', x)))


#magnitude <- ifelse(direction=="+", grepl("increased .. [:digit:]"),  [:digit:]
#                   ifelse(direction=="-", grepl("decreased .. [:digit:]"), [:digit:] 
#                         ifelse(direction=="steady", grepl("remained unchanged .. [:digit:]", NA))))

