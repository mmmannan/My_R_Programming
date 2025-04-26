
lm(weight ~ height, data = women) %>% 
  summary()

women %>% 
  ggplot(aes(height, weight)) +
  geom_point(size = 3, alpha = 0.5)+
  geom_smooth(method = lm, se = F)+
  theme_bw()+
  labs(title = "Weight explained by Height in Women",
       x = "Height (explanatory or independent variable)",
       y = "Weight (outcome or dependent variable")+
  theme(plot.title = element_text(hjust = 0.5))



View(trees)
glimpse(trees)


lm(formula = Volume ~ Girth + Height, data = trees) %>% 
  summary()
## In this example, we added an additional numeric variable (Height) as an additional explanatory variable.
## This is now multiple regression.
## Ignore Multiple R-squared, Use Adjusted R-squared. 
## Adjusted R-squared 0.9442 means 94% change in tree volume can be explained by both girth and height in combination.

trees %>% 
  ggplot(aes(Girth, Volume, colour = Height)) +
  geom_point(size = 3)+
  geom_smooth(method = lm, se = F)+
  theme_bw()+
  labs(title = "Tree Volume explained by Girth and Height",
       x = "Girth",
       y = "Volume")+
  theme(plot.title = element_text(hjust = 0.5))



?mpg
View(mpg)
glimpse(mpg)
unique(mpg$drv)

class(mpg$drv)

xyz <- mpg %>% 
  mutate(drv = as.factor(drv)) %>% 
  mutate(drv = fct_collapse(drv,
                      "2" = c("f", "r")))
class(xyz$drv)
unique(xyz$drv)

mpg %>% 
  mutate(drv = as.factor(drv)) %>% 
  mutate(drv = fct_collapse(drv,
                            "2" = c("f", "r"))) %>% 
  ggplot(aes(displ, hwy, colour = drv)) +
  geom_point(size = 2)+
  geom_smooth(method = lm, se = F)+
  theme_bw()+
  labs(title = "Highway Fuel Efficiency explained by engine size",
       x = "Engine size",
       y = "Highway fuel efficiency",
       colour = "Drive")+
  theme(plot.title = element_text(hjust = 0.5))


#In this example, we added an additional categorical variable (drv) as an additional explanatory variable.
mpg %>% 
  mutate(drv = as.factor(drv)) %>% 
  mutate(drv = fct_collapse(drv,
                            "2" = c("f", "r"))) %>% 
  lm(formula = hwy ~ displ + drv, data = .) %>% 
  summary()



# Idea of Interactions


?mtcars
View(mtcars)
glimpse(mtcars)
names(mtcars)

mtcars %>% 
  ggplot(aes(wt, mpg)) +
  geom_point() +
  geom_smooth(method = lm, se = F) +
  theme_bw() +
  labs(title = "Fuel efficiency explained by weight of cars",
       x = "Weight of cars", y = "Fuel efficiency") +
  theme(plot.title = element_text(hjust = 0.5))

class(mtcars$am)  
unique(mtcars$am)

abc <- mtcars %>% 
  mutate(am = as.factor(am)) 

View(abc)
glimpse(abc)
class(abc$am)

abc <- mtcars %>% 
  mutate(am = as.factor(am)) %>% 
  mutate(am = recode(am, "0" ="Automatic", "1" ="Manual"))

View(abc)
glimpse(abc)
class(abc$am)
unique(abc$am)


mtcars %>% 
  mutate(am = as.factor(am)) %>% 
  mutate(am = recode(am, "0" ="Automatic", "1" ="Manual")) %>% 
  ggplot(aes(wt, mpg, colour = am)) +
  geom_point() +
  geom_smooth(method = lm, se = F) +
  theme_bw() +
  labs(title = "Fuel efficiency explained by weight of cars",
       x = "Weight of cars", y = "Fuel efficiency",
       colour = "Transmission") +
  theme(plot.title = element_text(hjust = 0.5))


mtcars %>% 
  lm(formula = mpg ~ wt * am, data = .) %>% 
  summary()



## Creating residual plot
model <- lm(mpg ~ wt, data = mtcars)

mtcars %>% 
  ggplot(aes(wt, mpg)) +
  geom_point(size = 2) +
  geom_smooth(method = lm, se = F) +
  geom_segment(aes(xend = wt, yend = predict(model)),
               color = "red") +  # Add residuals
  theme_bw() +
  labs(title = "Fuel efficiency explained by weight of cars",
       x = "Weight of cars", y = "Fuel efficiency") +
  theme(plot.title = element_text(hjust = 0.5))



