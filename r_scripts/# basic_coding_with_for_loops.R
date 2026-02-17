# basic coding with for loops 
# 10 Feburary 2026
# Armand Olteanu

# creating a basic for loop:
for (i in 1:5) {
  cat("stuck in a loop", "\n")
  cat(3 + 2, "\n")
  cat(runif(1), "\n")
}



# Tip 1

# dont do things in a loop if you dont need to:

for (i in seq_along(my_dogs)){
  my_dogs[i] <- toupper(my_dogs[i])
}
#^dont have the vector my dog so it wont work but thats the idea

#Tip 2:
# Don't change dimensions in the loop
my_dat <- runif(1)
for (i in 2:10){
  temp <- runif(1)
  my_dat <- (my_dat, temp)
 # cat("loop numer =", i, my_dat[i], "\n")
  print(my_dat)

}

# tip 3: 
# don't write a loop if you can vectorize it
my_dat <- 1:10
for (i in seq_along(my_dat)){
  my_dat[i] <- my_dat[i] + my_dat[i]^2
  cat ("loop number =",i,"vector element =", my_dat[i], "\n")
 }
# Do this 
z <- 1:10
z <- z + z^2

#Tip 4
# remember the difference between i and z[i]

z <- c(10,2,4)
for (i in seq_along(z)) {
  cat("i=",i"z[i] = ", z[i], "\n")
z
}

# create a simple random growth population model function

##################################################
# FUNCTION: ran_walk
# stochastic random walk 
# input: times = number of time steps
#        n1 = initial population size (= n[1])
#        lambda = finite rate of increase
#        noise_sd = sd of a normal distribution with mean 0
# output: vector n with population sizes > 0 
#         until extinction, then NA 
#------------------------------------------------- 
library(ggplot2)
ran_walk <- function(times= 100,n1=50,lambda=1.00,noise_sd= 10) {
                n <- rep(NA,times)  # create output vector
                n[1] <- n1 # initialize with starting population size
                noise <- rnorm(n=times,mean= 0,sd=noise_sd) # create noise vector
                for(i in 1:(times-1)) {
                  n[i + 1] <- lambda*n[i] + noise[i]
                  if(n[i + 1] <=0) {
                    n[i + 1] <- NA
                    cat("Population extinction at time",i+1,"\n")
                    break}
                }

return(n)
}

# explore paramaters in plot function
qplot(x=1:100,y=ran_walk(),geom="line")


# no noise/not so random walk
qplot(x=1:100,y=ran_walk(noise_sd=0),geom="line")

# No noise and ajust lamda
qplot(x=1:100, y=ran_walk(lambda = 0.92, noise_sd=0),geom="line")

# add some stoch. back make lambda > 1
qplot(x=1:100, y=ran_walk(lambda = 1.1, noise_sd=2),geom="line")
