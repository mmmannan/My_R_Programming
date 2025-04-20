#read.csv function ("file_name.csv")

#read.csv("Friends.csv")
my_data <- read.csv("Friends.csv")
my_data

#View data
head(my_data)       # head function prints first 6 entities of dataset
tail(my_data)       #tail function prints last 6 entities of dataset
View(my_data)       #View function shows full dataset
# View() is case-sensitive, view() shows error
#can also view data by clicking on Object in the Environment
#by clicking on the arrow before object in the environment, we view the variables and values


#Extract components of your dataframe
#Rows are observations
#Columns are variables
my_data[5,3]             #print a specific cell
my_data[ ,3]             #print a whole column
my_data[3, ]             #print a whole row
my_data$Eye_colour       #print a whole column  ===>>>  object_name$column_name


#Packages have preprogrammed functions that solve specific problems
#and expand the R vocabulary

#Install packages
install.packages("tidyverse")
#Use packages
library("tidyverse")      #or 
require("tidyverse")
#tidyverse includes packages like dplyr, ggplot2, readr, forcats, stringr, tibble, lubridate, tidyr, purr

#take  a look at your data
glimpse(my_data)

#### Shift+Ctrl+2 to take closer look in console and to return back 

### %>% pipe operator  ===>>>  Shift+Ctrl+M
### object or variable is piped into the following code
my_data %>% 
  select(Name,Age,Height) %>%
  filter(Age < 25 & Height > 1.77) %>% 
  arrange(Height)
