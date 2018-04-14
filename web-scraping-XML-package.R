## Web scraping using the XML package
require(XML)

url1 <- "http://en.wikipedia.org/wiki/List_of_countries_by_population_in_2010"
df1 <- readHTMLTable(url1, which=1, header=TRUE, stringsAsFactors=FALSE)

url2 <- "http://en.wikipedia.org/wiki/List_of_countries_by_GDP_(nominal)_per_capita"
df2 <- readHTMLTable(url1, which=1, header=TRUE, stringsAsFactors=FALSE)

## Now view both dataframes
df1
df2