# dplyr lecture
# 2/25/26

# dplyr is going to be used for data manipulation and strucutre your dataframes

# a few of the core verbs that you'll be using are:

#filter(), arrange(). select(), summarize(), group_by(), and mutate()

# start with a builtin dataset

library(tidyverse)

# to specify the package you're using, you can first call on the package name
dplyr::filter()
stats::filter()


data(starwars)
class(starwars)

head(starwars)
tail(starwars)

glimpse(starwars)

# cleaning ip our database- base r. has the complete.cases function this is going to remove rows with NA's

#indexing has the form of [rows, columns]
starwarsClean<-starwars[complete.cases(starwars[,1:10]),]

# you can check for NA's

is.na(starwarsClean[,1])

anyNA(starwarsClean[,1:10])

#filter() function0this will subset observations by their values
#uses >, >=, <=, ==,!
#logical operators like $ and |
# filter automatically excludes NA, have to ask for them specifcally 

filter(starwarsClean, gender=="masculine" & height < 180)

filter(starwarsClean, gender=="masculine", height < 180, height > 100)

filter(starwarsClean, eye_color %in% c("blue", "brown")) 


#%in% filters for multiple different conditions
# 
# #arrange() reorder rows
# 
arrange(starwarsClean, by=height)
arrange(starwarsClean, by=desc(height))
arrange(starwarsClean, height, desc(mass))

# select() choose variables based on their names/columns

starwarsClean[1:10,]
select(starwarsClean, 1:10) # these two functions are equivalent
select(starwarsClean, name:homeworld)
select(starwarsClean, -(films:starships))# subsetting everything except these variables

#rearrange colimns
select(starwarsClean, homeworld, name, gender, species, everything())

select(starwarsClean, contains("color"))

#rename columns, 
select(starwars, haircolor=hair_color) # actual name of the colum comes after stating the new name you want

# mutate() finction create new varibales with functions of existing variables

# create a new column that's just the height divided by mass

mutate(starwarsClean, ratio=height/mass)

y<-mutate(starwarsClean, ratio=height/mass)
starwars_lbs<-mutate(starwarsClean, mass_lbs=mass*2.2)

transmute(starwarsClean, mass_lbs=mass*2.2)

#summarize() and group_by() functions collapse many walues down to a single summary 

summarize(starwarsClean, meanHeight=mean(height))

summarize(starwars, meanHeight=mean(height))

summarize(starwars, meanHeight=mean(height, na.rm=TRUE), TotalNumber=n())

# use group_by for additional calculations 
starwarsGeneder<-group_by(starwars, gender)
summarize(starwarsGeneder, meanHeight=mean(height,na.rm=TRUE), number=n())

#pipe statements -the pipe operator is %>%

#These are sequences of actions that will change your dataset

# its going to pass intermediate results onto the next functions in sequence
# you should avoid this when you need to manupulate more than one object, or if there are meaningful intermediate objects
# formatting: you should always have a space before it and usually an automatic indent

starwarsClean%>%
  group_by(gender)%>%
  summarize(meanHeight=mean(height, na.rm=TRUE), number=n())


#case_when() function is useful for multiple condiitonal ifelse statements
newdf<-starwarsClean%>%
  mutate(sp=case_when(species=="Human"~"Human", TRUE ~ "Non-human"))%>%
  select(name, sp, everything())
unique(starwarsClean$species)

glimpse(starwarsClean)

# Piviot from long to wide format using pivot_wider or pivot_longer

wideSW<-starwarsClean%>%
  select(name,sex, height)%>%
  pivot_wider(names_from=sex, values_from=height, values_fill=NA)

wideSW

pivotSW<-starwars%>%
  select(name,homeworld)%>%
  group_by(homeworld)%>%
  mutate(rn=row_number())%>%
  ungroup()%>%
  pivot_wider(names_from=homeworld, values_from=name)

wideSW%>%
  pivot_longer(cols=male:female, names_to="sex", values_to="height", values_drop_na=TRUE)

