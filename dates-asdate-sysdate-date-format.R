## the as.Date() function is essential
date <- as.Date("2014-06-28")
date2 <- as.Date(c("2014-06-28", "2014-07-15", "2015-02-20"))

## Example 1. number of days between 6/22/07 and 2/13/04 
mydates <- as.Date(c("2007-06-22", "2004-02-13"))
days <- mydates[1] - mydates[2]

## print today's date
today <- Sys.Date()
format(today, format="%B %d %Y")

# convert date info in format 'mm/dd/yyyy'
strDates <- c("01/05/1965", "08/16/1975")
dates <- as.Date(strDates, "%m/%d/%Y")

## how many days before my next holiday
today <- Sys.Date()
holiday <- as.Date("2015-08-03")
holiday - today

## Date formats:
## %d day as a number
## %a abbreviated weekday
## %A unabbreviated weekday
## %m month as an integer
## %b abbreviated month
## %B unabbreviated month  
## %y 2-digit year
## %Y 4-digit year
