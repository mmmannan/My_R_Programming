library(tidyverse)

?mpg

# Plotting displ vs hwy
mpg %>% 
  ggplot(aes(x = displ, y = hwy)) + 
  geom_jitter() +
  geom_smooth(method = lm, se = F) +
  theme_bw() +
  labs(title = "Highway Fuel Efficiency explained by engine size",
       x = "Engine size", y = "Highway fuel efficiency") +
  theme(plot.title = element_text(hjust = 0.5))

# simple linear regression
lm(hwy ~ displ, data = mpg) %>% 
  summary()
# In this simple linear regression, R-squared value is 0.5868
# It means 58% of change in highway fuel efficiency can be explained by engine size
# This model is 58 % explanatory


# Adding categorical variable drv with 2 categories: 4_wheeler and 2_wheeler
mpg %>% 
  mutate(drv = fct_recode(drv, "2" = "f", "2" = "r")) %>%
  ggplot(aes(displ, hwy, color = drv)) +
  geom_point() +
  geom_smooth(method = lm, se = F) +
  theme_bw() +
  labs(title = "Highway Fuel Efficiency explained by engine size",
       x = "Engine size", y = "Highway fuel efficiency",
       color = "Drive") +
  theme(plot.title = element_text(hjust = 0.5))

# multiple linear regression  
mpg %>% 
  mutate(drv = fct_recode(drv, "2" = "f", "2" = "r")) %>% 
  lm(hwy ~ displ + drv, data = .) %>% 
  summary()
# in this multiple linear regression, adjusted R-squared value is 0.733
# This means 73% of change in highway fuel efficiency can be explained by both engine size an drive in combination.
# This model is 73% explanatory

# Therefore, adding variable makes the model more explanatory, more improved.

# method 1:
# Adding incrementally one variable at a time, we build up a model getting better and better
# until by adding an additional variable, we see no improvement. It doesn't get any better. Let's top there.

# You can do the other way around.
# method 2:
# You can start with all of the variables and then remove one variable at a time
# As you remove them, initially makes no difference, makes no difference,
# then, eventually as you start removing them the model gets weaker and 
# then, you sort of know where I should stop removing them


######## AKAIKE criteria


library(MASS)
?swiss
View(swiss)
glimpse(swiss)

lm(Fertility ~ . , data = swiss) %>% 
  step(direction = "backward", trace = 0) %>% 
  summary()
# Adjusted R-squared:  0.6707. This model has an explanatory power of 67%
# 67% of Fertility can be explained by these set of variables (all variables in the data set)

# Fertility is the outcome variable
# Fertility ~ . means Fertility explained by all of the variables
# direction = backward or forward is either method 1 or method 2
# trace = 0 to see the final answer, not want to see all of workings in every steps

lm(Fertility ~ . , data = swiss) %>% 
  step(direction = "backward") %>% 
  summary()



lm(Fertility ~ . , data = swiss) %>% 
  step(direction = "forward", trace = 0) %>% 
  summary()

lm(Fertility ~ . , data = swiss) %>% 
  step(direction = "forward") %>% 
  summary()























