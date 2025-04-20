require(tidyverse)

# recode() function is used to change / replace values of a variable

sw_2 <- starwars %>% 
  select(name,height,mass,sex) %>%
  rename(weight = mass) %>% 
  na.omit() %>%    
  mutate(height = height / 100) %>% 
  filter(sex %in% c("male","female")) %>% 
  #filter(sex == "male" | sex == "female")
  mutate(sex = recode(sex, male="m", female="f")) %>% 
  mutate(size = weight > 75 & height > 1.7,
         size = if_else(size == TRUE, "big", "small" ))
View(sw_2)

# recode means replacing existing values with new values. 

unique(starwars$sex)

starwars %>% 
  select(name,height,mass,sex) %>% 
  View()

starwars %>% 
  select(name,height,mass,sex) %>% 
  rename(weight = mass) %>% 
  View()

starwars %>% 
  select(name,height,mass,sex) %>% 
  rename(weight = mass) %>% 
  na.omit() %>% 
  View()

starwars %>% 
  select(name,height,mass,sex) %>% 
  rename(weight = mass) %>% 
  na.omit() %>% 
  mutate(height/100) %>% 
  View()  
  
starwars %>% 
  select(name,height,mass,sex) %>% 
  rename(weight = mass) %>% 
  na.omit() %>% 
  mutate(height = height/100) %>% 
  View()

starwars %>% 
  select(name,height,mass,sex) %>% 
  rename(weight = mass) %>% 
  na.omit() %>% 
  mutate(height = height/100) %>% 
  filter(sex %in% c("male", "female")) %>% 
  View()

starwars %>% 
  select(name,height,mass,sex) %>% 
  rename(weight = mass) %>% 
  na.omit() %>% 
  mutate(height = height/100) %>% 
  filter(sex == "male" | sex == "female") %>% 
  View()

starwars %>% 
  select(name,height,mass,sex) %>% 
  rename(weight = mass) %>% 
  na.omit() %>% 
  mutate(height = height/100) %>% 
  filter(sex %in% c("male", "female")) %>% 
  mutate(recode(sex, male="m", female="f")) %>% 
  View()

starwars %>% 
  select(name,height,mass,sex) %>% 
  rename(weight = mass) %>% 
  na.omit() %>% 
  mutate(height = height/100) %>% 
  filter(sex %in% c("male", "female")) %>% 
  mutate(sex = recode(sex, male="m", female="f")) %>% 
  View()

starwars %>% 
  select(name,height,mass,sex) %>% 
  rename(weight = mass) %>% 
  na.omit() %>% 
  mutate(height = height/100) %>% 
  filter(sex %in% c("male", "female")) %>% 
  mutate(sex = recode(sex, male="m", female="f")) %>% 
  mutate(size = weight > 75 & height > 1.7,
         size = ifelse(size == TRUE, "Big", "Small")) %>% 
  View()

starwars %>% 
  select(name,height,mass,sex) %>% 
  rename(weight = mass) %>% 
  na.omit() %>% 
  mutate(height = height/100) %>% 
  filter(sex %in% c("male", "female")) %>% 
  mutate(sex = recode(sex, male="m", female="f")) %>% 
  mutate(size = weight > 75 & height > 1.7,
         size = if_else(size == TRUE, "Big", "Small")) %>% 
  View()











  
  