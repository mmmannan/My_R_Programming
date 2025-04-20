# 10 data filtering tips
library(tidyverse)
View(msleep)

#1
mammals <- msleep %>% 
  select (name, sleep_total) %>% 
  filter (sleep_total > 17)
View(mammals)

#2
mammals = msleep %>% 
  select (name, order, sleep_total) %>% 
  filter ( ! sleep_total > 17)
  #filter (sleep_total <= 17)
View(mammals)

mammals = msleep %>% 
  filter(order == 'Primates')
View(mammals)

#3 : and
mammals = msleep %>% 
  select (name,order,bodywt) %>% 
  filter (order == 'Primates', bodywt < 50)
                            #&
View(mammals)

#4 : or
mammals <- msleep %>% 
  select (name,order,bodywt) %>% 
  filter (order == 'Primates' | bodywt < 50)
# All Primates and All which have bodywt < 50
View(mammals)

#5
mammals <- msleep %>% 
  select (name, sleep_total, bodywt) %>% 
  filter (name %in% c('Human','Dog','Goat',"Cow"))
View(mammals)

#6   filter (name=="Human"| name =='Dog'|name=='Goat'|name == "Cow")


#7
mammals = msleep %>% 
  select (name,conservation, bodywt) %>% 
  filter (is.na(conservation))
View(mammals)


#8
mammals = msleep %>% 
  select (name,conservation,bodywt) %>% 
  filter ( ! is.na(conservation))
View(mammals)


#9
mammals <- msleep %>% 
  select(name,bodywt,brainwt) %>% 
  filter(between(bodywt,40,100))   #filter(between(variable_name,value,value))
View(mammals)

mammals = msleep %>% 
  select(name,bodywt,brainwt) %>% 
  filter(!between(bodywt,40,100))
View(mammals)

#10
mammals = msleep %>% 
  select(name, sleep_total) %>% 
  filter( near ( sleep_total, 17, tol = 0.5))    #filer(near(variable_name, value, tol = difference))
View(mammals)

