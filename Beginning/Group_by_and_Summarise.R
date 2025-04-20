# group_by() and summarise() functions work nicely together
library(tidyverse)
data()
View(msleep)
names(msleep)


## Removing all missing values from the data set is not a good practice, 
## it will remove the observations which have no missing values for your variables of interest, but have missing values in other variables.
## Therefore, this type of practice will give erroneous analysis
## Rather, remove all missing values from the variables of your interest,
## this will only remove the observations depending on NA in your variables of interest
## use drop_na(variable 1, variable 2, ...) for this

msleep %>% 
  drop_na(vore, sleep_rem, sleep_total) %>% 
  View()

mean(msleep$sleep_rem)
median(msleep$sleep_rem)
max(msleep$sleep_rem)
min(msleep$sleep_rem)

summary(msleep$vore)         ## doesn't work as vore is character
is.na(msleep$vore)
msleep %>% filter(is.na(vore)) %>% View()

summary(msleep$sleep_rem)
summary(msleep$sleep_total)       # NO missing values in sleep_total

msleep %>% filter(is.na(vore)) %>% View()

msleep %>% 
  drop_na(vore, sleep_rem) %>% 
  View()


################################################################################
msleep %>% 
  drop_na(sleep_rem, vore) %>% 
  group_by(vore) %>% 
  summarise('Average total sleep' = mean(sleep_total),
            'Maximum rem sleep' = max(sleep_rem)) %>% 
  View()
################################################################################






