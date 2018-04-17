## check a few conditions with an if, else if, else statement 

FUN1 <- function(x){
  if(x==1){
    print("Hello")
  } else if(x>1){
    print("World")
  } else { ## closing curly braces must be on the same line as else
    print("x must be less than one")
  }
}

## now test it

FUN1(1)
FUN1(16)
FUN1(0.5)
FUN1(TRUE) ## because TRUE is the same as 1
FUN1(FALSE) ## because FALSE is the same as 0
FUN1("foo")
FUN1("bar")