library(tidyverse)
View(starwars)

glimpse(starwars)
class(starwars$gender)
unique(starwars$gender)

starwars$gender <- as.factor(starwars$gender)
class(starwars$gender)

levels(starwars$gender)

starwars$gender <- factor((starwars$gender),
       levels = c("masculine", "feminine"))
levels(starwars$gender)     # swaping

names(starwars)

starwars %>% 
  select(name, height, ends_with("color")) %>% 
  names()

starwars %>% 
  select(name, height, ends_with("color")) %>% 
  View()

unique(starwars$hair_color)

starwars %>% 
  select(name, height, ends_with("color")) %>% 
  filter(hair_color %in% c("blond", "brown") &
           height < 180) %>% 
  View()

# Missing data
mean(starwars$height)
mean(starwars$height, na.rm= TRUE)  

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  View()

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  na.omit %>% 
  View()
# Same as
starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter(complete.cases(.)) %>%     ## observations without NA (complete cases)
  View()

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter( ! complete.cases(.)) %>%   ## observations with NA (not complete cases)
  View()

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  drop_na(height) %>%  
  View()

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter( ! complete.cases(.)) %>% 
  drop_na(height) %>%  
  View()

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter( ! complete.cases(.)) %>%    
  mutate(replace_na(hair_color, "none")) %>% 
  View()

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter( ! complete.cases(.)) %>% 
  mutate(hair_color = replace_na(hair_color, "none")) %>% 
  View()

# Duplicates
Names <- c("Peter", "John", "Andrew", "Peter")
Age <- c(22, 33, 44, 22)

Friends <- data.frame(Names, Age)
View(Friends)

duplicated(Friends)
Friends[ duplicated(Friends), ]
Friends[ ! duplicated(Friends), ]
Friends[ ! duplicated(Friends), ] %>%  View()

Friends %>%  distinct()
Friends %>%  distinct() %>%  View()

Friends %>% 
  distinct() %>%
  View()


# Recoding variables

starwars %>% 
  select(name, gender) %>% 
  mutate(recode(gender, "masculine" = 1, "feminine" = 2)) %>% 
  View()

starwars %>% 
  select(name, gender) %>% 
  mutate(gender = recode(gender, "masculine" = 1, "feminine" = 2)) %>% 
  View()













