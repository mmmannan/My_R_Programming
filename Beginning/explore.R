library(tidyverse)
data()
?starwars
dim(starwars)  # dimentions      row/entry/observation   column/attribute/variable
str(starwars)  #structure
glimpse(starwars) # watch the dataset at a glimpse
# dbl = double datatype means numeric/ float
# factor datatype means catagorical values 
# example: male, female,  small, medium, big, black, blond, brown, grey, white, 
# NA means not available
View(starwars)
head(starwars)
tail(starwars)

starwars$name
starwars$species
starwars$eye_color
starwars$sex
starwars$films


attach(starwars)
names(starwars)    # names of the variables/ columns
length(starwars)    # number of variables/ columns      length(dataset_name)
class(hair_color)
length(hair_color)   # number of rows/entries/observations   length(variable_name)
unique(hair_color)   # NA, none, unknown means different thing
length(sex)
class(sex)
unique(sex)
unique(species)
unique(eye_color)

table(sex)
table(hair_color)

?sort()
sort(table(sex))
View(sort(table(sex)))
barplot(sort(table(sex)))

sort(table(sex), decreasing = TRUE)
View(sort(table(sex), decreasing = TRUE))
barplot(sort(table(sex), decreasing = TRUE))


View(sort(table(hair_color), decreasing = TRUE))
barplot(sort(table(hair_color)))

View(sort(table(species)))  # doesn't show rows with NA
barplot(sort(table(species)))
View(sort(table(species), decreasing = TRUE))  # doesn't show rows with NA


#or

starwars %>% 
  select(hair_color)

starwars %>% 
  select(hair_color) %>% 
  count(hair_color)

starwars %>% 
  select(hair_color) %>% 
  count(hair_color) %>% 
  arrange(n)

starwars %>% 
  select(hair_color) %>% 
  count(hair_color) %>% 
  arrange(n) %>% 
  View()

starwars %>% 
  select(hair_color) %>% 
  count(hair_color) %>% 
  arrange(desc(n))

starwars %>% 
  select(hair_color) %>% 
  count(hair_color) %>% 
  arrange(desc(n)) %>% 
  View()                     # shows rows with NA


is.na(hair_color)
starwars[is.na(hair_color), ]
View(starwars[is.na(hair_color), ])


is.na(species)
starwars[is.na(species), ]
View(starwars[is.na(species), ])


class(height)
length(height)
summary(height)
boxplot(height)
hist(height)
plot(height)     # scatterplot


starwars %>% 
  filter(species == 'Human')

starwars %>% 
  filter(species == 'Human') %>% 
  View()
