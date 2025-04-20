library(tidyverse)
data()
View(msleep)

# Describe the spread of your data
min(msleep$awake)
max(msleep$awake)
range(msleep$awake)
IQR(msleep$awake)

# Describe the centrality of your data
mean(msleep$awake)
median(msleep$awake)

# Describe the variance of your data
var(msleep$awake)

# summarise selected variables
summary(msleep)
summary(msleep$sleep_total)

msleep %>% 
  select(sleep_total, brainwt) %>% 
  summary()


# Create a summary table
## For each category of "vore"
## show the min, max, difference and average sleep_total
## and arrange data by the average

msleep %>% 
  select(name, vore, sleep_total) %>% 
  View()

msleep %>% 
  drop_na(vore) %>% 
  group_by(vore) %>%       
  summarise(Average_sleep_total = mean(sleep_total)) %>% 
  View()

# group_by() doesn't make any changes alone.
# group_by() works well with summarise ()

msleep %>% 
  drop_na(vore) %>% 
  group_by(vore) %>% 
  summarise(Lower_sleep_total = min(sleep_total),
          Average_sleep_total = mean(sleep_total),
          Upper_sleep_total = max(sleep_total),
          Difference = max(sleep_total) - min(sleep_total)) %>% 
  View()


################################################################################
msleep %>% 
  drop_na(vore) %>% 
  group_by(vore) %>% 
  summarise(Lower_sleep_total = min(sleep_total),
            Average_sleep_total = mean(sleep_total),
            Upper_sleep_total = max(sleep_total),
            Difference = max(sleep_total) - min(sleep_total)) %>% 
  arrange(Average_sleep_total) %>% 
  View()
################################################################################


# Creating contingency tables
library(MASS)
attach(Cars93)         #attach isn't the best practice in data science

str(Cars93)
dim(Cars93)
glimpse(Cars93)
View(Cars93)

# Using base R
table(Origin)
table(AirBags)
table(AirBags, Origin)
table(Origin, AirBags)

addmargins((table(AirBags, Origin)))
addmargins(table(AirBags, Origin), 1)    # adds the values in a column
addmargins((table(AirBags, Origin)), 2)   # adds the values in a rows

table(AirBags, Origin)
prop.table(table(AirBags, Origin))   # gives the proportion of each value
prop.table(table(AirBags, Origin), 2) * 100   # adds the values in a column to a total of 100%
prop.table(table(AirBags, Origin), 1) * 100   # adds the values in a row to a total of 100%

round(prop.table(table(AirBags, Origin), 2) * 100)
round(prop.table(table(AirBags, Origin), 1) * 100)


# Using tidyverse
Cars93 %>% 
  group_by(Origin, AirBags) %>% 
  summarise(n()) %>%   # counts how many
  View()

Cars93 %>% 
  group_by(Origin, AirBags) %>% 
  summarise(number = n()) %>%   # counts how many
  View()


# Using base R
table(AirBags, Origin)
# Or
# Using tidyverse
################################################################################
Cars93 %>% 
  group_by(Origin, AirBags) %>% 
  summarise(number = n()) %>%   # counts how many
  pivot_wider(names_from = Origin, values_from = number) %>% 
  View()
################################################################################

wider_data_1 <- Cars93 %>% 
  group_by(Origin, AirBags) %>% 
  summarise(number = n()) %>%   # counts how many
  pivot_wider(names_from = Origin, values_from = number) 
 
longer_data_1 <- wider_data %>% 
  pivot_longer(2:3,
               names_to = "Origin", values_to = "number") 


wider_data_2 <- Cars93 %>% 
  group_by(Origin, AirBags) %>% 
  summarise(number = n()) %>%   # counts how many
  pivot_wider(names_from = AirBags, values_from = number) 

longer_data_2 <- wider_data_2 %>% 
  pivot_longer(c(2:4),
               names_to = "AirBags", values_to = "number")




