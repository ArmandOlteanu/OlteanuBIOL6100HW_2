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


# Distinctions between DFs and Mat Dims

z_mat <- matrix(data = 1:30, ncol= 3, byrow = T)
z_mat

z_dframe <- as.data.frame(z_mat) # turn into DF

str(z_mat)
str(z_dframe)

head(z_dframe)

head(z_mat)

z_dframe$V2[2] # correct for a DF

# column ref
z_dframe[,3]
z_mat[,3]

# one dimension referencing
z_mat[2]
z_dframe[2]

# missing data  in DFs and Mats
zd <- runif(10)
zd[c(5,7)] <- NA
print(zd)

# complete cases
complete.cases(zd)

# filter for only true
zd[complete.cases(zd)]

# which positions are missing 
which(complete.cases(zd))

# missing data in a matrix
m <- matrix(1:20, nrow = 5)

# add missing data

m[1,1] <- NA
m[5,4] <- NA

m[complete.cases(m),]

# now get complete cases for only certain columns

m[complete.cases(m[,c(1,2)]),] # drops first row
m[complete.cases(m[,c(2,3)]),] # no drops
m[complete.cases(m[,c(3,4)]),] # drops row 4
m[complete.cases(m[,c(1,4)]),] # drops 1&4

# subsetting mats and data frames

m <- matrix(data=1:12,nrow=3)

dimnames(m) <- list(paste("Species",LETTERS[1:nrow(m)],sep=""),paste("Site",1:ncol(m),sep=""))

print(m)

# element-wise subsetting
m[1:2, 3:4]
m[c("SpeciesA", "SpeciesB"),c("Site3, "Site4")]

m[1:2,]
m[,3:4]

# using logical for subsetting

sums <- colSums(m) #create sums 
sums[sums > 15]

rowSums(m)

m[!rowSums(m)==22, ]

m[,"Site1"]

m[,"Site1"]<3

# data curation 

my_data <- read.csv(file="data/ExcelDataTemplate.csv")
                    header=TRUE,
                    sep=",",
                    comment.char="#")
my_data


saveRDS(z_dframe, file="data/zData.RDS") # .RDS suffix is not required, but good for clarity

# using the RDS reader
unfrozen_Z <- readRDS("data/zData.RDS")
unfrozen_Z
