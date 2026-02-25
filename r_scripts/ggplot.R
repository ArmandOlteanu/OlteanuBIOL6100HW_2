# ggplot2
# need to get class materials for the beginning of ggplot lectures

# Simple inequalities
5 > 3
5 < 3
5 >= 5
5 <= 5
5 == 3
5 != 3

# use & for AND
FALSE & FALSE
FALSE & TRUE
TRUE & TRUE
5 > 3 & 1!=2
1==2 & 1!=2

# use | for OR
FALSE | FALSE
FALSE | TRUE
TRUE | TRUE
1==2 | 1!=2

# works with vectors

1:5 > 3

a <- 1:10
b <- 10:1

a > 4 & b > 4

# use "long form" to evaluate left to write until a the first true/false is evaluated

# evaluates all elements and gives a vector of results
a < 4 & b > 4

# evaluates until the first logical result is created
a < 4 && b > 4

# similar format for "long form" for OR

# vector result
a < 4 | b > 4

# single result
a < 4 || b > 4


# xor for exclusive or testing of vectors
# works for (TRUE FALSE) but not (FALSE FALSE) or (TRUE TRUE)
xor(FALSE,FALSE)
xor(FALSE,TRUE)
xor(TRUE,TRUE)
a <- c(0,0,1)
b <- c(0,1,1)
xor(a,b)

# compare with a | b
# works for (TRUE FALSE) or (TRUE TRUE)
a | b

# boolean algebra on sets of atomic vectors (logical,numeric, character strings)

a <- 1:7
b <- 5:10

# union to get all elements
union(a,b)

# intersect to get common elements
intersect(a,b)

# setdiff to get distinct elements in a
setdiff(a,b)

setdiff(b,a)

# setequal to check for identical elements
setequal(a,b)

# more generally, to compare any two objects
z <- matrix(1:12,nrow=4,byrow=TRUE)
z1 <- matrix(1:12,nrow=4,byrow=FALSE)

# This just compares element by element
z==z1

# Use identical for entire structures
identical(z,z1)
z1 <- z
identical(z,z1)

# most useful for if statements is %in% or is.element
# these two are equivalent, but I prefer the %in% for readability
d <- 12
d %in% union(a,b)
is.element(d,union(a,b))

# check for partial matching with vector comparisons

d <- c(10,12)
d %in% union(a,b)
d %in% a

if (condition) {expression1}

if (condition) {expression1} else {expression2}

if (condition1) {expression1} else
if (condition2) {expression2} else

z <- signif(runif(1),digits=2)
print(z)
z > 0.5
if (z > 0.5) cat(z, "is a bigger than average number","\n")

if (z > 0.8) cat(z,"is a large number","\n") else 
if (z < 0.2) cat(z,"is a small number","\n") else
   {cat(z,"is a number of typical size","\n")
    cat("z^2 =",z^2,"\n")}

# if statement requires a single logical value. With a vector,
# it will assign TRUE/FALSE based on very first element only.

z <- 1:10

# this does not do anything
if (z > 7) print(z)

# probably not what you want 
if (z < 7) print(z)

# use subsetting!
print(z[z < 7])

ifelse(test,yes,no)

test is an object that can be coerced to a logical yes/no
yes return values for true elements of test
no return vales for false elements of test

tester <- runif(1000) # start with random uniform elements
eggs <- ifelse(tester>0.35,rpois(n=1000,lambda=10.2),0)
hist(eggs)

pVals <- runif(1000)
z <- ifelse(pVals<=0.025,"lowerTail","nonSig")
z[pVals>=0.975] <- "upperTail"
table(z)
## z
## lowerTail    nonSig upperTail 
##        21       953        26

z1 <- rep("nonSig",1000)
z1[pVals<=0.025] <- "lowerTail"
z1[pVals>=0.975] <- "upperTail"
table(z1)
## z1
## lowerTail    nonSig upperTail 
##        21       953        26






# multi panel plots
install.packages("ggthemes")
install.packages("patchwork")

library("ggthemes")
library("patchwork")

g1 <- ggplot(data =d) +
  aes(x = displ, y =cty) +
  geom_point() + 
  gemon_smooth()
g1

g2 <- ggplot(data) +
  ase(x = fl) +
  geom_bar(fill = "tomato", color = "black")
g2

g3 <- ggplot(data = d) +
  aes(x = displ) +
  geom_histogram(fill = "royalblue", color = "black")
g3

g4 <- ggplot(data = d) +
  aes(x = fl, y = cty, fill = fl) +
  geom_boxplot() + 
  theme(legend.position = "none")
g4

# plot three plots
g1 + g2 + g3 + plot_layout(ncol = 1)

# changing area of each plot
g1 + g2 + g3 + plot_layout(ncol = 1, heights - c(2,1))

# in the other dimension
g1 + g2 + g3 + plot_layout(ncol = 1, widths - c(1,2))

# adding spacers 
g1 + plot_spacer() + g2

# nested layouts

g1 + {
  g2 + {
    g3 +
      g4 +
      plot_layout(ncol = 1)
  }
} +
  plot_layout(ncol = 1)

# - operator for subtrack placement 

g1 + g2 - g3 +plot_layout(ncol = 1)

# using | and \

(g1 | g2 | g3) / g4 + plot_annotation("Title Here")
caption = "made this patwork"

# additing tages
g1 / (g2 | g3) +
  plot_annotation(tag_levels = "A")

##########
# multi panel plots with facet

m1 <- ggplot(data = d) +
  aes(x = displ, y = cty) +
  geom_point()

#using facet grid
m1 + facet_grid(class ~ fl, scales = "free")

# facet for only one variable
m1 + facet_grid(.~class)

# facet wrap 
m1 + facet_wrap(~class + fl, drop = F)

