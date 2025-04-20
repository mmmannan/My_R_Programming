require(tidyverse)
View(starwars)

sw <- starwars %>% 
  select(mass,name,species,height,gender) %>%    # reorder columns
  rename(weight = mass, sex = gender)     # rename() function is used to change the name of a variable/column/attribute
View(sw)


sw <- starwars %>% 
  select(mass,name,species,height,gender,everything())   #selected variables agee dekhiye bakigulo (everything else) pore dekhabe
View(sw)