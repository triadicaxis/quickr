## return subsequently works with the computed value, while print only prints something to the screen
foo <- function(){
  print(5)
  return(10)
}

## try it out
foo()+2

## here is a generic example of a function that contains both return and print
bar <- function(x) {
  if(x>0) {
    return(x+2)
  } else if(x==0) {
    print(x+10)
  } else {
    print("Enter a positive value!")
  }
}

## try it out
bar(6)
bar(-2)
bar(0)+2
bar("Hello")