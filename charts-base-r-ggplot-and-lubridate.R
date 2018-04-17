## http://www.inside-r.org/r-doc/graphics/par
## https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/barplot.html
## http://rfunction.com/archives/1783
## https://thomaslevine.com/!/r-curses-for-data-witches/
## http://www.stat.ubc.ca/~jenny/STAT545A/block14_colors.html
## http://www.r-bloggers.com/what-a-nice-looking-scatterplot/
## http://www.statmethods.net/graphs/scatterplot.html
## http://www.statmethods.net/advgraphs/axes.html
## http://www.statmethods.net/advgraphs/parameters.html
## http://rstudio-pubs-static.s3.amazonaws.com/7953_4e3efd5b9415444ca065b1167862c349.html
## http://www.harding.edu/fmccown/r/

####################################################################

## show sample datasets included in base R
data()

## read and check data
rm(list=ls())
dat <- mtcars
str(dat)
head(dat)

####################################################################
# EASD colour scheme
#
# Primary colours
# 1. RGB: 41, 43, 103 or #292B67
# 2. RGB: 158, 217, 223 or #9ED9DF
# 3. RGB: 34, 120, 154 or #22789A
# 4. RGB: 188, 191, 193 or #BCBFC1 (Please use for chart lines and ticks)
# 5. RGB: 89, 90, 91 or #595A5B (Please use for chart font)
#
# Secondary colours
# RGB: 86, 180, 223 or #56B4DF
# RGB: 0, 114, 178 or #0072B2
#
#####################################################################

col1 <- "#292B67"
col2 <- "#9ED9DF"
col3 <- "#22789A"
col4 <- "#BCBFC1" ## for chart lines and ticks
col5 <- "#595A5B" ## for chart font
col6 <- "#56B4DF"
col7 <- "#0072B2"

####################################################################

## Example 1. SCATTERPLOT with base package

x <- dat$wt
y <- dat$mpg

## first set all the graphical parameters for every chart in the session, format is: par(optionname=value, optionname=value, ...)
par() ## show default parameters, BTW: par(opar) restores original settings
par(cex=.9, cex.axis=.9, cex.lab=.9, cex.main=1) ## font sizes, relative to default
par(pch=1, tck=0.02) ## set marker type, and ticks to be inside
par(lty=1, lwd=.8) ## set line type and width, relative to default

## now build up a nice scatter plot in base R
plot(x, y)
plot(y ~ x, data=dat)
plot(y ~ x, data=dat, main="Chart Title")
plot(y ~ x, data=dat, main="MT Cars", xlab="Car Weight", ylab="Miles per Gallon", frame.plot=FALSE)
plot(y ~ x, data=dat, main="MT Cars", xlab="Car Weight", ylab="Miles per Gallon", frame.plot=FALSE, xlim=c(1,6), ylim=c(5,35), col="blue")
plot(y ~ x, data=dat, main="MT Cars", xlab="Car Weight", ylab="Miles per Gallon", frame.plot=FALSE, xlim=c(1,6), ylim=c(5,35), col=ifelse(x>=3, "red", "blue"))

## get fancy with legend, lines of best fit
legend("topright", pch=c(1,1), col=c("blue", "red"), c("light cars", "heavy cars"), bty="o",  box.col="gray", bg="white", cex=.8)
abline(lm(y ~ x), col="darkgray") ## format: abline(a=NULL, b=NULL, h=NULL, v=NULL, ...)
abline(v=3, col="darkgreen", lwd=2, lty=2)
abline(h=mean(y), col="darkgreen", lwd=2, lty=2)
lines(lowess(x, y), col="darkgray")

## get even fancier with controlling axis options, NEED TO RESOLVE THE OVERLAP
axis(side=1, at=seq(from=1, to=6, by=1), lty=1, col="gray", tck=1) ## x axis
axis(side=2, at=seq(from=5, to=35, by=5), lty=1, col="gray", tck=1) ## y axis

## alternative gridlines
abline(h=seq(from=5, to=35, by=5), col="gray", lwd=1, lty=1)
abline(v=seq(from=1, to=6, by=1), col="gray", lwd=1, lty=1)


#################################################

## Example 2. HISTOGRAM with base package

x <- dat$hp
col1 <- "#292B67"
col2 <- 
easd_colours <- c(col1, col2, col3, col4, col5, col6, col7)

par() ## show default parameters
par(cex=.9, cex.axis=.9, cex.lab=.9, cex.main=1) ## font sizes, relative to default
par(pch=1, tck=-0.02, col=col2) ## set marker type, and ticks to be inside
par(lty=1, lwd=.8) ## set line type and width, relative to default

hist(x)
hist(x, main="MT Cars", xlab="Horsepower", col="deepskyblue3")

####################################################################

## Example 3. BARCHART with base package

barplot(dat$cyl)
barplot(table(dat$cyl))
barplot(table(dat$cyl), main="MT Cars", xlab="Cylinders", ylab="Frequency", frame.plot=FALSE, ylim=c(0,14), col=rgb(red=41/255, green=43/255, blue=103/255, alpha=1))
barplot(table(dat$cyl), main="MT Cars", xlab="Cylinders", ylab="Frequency", frame.plot=FALSE, ylim=c(0,14), col=col3)




####################################################################

## Example 4. LINECHART with base package

dat <- AirPassengers ## read in data, careful because class(dat)=ts, so first convert into df

year <- c(1949:1960)
year <- rep(year, times=12)
year <- year[order(year)]

month <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
month <- rep(month, times=length(year)/12)
passengers <- as.vector(dat)

df <- data.frame(year, month, passengers) ## Done. Ready to create chart
df <- aggregate(passengers ~ year, df, FUN=mean, na.rm=TRUE)


## Global chart parameters...
par() ## show default parameters
par(cex=.9, cex.axis=.9, cex.lab=.9, cex.main=1) ## font sizes, relative to default
par(pch=1, tck=0) ## set marker type, and remove ticks
par(lty=1, lwd=.8) ## set line type and width, relative to default

## Line chart...
plot(df$year, df$passengers,                 # x variable, y variable
     type = "l",                             # draw a line graph (also try )
     col = "red",                            # red line colour
     lwd = 3,                                # line width of 3
     xlab = "Year",                          # x axis label
     ylab = "Number of Passengers",          # y axis label
     main = "Air Passengers 1949 - 1960",    # plot title
     axes = TRUE,
     frame.plot = FALSE)

fit1 <- lm (passengers ~ year, data = df) ## carry out a linear regression
abline(fit1, lty = "dashed") ## add the regression line to the plot
text(x = 1952, y = 425, labels = "R2 = 0.896\nP = 2.615e-15") ## add a label to the plot at (x,y)

## Gridlines...
abline(h=seq(from=150, to=450, by=50), col="gray", lwd=1, lty=1)


####################################################################

## Example 3. LINE CHART with ggplot2 and scales, dates with lubridate:
## more about lubridate: https://cran.r-project.org/web/packages/lubridate/vignettes/lubridate.html
## more about lubridate: https://cran.r-project.org/web/packages/lubridate/lubridate.pdf

library("ggplot2")
library("lubridate")
library("scales")

dat <- economics

x <- as.Date(dat$date) ## assuming v1 contains date info
dat$yr <- year(x) ## extracts the years into a new variable
dat$mo <- month(x, label=TRUE) ## or simply dat$mo <- month(x)
dat$day <- day(x) ## extracts the days of month into a variable
dat[which(dat$yr >= 2000), ] ## subset only from 2000 onwards

## now create a line chart, cont'd from above..

ggplot(dat, aes(x=mo, y=pop)) +
      geom_line(aes(color=factor(yr), group=yr)) +
      scale_color_discrete(name="Year") +
      scale_y_continuous(labels=comma) +
      labs(title="Population Growth", x="Month", y="Population") +
      theme(axis.text.x=element_text(angle=90, hjust=1))

## Example 2. bar chart (abstract)
library("ggplot2")
fig <- ggplot(df, aes(x=reorder(item, value), y=value)) +
    geom_bar(stat="identity", fill="blue4", alpha=0.7, width=0.8) +
    xlab("Item") +
    ylab("Value") +
    coord_flip()

pdf("chart-items-by-value.pdf")
plot(fig)
dev.off()


## http://www.statmethods.net/advgraphs/ggplot2.html
## http://docs.ggplot2.org/current/

library("ggplot2")

## template 1
ggplot(dat) +
    aes(x=, y=) +
    geom_bar(colour='deeppink3', alpha=0.2)

## template 2
qplot(x, y, data=, color=, shape=, size=, 
    alpha=, geom=, method=, formula=, 
    facets=, xlim=, ylim= xlab=, ylab=, main=, sub=)