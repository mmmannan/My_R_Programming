
## arguments in aes()
## arguments in geometry


# Scatter plot
?mtcars
mtcars %>% 
  ggplot(aes(x = wt, y = mpg)) +
  geom_point(size = 3, colour = "steelblue", alpha = 0.6) +
  labs(title = "Weight vs Miles per Gallon", 
       x = "Weight", y = "Miles per Gallon") +
  theme_bw()


# Line Graph
?Orange
Orange %>% 
  ggplot(aes(x = age, y = circumference, color = Tree)) +
  geom_line() +
  labs(title = "Circumference as a function of age",
       x = "Age", y = "Circumference") +
  theme_bw()


# Bar Chart
?mpg 
unique(mpg$class)  

mpg %>% 
  ggplot(mapping = aes(x = class)) +
  geom_bar(fill = "steelblue", alpha = 0.8) +
  labs(title = "Number of cars in each class",
       x = "", y = "") +
  theme_bw()
  

# Histogram
?mpg
mpg %>% 
  ggplot(aes(x = cty)) +
  geom_histogram(binwidth = 2, fill = "steelblue", alpha = 0.8) +
  labs(title = "Fuel efficiency of cars in the city",
       x = "Miles per gallon", y = "Number of cars") +
  theme_bw()

### Histogram ===== Density plot

# Density plot
mpg %>% 
  ggplot(aes(x = cty)) +
  geom_density(fill = "steelblue", alpha = 0.8) +
  labs(title = "Fuel efficiency of cars in the city",
       x = "Miles per gallon", y = "") +
  theme_bw()

mpg %>% 
  filter(drv %in% c("f", "r")) %>% 
  ggplot(aes(x = cty, fill = drv, color = drv)) +
  geom_density(alpha = 0.3) +
  labs(title = "Fuel efficiency of cars in the city",
       x = "Miles per gallon", y = "") +
  theme_bw()

mpg %>% 
  filter(drv %in% c("f", "r")) %>% 
  ggplot(aes(x = cty, fill = drv, color = drv)) +
  geom_density(alpha = 0.3) +
  labs(title = "Fuel efficiency of cars in the city",
       x = "Miles per gallon", y = "",
       fill = "Drive") +
  theme_bw()


# Box plot
?mpg
mpg %>% 
  ggplot(aes(cty, fill = drv)) +
  geom_boxplot() +
  labs(title = "Fuel efficiency of cars in the city",
       x = "Miles per gallon", fill ="Drive") +
  theme_bw()

mpg %>% 
  filter(cty < 25) %>% 
  ggplot(aes(x = cty, fill = drv)) +
  geom_boxplot(alpha = 0.5) +
  labs(title = "Fuel efficiency of cars in the city",
       x = "Miles per gallon", fill ="Drive") +
  theme_bw()


# Area plot
ggplot(mpg, aes(x = displ)) +
  geom_area(aes(y = hwy, fill = "Highway")) +
  geom_area(aes(y = cty, fill = "City")) +
  labs(title = "Highway vs City driving",
       x = "Engine Displacement (L)",
       y = "Miles per Gallon", fill = "") +
  theme_bw()


# Raster plot
# geom_raster() creates a colored heatmap,
# with two variables acting as the x and y coordinate and 
# a third variable mapping onto a color
?faithfuld
glimpse(faithfuld)
View(faithfuld)

faithfuld %>% 
  ggplot(aes(x = waiting, y = eruptions, fill = density)) + 
  geom_raster() +
  labs(title = "Old Faithful Geyser",
       x = "Waiting time between erruptions",
       y = "Duration of erruptions",
       fill = "Density") +
  theme_bw()




  