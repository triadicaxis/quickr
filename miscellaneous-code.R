help.start()
x <- rnorm(50)  # generate a pseudo-random vector for the x variable  
y <- rnorm(x)   # generate a pseudo-random vector for the y variable  
plot(x,y)       # plot the generated points on a plane	
ls()            # list the objects currently in memory. Only object names are displayed	
rm(x, y)        # remove objects from memory, clear memory	

x <- 1:20         # generate a vector x = (1,2,...,20)
w <- 1+sqrt(x)/2  # generate weight factor
dummy <- data.frame(x=x, y=x+rnorm(x)*w)  # to make a data frame of two columns, x and y
dummy             # display the data frame named "dummy"

fm <- lm(y~x, data=dummy) # fit a simple linear regression model and name it "fm". With y to the left of the ~ we are modelling y dependent on x
summary(fm)       # calculate summary statistics for the regression model named "fm"

fm1 <- lm(y~x, data=dummy, weight=1/w^2) # fit a simple linear regression model and name it "fm1"
summary(fm1)      # calculate summary statistics for the regression model named "fm1"

attach(dummy)     # make the columns in the dataframe visible as variables

lrf <- lowess(x,y)  # make a nonparametric local regression function
plot (x, y)       # make a standard point plot
lines(x, lrf$y)   # add in the local regression curve
abline(0, 1, 1ty=3) # add the true regression line, intercept 0, slope 1
abline(coef(fm))  # 

# the following are my own code tests
exp(1)
exp(x)
write.table(file="mydata", "C:/Users/Owner/Documents/Education/Programing/R/R_code")


################## maybe duplicated


help.start()
x <- rnorm(50)  # generate a pseudo-random vector for the x variable  
y <- rnorm(x)   # generate a pseudo-random vector for the y variable  
plot(x,y)       # plot the generated points on a plane	
ls()            # list the objects currently in memory. Only object names are displayed	
rm(x, y)        # remove objects from memory, clear memory	

x <- 1:20         # generate a vector x = (1,2,...,20)
w <- 1+sqrt(x)/2  # generate weight factor
dummy <- data.frame(x=x, y=x+rnorm(x)*w)  # to make a data frame of two columns, x and y
dummy             # display the data frame named "dummy"

fm <- lm(y~x, data=dummy) # fit a simple linear regression model and name it "fm". With y to the left of the ~ we are modelling y dependent on x
summary(fm)       # calculate summary statistics for the regression model named "fm"

fm1 <- lm(y~x, data=dummy, weight=1/w^2) # fit a simple linear regression model and name it "fm1"
summary(fm1)      # calculate summary statistics for the regression model named "fm1"

attach(dummy)     # make the columns in the dataframe visible as variables

lrf <- lowess(x, y)  # make a nonparametric local regression function
plot (x, y)       # make a standard point plot
lines(x, lrf$y)   # add in the local regression curve
abline(0, 1, 1ty=3) # add the true regression line, intercept 0, slope 1
abline(coef(fm))  # add unweighted regression line