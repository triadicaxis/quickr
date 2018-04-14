## more lubridate functions
library(lubridate)
ymd(20110630)
ymd_hms(20110630213001)
ymd_hms("2011-06-04 21:30:02", tz = "Pacific/Auckland")

ss <- sprintf("%02.0f", c(0:59))
mm <- sprintf("%02.0f", c(0:59))
hh <- sprintf("%02.0f", c(0:23))
a <- paste("20151121", hh[4], mm[29], ss[8], sep="")
a

## increment time from now by 1 minute increments
now <- Sys.time()
tseq <- seq(now, length.out = 60, by = "mins")
length(tseq)
tseq

## increment time from now by 1 second increments
now <- Sys.time()
tseq <- seq(now, length.out = 12, by = "secs")
length(tseq)
tseq

## divide the interval from 0 to 1 into 20 small increments
seq(from=0, to=1, length.out=20)

## generate a sequence of letters
LETTERS[seq(from=1, to=10 )]
letters[seq(from=1, to=10 )]
month.name[1:12]

## eg 1. paste together letters and numbers, useful for variable name generation
num <- seq(from=1, to=12)
char <- letters[seq(from=1, to=12)]
paste(num, char, sep="")

## eg 2. paste together letters and numbers, useful for variable name generation
x <- c("a", "b", "c")
y <- c(1:5)
df <- expand.grid(x, y) ## very useful for finding all possible combinations!
vec <- paste(df$Var1, df$Var2, sep="")
sort(vec) ## for descending order, set decreasing=TRUE

## eg 3. a useful case
## http://stackoverflow.com/questions/14620972/how-to-combine-two-vectors-into-a-data-frame
x <- c(1,2,3)
y <- c(100,200,300)
x_name <- "cond"
y_name <- "rating"

require(reshape2)
df <- melt(data.frame(x,y))
colnames(df) <- c(x_name, y_name)
print(df)
