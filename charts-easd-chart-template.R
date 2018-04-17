dat <- mtcars

## specify chart size
dev.size(units="cm")
slim <- c(4.881889764, 3.937007874) ## Slim chart: 12.4cm wide  x 10cm high
wide <- c(6.299212598, 6.299212598) ## Wide chart 16 cm wide x up to 16cm high


## specify colour scheme
col1 <- "#292B67"
col2 <- "#9ED9DF"
col3 <- "#22789A"
col4 <- "#BCBFC1" ## for chart lines and ticks
col5 <- "#595A5B" ## for chart font 
col6 <- "#56B4DF"
col7 <- "#0072B2"
easd.col <- c(col1, col2, col3, col6, col7)

## set parameters globally
par(cex=.9, cex.axis=.9, cex.lab=.9, cex.main=1) ## Arial 10pt
par(col=col3, col.axis=col5, col.lab=col5, col.main=col5, col.sub=col5, fg=col5) ## set all colours
par(pch=1, tck=-0.02) ## set marker type, and ticks to be inside
par(lty=1, lwd=.8) ## set line type and width, relative to default
par(fin=slim, din=slim) ## set line type and width, relative to default

## SINGLE BARCHART
barplot(table(dat$cyl), main="MT Cars", xlab="Cylinders", ylab="Frequency", border=NA, ylim=c(0,14), col=col3)

## SINGLE BARCHART, SORTED
barplot(sort(table(dat$cyl), decreasing=TRUE), main="MT Cars", xlab="Cylinders", ylab="Frequency", border=NA, ylim=c(0,14), col=col3)

## SINGLE BARCHART, SORTED & FLIPPED
barplot(sort(table(dat$cyl), decreasing=FALSE), main="MT Cars", xlab="Cylinders", ylab="Frequency", border=NA, ylim=c(0,14), col=col3, horiz=TRUE, las=1)

## export as pdf
pdf("barplot-test.pdf")
plot(barplot(sort(table(dat$cyl), decreasing=FALSE), main="MT Cars", xlab="Cylinders", ylab="Frequency", border=NA, ylim=c(0,14), col=col3, horiz=TRUE, las=1))
dev.off()

pdf("barplot-test.pdf")
plot(barplot(sort(table(dat$cyl), decreasing=TRUE), main="MT Cars", xlab="Cylinders", ylab="Frequency", border=NA, ylim=c(0,14), col=col3))
dev.off()