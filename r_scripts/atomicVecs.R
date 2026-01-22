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
