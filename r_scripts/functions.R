# a demo of user defined fuctions in R
# Armand Olteanu
# 02/05/2026

####################\



# looking at existing fuctions 

sum(3,2)

`+`(3,2)

y <- 3

print (read.table)


# creating a function
# Start function called function name
#########################
adder_subtractor <- function(x = 1, y = 2, z = TRUE){
# Name: functionName
# Operations: It does some random math depending on the value of z
# Inputs: (3 inputs)
  # x (numeric scaler value, defult = 1): one of the numbers to be operataed on
  # y (numeric scaler value, defult = 2): one of the numbers to be operataed on
  # z (logical, default = T): A switch to decide on subtracting or adding
# Outputs: Numeric value resulting from addition or subtraction
if(z == TRUE){out <- x + y}else{
  out <- x - y
}


  return(out)
  
###################
# End of Function
}

v <- adder_subtractor(x = 7, y = 4 z = TRUE)
v


# Start Function
##################################################
# FUNCTION: hardy_weinberg
# input: an allele frequency p (0,1)
# output: p and the frequencies of the 3 genotypes AA, AB, BB
#------------------------------------------------- 
hardy_weinberg <- function(p=runif(1)){
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
 vec_out <- signif(c(p=p,AA=fAA,AB=fAB,BB=fBB),digits=3)
 return(vec_out)
}
##################################################
 hardy_weinberg()
 hardy_weinberg(p=0.5) # pass to the parameter the value p
 # print(p) # error because p does not exist in the global environment
 pp <- 0.6 # variable pp is stored in global environment
 hardy_weinberg(p=pp) # pass contents of variable pp to function parameter p
 print(pp) # variable pp is still stored in memory
  
}

