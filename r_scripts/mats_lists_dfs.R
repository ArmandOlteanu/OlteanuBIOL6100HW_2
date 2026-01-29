# Lists, Matrices, and data Frames 
# Armand Olteanu
# 29 Jan. 2026

###############################################

# creating a mat from a vector
my_vec <- 1:12
m <- matrix(data = my_vec, nrow = 4)
m

# by cols
m <- matrix(data = my_vec, ncol = 3, byrow = T)
m

# lists:
my_list <- list(1:10, matrix(1:8, nrow = 4, byrow = T), letters[1:3], pi)
print(my_list)

# indexing a list
x <- my_list[1] # double brackets for obkect within list element 
str(x)
# indexing into a matric
my_list[[2]][1,2] #[rows,cols]

# naming lists

my_list2 <- list(tester=FALSE, little_m = matrix(1:9, nrow = 3))
print(my_list2)

# named objects in lists:
my_list2$little_m[,1]
my_list2$little_m[2] # no comma, its a vec

# unlist
unrolled <- unlist(my_list2)
unrolled[1]

# unpacking complex lists
library(ggplot2)


# create some random vars
y_var <- runif(10)
x_var <- runif(10)

# regress

my_model <- lm(y_var~x_var)
qplot(x=x_var, y=y_var)

str(summary(my_model))

summary(my_model)$coefficients[}x_var,"Pr(>|t|)"]

u <- unlist(summary(my_model))
print(u)

u$coefficients2

pval <- u$coefficients2
pval

# data frames

var_a <- 1:12
var_b <- rep(c("A", "B", "C"), 4)
var_c <- runif(12)

# creating a data frame from vectors
df <- data.frame(var_a, var_b, var_c)
df

str(df)

df$var_a[1]

# expanding the data fram
new_data <- list(var_a = 12, var_b = "D", var_c = 0.77)

# appending data
df2 <- rbind(df, new_data)

View(df2) # looking at data frames in the viewer

# add a new column to a df

new_var <- rnorm(13)
df3 <- cbind(df2, new_var)

# using assignment operator
char_var <- rep("T", 13)
df3$carV <- char_var

# writing data frams
write.csv(df3, "data/my_dataframe.csv")

read.csv("data/my_dataframe.csv")

data <- read.csv("data/my_dataframe.csv")

data$var_a
