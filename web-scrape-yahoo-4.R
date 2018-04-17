library(XML)


url = "https://au.finance.yahoo.com/q/hp?s=DJIA"
# extract all tables on the page
tabs = readHTMLTable(url, stringsAsFactors = F)

# locate tables containing call and put information
call_tab = tabs[[11]]
put_tab  = tabs[[15]]

# parse url into html tree
doc = htmlTreeParse(url, useInternalNodes = T)