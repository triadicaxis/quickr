setwd("C:/")

## Full options, don't run

list.files(path = ".", pattern = "*.csv", all.files = T, full.names = T, recursive = T, include.dirs = F)
list.dirs(path = ".", full.names = T, recursive = T)
file.copy(from = home, to = backup, recursive = T, overwrite = F, copy.mode = T, copy.date = T)
file.info(path = ".", extra_cols = T)

## Example:
paths <- dir(getwd(), full.names=TRUE)
df <- file.info(paths)
View(df)

## Example:
file.info(paths)$ctime
substr(file.info(paths)$ctime, 1, 10)

## Example:
f <- list.files(path = ".", pattern = "*.csv", full.names = F, recursive = F, include.dirs = F)
f <- gsub("*.xls*", "_", f)
paste(substr(file.info(paths)$ctime, 1, 10), f, sep = "_")
