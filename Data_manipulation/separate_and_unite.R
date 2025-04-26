library(tidyverse)
library(gapminder)
View(gapminder)

# separate year into century and year
gapminder %>% 
  separate(col = year,
           into = c("century", "year"),
           sep = 2) %>% 
  View()

gapminder_1 <- gapminder %>% 
  separate(col = year,
           into = c("century", "year"),
           sep = 2)


## unite / combine century and year into date
gapminder_1 %>% 
  unite(col = data, century, year,
        sep = "") %>% 
  View()

gapminder_1 %>% 
  unite(col = data, century, year,
        sep = "-") %>% 
  View()












