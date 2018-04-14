require(XML)
data <- xmlParse("http://www.tradingeconomics.com/rss/news.aspx")
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

## cbind
tbl <- cbind(vTitle, vDescr)
