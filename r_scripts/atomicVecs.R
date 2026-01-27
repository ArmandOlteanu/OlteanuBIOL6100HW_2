# This is a document describing vectors in R
# 22 january 2026
# Armand Olteanu
#-----------------------------------------
# START OF SCRIPT


x <- 5
print(x)


plant_height <- 3 #snake case
plantHeight <- 4 #camel case
plant.height <- #that's not prefered 

. # reserve for temp variables

# 1d atomic vec:
z <- c(3.2, 5, 5, 6)
print(z)
typeof(z)

z <- c(c(3.2,3),c(3,5))

is.character(z)


#character strings

t <- "pearch"
print (t)

t <- c("perch", "bass", "trout")
print(t)
t <- c("This is a 'character' string", "a second")
t[2]
t[1]


typeof(t)
is.numeric(t)

# Logical/Boolean
z <- c(TRUE, FALSE, TRUE)
print(z)

is.logical(z)

typeof(z)
c(T, F)

mean(z)

# vector properties 
z <- (1.1, 1, 2.3, 4)
typeof(z) # gives type
is.numeric(z) # is gives logical
as.character(z) #as. coerces variables

print(z) 
typeof(z)



t <- c(1,2,"3",4)
length(t)

# random number gnerator
z <- runif(5)
names(z)

names(z) <- c("A", "B", "C", "D", "E")
print(z)


# special data types
z <- c(3.2, 3, 3, NA)
print(z)
typeof(z)
length(z)
typeof(z[4])
sum(z)
sum(z, na.rm=T)

z <- 0/0
z

z <- 1/0
z

# vectorization 
z <- c(10, 20, 30, 40)
z

y <- c(1, 2, 3)
z + y

# recycling 

x <- c(1,2)

z + x



###########
# Atomic Vevs Part II
z <- vector(mode = "numeric", length = 0)
print(z)
# dynamic creation (don't in R, do in Python)
z <- c(z,5)
print(z)

# Predefined length
z <- rep(0, 100)
length(z)
z <- rep(NA, 100)
z

typeof(z)

z[1] <- "Vermont"
head(z)
typeof(z)

my_vector <- runif(100)
my_names <- paste("Species", seq(1:length(my_vector)),sep="")

print(my_names)

name(my_vector) <- my_names
head(my_vector)
str(my_vector)
# using the rep fuctions
rep(0.5, 6)
rep(x = 0.5, times = 6)

my_vec <- c(1,2,3)

# repeat a vector
rep(x=my_vec, times = 2, each = 2)

# sequencing vectors
seq(from = 2, to = 4)
2:4 # ok shorthand

x <- seq(from=2, to=4, length=7) #evenly space with an even length of 7

my_vec <- 1:length(x)
my_vec

#better in R
seq_along(my_vec)

# generating random vectors 

runif(5) # gives us 5 values from 0 to 1

# the parameters 

runif(n=3,min=100, max=101)

set.seed(123) # takes any number

runif(n=3,min=0, max=1) # gives you the same progression of random units

# normal dists
out <- rnorm(n = 10, mean = 100, sd = 30)
hist(out)
help(rnorm)

long_vec <- seq_len(10)

sample(x=long_vec, size = 10, replace = F)

# weighted sampling from a vec 
weights <- c(rep(20,5),rep(100,5))

sample(x=long_vec,replace=TRUE,prob=weights)

# subsetting vectors

z <- c(3.1, 9.2, 1.3, 0.4, 7.5)
print(z)

z[c-(2,3)] # using vecs slice

#using logicals
z[z<3]

# relational operators

x <- 1:5
y <- c(1:3,7,7)

x== 2 # equal
x != 2 # not equal 

x == 1 & y == 7 # using and

x == 1 | y == 7 # using or

x == 3 & y ==3 # and vs or

# missing values
set.seed(90)

z <- runif(10)

z < 0.5
z[z < 0.5]

z[which(z < 0,5)]

zd <- c(z, NA, NA)

zd[zd < 0.5]

zd[which(zd < 0.5)]
