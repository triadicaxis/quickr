s <- "ID=MIMAT0027618;Alias=MIMAT0027618;Name=hsa-miR-6859-5p;Derives_from=MI0022705"

## Method 1: strsplit with matrix Try this:
matrix(strsplit(s, "[;=]")[[1]], 2)[2,]

## Method 2: strsplit with gsub or this use of strsplit with gsub:
strsplit(gsub("[^=;]+=", "", s), ";")[[1]]
    
## Method 3: strsplit with sub or this use of strsplit with sub:
sub(".*=", "", strsplit(s, ";")[[1]])

## Method 4: strapplyc or this which extracts consecutive non-semicolons after equal signs:
library(gsubfn)
strapplyc(s, "=([^;]+)", simplify = unlist)