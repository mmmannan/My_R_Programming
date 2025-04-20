#Functions are instructions to apply on objects or variables

my_age <- 23
your_age <- 19
sum(my_age,your_age)

library(tidyverse)

my_data <- starwars %>% 
  select (height,mass)   # 87 observations of 2 variables

plot(my_data)

# call a variable of a data_frame:  data_frame_name$variable_name
hist(my_data$height)

hist(my_data$mass)
starwars %>% 
  select(name, species, mass) %>% 
  filter(mass > 1000) %>% 
  View()
  

#or
attach(my_data)
hist(height)
hist(mass)

summary(my_data)
summary(height)   #or summary(my_data$height)
summary(mass)   #or  summary(my_data$mass)

class(my_data)
class(my_data$height)   #or class(height) as it is already attached
class(mass)    #or class(my_data$mass)

length(my_data)  # number of variables
length(my_data$height)   #number of observations
length(mass)

unique(height)
length(unique(height))
unique(my_data$mass)
length(unique(my_data$mass))

head(my_data)
tail(my_data)

my_data[4:10,1:2]    #[rows,columns]
my_data[4:10,1]
my_data[4:10,2]
my_data[7,1:2]
my_data[40,1]   # to call a cell
my_data[50,2]

subset <- my_data[4:12,1:2]


?median
median(1:10)
median(1:11)
median(c(1:3,100,1000))
median(c(2:10,25,100,70,25,99,1000))
median(c(4:10,25,100,70,25,99,1000,36))

median(my_data$height)
median(my_data$height, na.rm = TRUE)
median(my_data$mass, na.rm =TRUE)
median(subset$mass, na.rm = TRUE)
median(subset$height,na.rm=TRUE)


jjj <- c(c(1:3),8,NA,111,99,30)
median(jjj, na.rm=TRUE)
