## check multiple conditions with a switch function (similar to if, else if, ...)

FUN1 <- function(x){
  switch(x,
         "a"="out1",
         "b"="out2",
         "c"="out3",
         "z"="Hello",
         "x"="World",
         "other")  
}

## now test it

FUN1("a")
FUN1("b")
FUN1(4)
FUN1(5)
FUN1(16)
FUN1("foo")