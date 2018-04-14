## lapply can take in a list or a vector
lapply(mylist, FUN) # returns a list
sapply(mylist, FUN) # returns a vector

## iterate over two lists
mapply(FUN, list1, list2)