## http://gastonsanchez.com/work/webdata/
## http://blog.rstudio.org/2014/11/24/rvest-easy-web-scraping-with-r/

library(rvest)
url <- html("https://en.wikipedia.org/wiki/List_of_tz_database_time_zones")
html_session(url)
