# load packages
library(RCurl)
library(XML)
library(stringr)
library(plyr)


### 9.1.10 Retrieving data from APIs ---------------------------

# set local directory
setwd("scenario-apis")

# REST API: Yahoo Weather RSS Feed
# http://developer.yahoo.com/weather/

feed_url <- "http://weather.yahooapis.com/forecastrss"
feed <- getForm(feed_url , .params = list(w = "2422673", u = "c"))
parsed_feed <- xmlParse(feed)

# get current conditions
xpath <- "//yweather:location|//yweather:wind|//yweather:condition"
conditions <- unlist(xpathSApply(parsed_feed, xpath, xmlAttrs))

# get forecast
location <- t(xpathSApply(parsed_feed, "//yweather:location", xmlAttrs))
forecasts <- t(xpathSApply(parsed_feed, "//yweather:forecast", xmlAttrs))
forecast <- merge(location, forecasts)


# get WOEID with Yahoo Places API
#Yahoo ID: rdatacollection
#options(yahooid = "insert string here")
options(yahooid = "v.m4rTvV34GgKVVL5PEAG1uIcHyKfmY8mCJjqSl7Gx3Jkp3s2B14xCc89rQYKOmN8nc.OFbL")

baseurl <- "http://where.yahooapis.com/v1/places.q('%s')"
woeid_url <- sprintf(baseurl, URLencode("Hoboken, NJ, USA")) # careful: URL encoding!
parsed_woeid <- xmlParse((getForm(woeid_url, appid = getOption("yahooid"))))
woeid <- xpathSApply(parsed_woeid, "//*[local-name()='locality1']", xmlAttrs)[2,] # careful: namespaces!


# build wrapper function
getWeather <- function(place = "New York", ask = "current", temp = "c") {
  if (!ask %in% c("current","forecast")) {
    stop("Wrong ask parameter. Choose either 'current' or 'forecast'.")
  }
  if (!temp %in%  c("c", "f")) {
    stop("Wrong temp parameter. Choose either 'c' for Celsius or 'f' for Fahrenheit.")
  }  
  ## get woeid
  base_url <- "http://where.yahooapis.com/v1/places.q('%s')"
  woeid_url <- sprintf(base_url, URLencode(place))
  parsed_woeid <- xmlParse((getForm(woeid_url, appid = getOption("yahooid"))))
  woeid <- xpathSApply(parsed_woeid, "//*[local-name()='locality1']", xmlAttrs)[2,]
  ## get weather feed
  feed_url <- "http://weather.yahooapis.com/forecastrss"
  parsed_feed <- xmlParse(getForm(feed_url, .params = list(w = woeid, u = temp)))
  ## get current conditions
  if (ask == "current") {
    xpath <- "//yweather:location|//yweather:condition"
    conds <- data.frame(t(unlist(xpathSApply(parsed_feed, xpath, xmlAttrs))))
    message(sprintf("The weather in %s, %s, %s is %s. Current temperature is %s°%s.", conds$city, conds$region, conds$country, tolower(conds$text), conds$temp, toupper(temp)))
  }
  ## get forecast	
  if (ask == "forecast") {
    location <- data.frame(t(xpathSApply(parsed_feed, "//yweather:location", xmlAttrs)))
    forecasts <- data.frame(t(xpathSApply(parsed_feed, "//yweather:forecast", xmlAttrs)))
    message(sprintf("Weather forecast for %s, %s, %s:", location$city, location$region, location$country))
    return(forecasts)
  }
}

getWeather(place = "Paris", ask = "current", temp = "c")
getWeather(place = "Moscow", ask = "current", temp = "c")
getWeather(place = "Bern", ask = "forecast", temp = "c")

