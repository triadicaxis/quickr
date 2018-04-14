library(XML)
url  = "http://finance.yahoo.com/q/op?s=MNTA&m=2011-05"
# extract all tables on the page
tabs = readHTMLTable(url, stringsAsFactors = F)

# locate tables containing call and put information
call_tab = tabs[[11]]
put_tab  = tabs[[15]]

# parse url into html tree
doc = htmlTreeParse(url, useInternalNodes = T)

# find all table nodes with attribute cellpadding = 3
tab_nodes = xpathApply(doc, "//table[@cellpadding = '3']")

# parse the two nodes into tables
tabs = lapply(tab_nodes, readHTMLTable)
names(tabs) = c("calls", "puts")