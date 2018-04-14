## the %in% operator tells you which elements are among the numbers to remove:
  
a <- sample(1 : 10)
remove <- c(2, 3, 5)
a

a %in% remove
a [! a %in% remove]