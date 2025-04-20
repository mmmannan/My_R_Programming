# load packages
library(tidyverse)
data()
?msleep
glimpse(msleep)
View(msleep)
dim(msleep)
msleep

# Rename a variable using rename() function
# rename(new_name = existing_name)
msleep %>%
  rename(conserv = conservation) %>% 
  glimpse()

msleep %>%
  rename("conserv" = "conservation") %>% 
  glimpse()  


# Reorder variables using select() function
# whatever order you put in select() function,
# will pop up in output
msleep %>%
  select(vore, name, everything())
  

# Change a variable type
class(msleep$vore)

msleep$vore <- as.factor(msleep$vore)   # overwrite vore with factor values
glimpse(msleep)
# Or use mutate() function to overwrite
msleep %>% 
  mutate(vore = as.character(vore)) %>%   # overwrite vore with character values
  glimpse()



# Select variables to work with
names(msleep)

msleep %>% 
  select(2:4,
         awake,
         starts_with(("sleep")),
         contains("wt")) %>% 
  names()

msleep %>% 
  select(2:4,
         awake,
         starts_with(("sleep")),
         contains("wt")) %>% 
  View()

msleep %>% 
  select(contains("ee")) %>% 
  names()


# Filter and arrange data
unique(msleep$order)

msleep %>% 
  filter((order == "Carnivora" | order == "Primates") &
           sleep_total < 18) %>% 
  select(name, order, sleep_total) %>% 
  View()
  
msleep %>% 
  filter((order == "Carnivora" | order == "Primates") &
           sleep_total < 18) %>% 
  select(name, order, sleep_total) %>% 
  arrange(sleep_total) %>%      # Ascending/Increasing
  View()

msleep %>% 
  filter((order == "Carnivora" | order == "Primates") &
           sleep_total < 18) %>% 
  select(name, order, sleep_total) %>% 
  arrange( - sleep_total) %>%      # Descending/Decreasing
  View()
# Or
msleep %>% 
  filter(order %in% c("Carnivora", "Primates") &
           sleep_total < 18) %>% 
  select(name, order, sleep_total) %>% 
  arrange( - sleep_total) %>%      # Descending/Decreasing
  View()


msleep %>% 
  filter(order %in% c("Carnivora", "Primates") &
           sleep_total < 18) %>% 
  select(name, order, sleep_total) %>% 
  arrange(order) %>%      # Alphabetic
  View()



msleep %>% 
  mutate(brainwt*1000) %>% 
  View()

msleep %>% 
  mutate(brainwt = brainwt*1000) %>% 
  View()

msleep %>% 
  mutate(brainwt_in_grams = brainwt*1000) %>% 
  View()

msleep %>% 
  mutate(brainwt = brainwt*1000) %>% 
  rename(brainwt_in_grams = brainwt) %>% 
  View()



# Conditional changes (if_else)
# logical vector based on a condition
msleep$brainwt
msleep$brainwt > 0.01

msleep %>% 
  select(name, brainwt) %>% 
  drop_na(brainwt) %>%        # to remove NA from a variable
  View()

msleep %>% 
  select(name, brainwt) %>% 
  drop_na(brainwt) %>% 
  mutate(if_else(brainwt > 0.01, "Large", "Small")) %>% 
  View()

msleep %>% 
  select(name, brainwt) %>% 
  drop_na(brainwt) %>% 
  mutate(brain_size = if_else(brainwt > 0.01, "Large", "Small")) %>% 
  View()

size_of_brain <- msleep %>% 
  select(name, brainwt) %>% 
  drop_na(brainwt) %>% 
  mutate(brain_size = if_else(brainwt > 0.01, "Large", "Small"))
View(size_of_brain)
size_of_brain


size_of_brain %>% 
  mutate(recode(brain_size, "Large" = 1, "Small" = 2)) %>% 
  View()

size_of_brain %>% 
  mutate(brain_size_code = recode(brain_size, "Large" = 1, "Small" = 2)) %>% 
  View()

# to overwrite brain size code in brain_size column
size_of_brain %>% 
  mutate(brain_size = recode(brain_size, "Large" = 1, "Small" = 2)) %>% 
  View()



# Reshape the data from wide to long or long to wide 
install.packages("gapminder")
library(gapminder)

View(gapminder)

# select(data_set, variable_1, variable_2)
data <- select(gapminder, country, year, lifeExp)

data_2 <- gapminder %>% 
  select(country, year, lifeExp)

data_3 <- gapminder[ , c(1,3,4)]

data_4 <- gapminder[ , c("country","year","lifeExp")]

View(data)

# As we know, names() function gives names of the columns 
names(msleep)

data %>% 
  pivot_wider(names_from = year, values_from = lifeExp) %>% 
  View()

wide_data <- data %>% 
  pivot_wider(names_from = year, values_from = lifeExp)
View(wide_data)

dim(wide_data)

wide_data %>% 
  pivot_longer(2:13, 
               names_to = "year", values_to = "lifeExp") %>% 
  View()

long_data <- wide_data %>% 
  pivot_longer(2:13, 
               names_to = "year", values_to = "lifeExp")
View(long_data)

wide_data %>% 
  pivot_longer(2:length(wide_data), 
               names_to = "year", values_to = "lifeExp") %>% 
  View()


# doesn't work as expected
wide_data %>% 
  pivot_longer(8:11, 
               names_to = "year", values_to = "lifeExp") %>% 
  View()
# doesn't work as expected
wide_data %>% 
  pivot_longer( c(2,5,8), 
               names_to = "year", values_to = "lifeExp") %>% 
  View()


