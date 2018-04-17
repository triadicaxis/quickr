## printing methods: print(), as.character(), cat(), paste(), noquote(), toString()

## data
dat <- mtcars
dat$make <- row.names(dat)
row.names(dat) <- NULL

## paste() to generate names
v <- paste("file", 1:6, sep="")
paste(v, "txt", sep=".")

## paste() with collapsing
paste(1:3, c("!", "?", "+"), sep = "", collapse = "")

## paste() without collapsing
paste(1:3, c("!", "?", "+"), sep = "")

## noquote() to unquote strings
my_string <- paste(1:3, c("!", "?", "+"), sep = "")
noquote(my_string)

## cat() to concatenate strings, then print to a file
cat(1:10, sep = "-")
cat(1:10, "with R", file = "output.txt") ## default separator is space

## format() with use of 'nsmall'
format(13.7, nsmall = 3)

## format() with use of 'digits'
format(c(6, 13.1), digits = 2)

## format() justify options
format(c("A", "BB", "CCC"), width = 5, justify = "centre")
format(c("A", "BB", "CCC"), width = 5, justify = "left")
format(c("A", "BB", "CCC"), width = 5, justify = "none")

## format() with 1000s separator
format(123456789, big.mark = ",")

## sprintf() '%f' indicates 'fixed point' decimal notation
sprintf("%f", pi)
sprintf("%.3f", pi)
sprintf("%1.0f", pi)
sprintf("%5.1f", pi)
sprintf("%05.1f", pi)
sprintf("%02.0f", pi) ## useful for hh mm ss in lubridate!
sprintf("%+f", pi)
sprintf("%e", pi)
sprintf("%E", pi)
sprintf("%g", pi) ## default is six decimals

## example:
mm <- ss <- seq(from=0, to=59, by=1); hh <- seq(from=0, to=23, by=1)

ss<- sprintf("%02.0f", ss)
mm <- sprintf("%02.0f", mm)
hh <- sprintf("%02.0f", hh)
t1 <- paste("20151121", hh[4], mm[29], ss[8], sep="")

lubridate::ymd_hms(t1)
