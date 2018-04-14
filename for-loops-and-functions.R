## You can for loop without using the value of i
## This will print the word loop 10 times
for(i in 1:10) {
    print("loop")   
}

## You can also use the value of i for each loop
## This will print different values of x for each new value of i
for(i in 1:10) {
    x <- i * 2
    print(x)
}


## If you want to save something from a function, you can use .GlobalEnv to save something to the global
fun1 <- function(param1, param2){
    ourlist <- list()
        for(i in param1:param2){
        x <- i * 2
        ourlist[[i]] <- x
    }
    .GlobalEnv$output <- ourlist
}

fun1(param1 = 1, param2 = 10)

## You can also return an object from a function using the return function
fun1 <- function(param1, param2){
    ourlist <- list()
        for(i in param1:param2){
        x <- i * 2
        ourlist[[i]] <- x
    }
    return(ourlist)
}

output <- fun1(param1 = 1, param2 = 10)
output