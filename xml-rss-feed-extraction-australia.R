require(XML)
data <- xmlParse("http://www.tradingeconomics.com/australia/rss")
list1 <- xmlToList(data)

## check the class, the names and length of the root list (list1)
class(list1)
names(list1)
length(list1)

## check the class, the names and length of element1 in list1
class(list1[[1]])
names(list1[[1]])
length(list1[[1]])

## check the length of each element, inside element1 in list1
n <- length(list1[[1]]) ##103
v1 <- vector(mode="numeric", length=n)
for(i in 1:n){
  v1[i] <- length(list1[[1]][[i]])
}

## extract titles
vTitle <- c()
for(i in 5:n){
  vTitle[i] <- list1[[1]][[i]]$title
}

## extract descriptions
vDescr <- c()
for(i in 5:n){
  vDescr[i] <- list1[[1]][[i]]$description
}

## determine if an indicator increased (1), decareased (-1), remained unchanged (0), or none of the above
direction <- ifelse(grepl("in Australia increased", vDescr), "up", 
                  ifelse(grepl("in Australia decreased", vDescr), "down", 
                        ifelse(grepl("in Australia remained unchanged", vDescr), "sideways", NA)))

## determine which indicators showed some direction
location <- (which(!is.na(direction)))
indicator <- vTitle[location]
description <- vDescr[location]

## match the indicators with their direction
tbl1 <- data.frame(as.numeric(location), indicator, direction[!is.na(direction)], description , stringsAsFactors=FALSE)

## determine which indicators showed no direction
locationNA <- (which(is.na(direction)))
indicatorNA <- vTitle[locationNA]
descriptionNA <- vDescr[locationNA]

## match the indicators with their description
tbl2 <- data.frame(as.numeric(locationNA), indicatorNA, direction[is.na(direction)], descriptionNA , stringsAsFactors=FALSE)
