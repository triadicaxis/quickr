# load packages
library(RCurl)
library(XML)
library(stringr)
library(plyr)


### 9.1.4 Convenient functions to gather links, lists and tables from HTML documents ------------

# set local directory
setwd("scenario-xmlconvenience")

# parse document
mac_url    <- "http://en.wikipedia.org/wiki/Machiavelli"
mac_source <- readLines(mac_url, encoding = "UTF-8")
mac_parsed <- htmlParse(mac_source, encoding = "UTF-8")
mac_node   <- mac_parsed["//p"][[1]]

# getHTMLLinks()
getHTMLLinks(mac_url)[1:3]
getHTMLLinks(mac_source)[1:3]
getHTMLLinks(mac_parsed)[1:3]
getHTMLLinks(mac_node)[1:3]

# getHTMLLinks() with XPath expression
getHTMLLinks(mac_source, xpQuery = "//a[@class='extiw']/@href")[1:3]

# getHTMLExternalFiles()
xpath <- "//img[contains(@src, 'Machiavelli')]/@src"
getHTMLExternalFiles(mac_source, xpQuery = xpath)[1:3]

# readHTMLList()
readHTMLList(mac_source)
readHTMLList(mac_source)[[10]][1:3]

# readHTMLTable()
names(readHTMLTable(mac_source))
readHTMLTable(mac_source)$persondata
readHTMLTable(mac_source, stringsAsFactors = F)[[1]][7:8,1]

# modify readHTMLTable()
influential <- readHTMLTable(mac_source,
                             elFun = getHTMLLinks, stringsAsFactors = FALSE)[[1]][7,]
as.character(influential)[1:3]

influenced <- readHTMLTable(mac_source,
                            elFun = getHTMLLinks, stringsAsFactors = FALSE)[[1]][8,]
as.character(influenced)[1:3]