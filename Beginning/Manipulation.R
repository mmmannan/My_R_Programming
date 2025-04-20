require(tidyverse)  # Call tidyverse to use vocabularies that it brings 
data()
View(starwars)

################################################################################
starwars %>%
  select(name,height,mass,sex,species) %>% 
  filter (species == "Human") %>% 
  na.omit()  %>% 
  mutate (height = height/100) %>% 
  mutate (BMI = mass / height^2) %>% 
  group_by(sex) %>%          # *************
  summarise(Average_BMI = mean(BMI)) %>% 
  View()
################################################################################

# na means missing value

starwars %>% 
  select(name, height, mass, sex, species) %>% 
  View()

starwars %>% 
  select(name, height, mass, sex, species) %>% 
  filter(species == "Human") %>% 
  View()

starwars %>% 
  select(name, height, mass, sex, species) %>% 
  filter(species == "Human") %>% 
  na.omit() %>% 
  View()

starwars %>% 
  select(name, height, mass, sex, species) %>% 
  filter(species == "Human") %>% 
  na.omit() %>% 
  mutate(height/100) %>% 
  View()

starwars %>% 
  select(name, height, mass, sex, species) %>% 
  filter(species == "Human") %>% 
  na.omit() %>% 
  mutate(height = height/100) %>% 
  mutate(mass/height^2) %>% 
  View()

starwars %>% 
  select(name, height, mass, sex, species) %>% 
  filter(species == "Human") %>% 
  na.omit() %>% 
  mutate(height = height/100) %>% 
  mutate(BMI = mass/height^2) %>% 
  View()

starwars %>% 
  select(name, height, mass, sex, species) %>% 
  filter(species == "Human") %>% 
  na.omit() %>% 
  mutate(height = height/100) %>% 
  mutate(BMI = mass/height^2) %>% 
  group_by(sex) %>% 
  View()


starwars %>% 
  select(name, height, mass, sex, species) %>% 
  filter(species == "Human") %>% 
  na.omit() %>% 
  mutate(height = height/100) %>% 
  mutate(BMI = mass/height^2) %>% 
  group_by(sex) %>% 
  summarise(Average_BMI = mean(BMI)) %>% 
  View()




