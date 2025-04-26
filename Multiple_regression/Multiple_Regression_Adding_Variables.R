
library(tidyverse)

################### y explained by x ######################

# Adding a numeric variable
?trees

trees %>% 
  ggplot(aes(Girth, Volume, colour = Height)) +
  geom_point(size = 2) +
  geom_smooth(method = lm, se = F) +
  theme_bw() +
  labs(title = "Tree Volume explained by Girth and Height") +
  theme(plot.title = element_text(hjust = 0.5))
  
lm(Volume ~ Girth + Height, data = trees) %>% 
  summary()


# Residual plot
?mtcars

model <- lm(mpg ~ wt, data = mtcars)
mtcars %>% 
  ggplot(aes(wt, mpg)) +
  geom_point(size = 2) +
  geom_smooth(method = lm, se = F) +
  geom_segment(aes(xend = wt, yend = predict(model)),
               color = "red") +
  theme_bw()


# Adding a categorical variable with two categories
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

## Previously in simple linear regression, R-squared value is 0.5868 (58% explanatory)
## Now in multiple linear regression by adding an extra variable (drv), R-squared value is 0.733 (73% explanatory)
## Therefore, adding variable makes the model more explanatory, more better


# Adding a categorical variable with more than two categories
install.packages("palmerpenguins")
library(palmerpenguins)
?palmerpenguins

?penguins    # dataset
View(penguins)
names(penguins)
dim(penguins)
glimpse(penguins)


# Plotting Bill Length vs Bill Depth
penguins %>% 
  ggplot(aes(bill_depth_mm, bill_length_mm)) +
  geom_point() +
  geom_smooth() +
  theme_bw() +
  labs(title = "Penguin Bill Length explained by Bill Depth",
       x = "Bill Depth (mm)", y = "Bill Length (mm)") +
  theme(plot.title = element_text(hjust = 0.5))
  
penguins %>% 
  ggplot(aes(bill_depth_mm, bill_length_mm)) +
  geom_point() +
  geom_smooth(method = lm) +
  theme_bw() +
  labs(title = "Penguin Bill Length explained by Bill Depth",
       x = "Bill Depth (mm)", y = "Bill Length (mm)") +
  theme(plot.title = element_text(hjust = 0.5))

penguins %>% 
  ggplot(aes(bill_depth_mm, bill_length_mm)) +
  geom_point() +
  geom_smooth(method = lm, se = F) +
  theme_bw() +
  labs(title = "Penguin Bill Length explained by Bill Depth",
       x = "Bill Depth (mm)", y = "Bill Length (mm)") +
  theme(plot.title = element_text(hjust = 0.5))

# simple linear regression
lm(bill_length_mm ~ bill_depth_mm, data = penguins) %>% 
  summary()

unique(penguins$species)
# Adding categorical variable species with 3 categories: Adelie, Gentoo and Chinstrap
penguins %>% 
  ggplot(aes(bill_depth_mm, bill_length_mm, color = species)) +
  geom_point(size = 3, alpha = 0.5) +
  geom_smooth(method = lm, se = F) +
  theme_bw() +
  labs(title = "Penguin Bill Length explained by Bill Depth",
       x = "Bill Depth (mm)", y = "Bill Length (mm)",
       color = "Species") +
  theme(plot.title = element_text(hjust = 0.5))

lm(bill_length_mm ~ bill_depth_mm + species, data = penguins) %>% 
  summary()



