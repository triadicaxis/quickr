require(XML)
require(stringr)

url <- "http://www.loc.gov/rr/print/list/057_chron.html"

## the which argument specifies the table number to get
tbl <- readHTMLTable(url, which=3, as.data.frame=TRUE, skip.rows=1, header=TRUE, stringsAsFactors=FALSE)
tbl <- tbl[1:64, ]

## use stringr, the regular expressions package
dfYear <- str_split(string=tbl$YEAR, pattern="-")

## now use the rbind(), reduce() and data.frame() functions
dfYear <- data.frame(Reduce(rbind, dfYear))
names(dfYear) <- c("Start", "End")
dfYear

dfPres <- cbind(tbl$PRESIDENT, dfYear)
dfPres

## add a column for the duration of president's tenure
v1 <- dfYear$Start <- as.numeric(as.character(dfYear$Start))
v2 <- dfYear$End <- as.numeric(as.character(dfYear$End))
duration <- v2 - v1
dfPres <- cbind(dfPres, duration)

## sort in descending order by duration of tenure
dfPres[order(-dfPres[,4], dfPres[,1]), ]