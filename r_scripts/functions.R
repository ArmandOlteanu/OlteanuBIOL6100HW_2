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
#######################


# global vs local parameters 
my_func <- function(a = 3, b = 4){
  z <- a + b
  return(z)
}
my_func()


my_bad_func <- function(a=3){

}
my_bad_func()


# passing global variables properly

a <- 32
b <- 4

my_func_2 <- function(first, second){
  z <- first + second
  return(z)
}

my_func_2(first = a, second = b)

#Start Function
##################################################
# FUNCTION: hardy_weinberg2
# input: an allele frequency p (0,1)
# output: p and the frequencies of the 3 genotypes AA, AB, BB
#------------------------------------------------- 
hardy_weinberg2 <- function(p=runif(1)) {
  if (p > 1.0 | p < 0.0) {
    return("Function failure: p must be >= 0.0 and <= 1.0")
  }
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
 vec_out <- signif(c(p=p,AA=fAA,AB=fAB,BB=fBB),digits=3)
 return(vec_out)
  }
##################################################
  hardy_weinberg2()
  hardy_weinberg2(1.1) # OK, print error to screen
  z <- hardy_weinberg2(1.1) # uggh no error printed
  print(z) # Error message was saved to variable z!

hardy_weinberg(p = 3)



# Regression function



fit_linear <- function(x = runif(20), y = runif(20)){
################################################################################################################################################
# START OF FUNCTION

  
################################################
# FUNCTION: fit_linear
# PURPOSEL: fits a simple lienar regression
# INPUTS: numeric vector or predictors x and response y 
# OUT: slope and p value
my_mod <- lm(y~x)
  my_out <- c(slope=summary(my_mod)$coefficients[2,1],
  p_value=summary(my_mod)$coefficients[2,4])

  #plot the output
  plot(x=x, y=y)
  return(my_out)




} 
################################################################################################################################################
# END OF FUNCTION


fit_linear()


##################################################
# FUNCTION: fit_linear2       
# fits simple regression line
# inputs: numeric vector of predictor (x) and response (y)
# outputs: slope and p-value
#------------------------------------------------- 
fit_linear2 <- function(p=NULL) {
  if(is.null(p)) {
     p <- list(x=runif(20),y=runif(20))
  }
  my_mod <- lm(p$x~p$y) # fit the model
  my_out <- c(slope=summary(my_mod)$coefficients[2,1],
             p_value=summary(my_mod)$coefficients[2,4])
  plot(x=p$x,y=p$y) # quick and dirty plot to check output
  return(my_out)
}

##################################################
fit_linear2()
my_pars <-list(x=1:10,y=sort(runif(10)))
fit_linear2(my_pars)