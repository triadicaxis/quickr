browseURL("https://www.youtube.com/watch?v=TPLMQnGw0Vk")
browseURL("http://blog.rstudio.org/2014/11/24/rvest-easy-web-scraping-with-r/")
vignette("selectorgadget")

library("rvest")
absweb <- html("http://www.abs.gov.au/AUSSTATS/abs@.nsf/mf/1345.0?")
rbaweb <- html("http://www.rba.gov.au/statistics/cash-rate/")

## 1. extract indicator names (column 1)
indicator <- html_nodes(absweb, "table:nth-child(2) td:nth-child(1) font")
indicator <- html_text(indicator)

## 2. extract source cat. no. (column 2)
catno <- html_nodes(absweb, "u font, tr:nth-child(33) font, tr:nth-child(35) font")
catno <- html_text(catno)

var1 <- html_nodes(rbaweb, "td , th, #table_1 #table_1")
var1 <- html_text(var1)

cashrate.change <- html_nodes(rbaweb, "td:nth-child(2)")
cashrate.change
