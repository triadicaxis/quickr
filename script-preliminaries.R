#!/usr/bin/env Rscript

## alternatively #!/usr/bin/Rscript
## command line invocation for both versions: ./script.r
## to make the file executable: chmod 755 shebang.r

##############################################
## Project: <Project>
## Title: <Title>
## Author: <Name>, <Phone>, <Email>
## Date: <dd/mm/yyyy>
## File: <x of y>
## Version: <x.x>

## Sources:
## <url1>
## <url2>
##############################################

## clear memory and set up working directories
rm(list=ls())
home <- "C:/Documents/MyProject" ## path to home directory
src <- paste(home, "/Data", sep="") ## data source directory
dest <- paste(home, "/Results", sep="") ## results destination directory
scri <- paste(home, "/Scripts", sep="") ## R scripts directory

## read data
setwd(src)
dat <- read.table("stani4.csv", header=TRUE, sep=",", stringsAsFactors=FALSE) ## don't use name "data", that's a function!
anzsic06 <- read.csv("anzsic06.csv", header=TRUE, quote="", row.names=NULL, stringsAsFactors=FALSE)

## examine data
str(dat) ## also nrow(dat), ncol(dat), dim(dat), NROW(dat), names(dat), rownames(dat), class(dat)
head(dat)
tail(dat)

##############################################

## START HERE

## df <- output of your script

## END HERE

##############################################

## export results to destination directory
setwd(dest)
write.table(df, "<title>-results.csv", sep=",", row.names=FALSE)

## clean up and save
setwd(scri)
keep <- c("home", "src", "dest", "scri", "dat", "df")
rm(list=ls()[!ls() %in% keep])
savehistory(file="<Title> Command History")
save.image("<Title> Workspace Image.RData")
