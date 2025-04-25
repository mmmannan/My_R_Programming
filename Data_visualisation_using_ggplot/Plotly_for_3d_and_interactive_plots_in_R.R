library(tidyverse)
install.packages("plotly")
library(plotly)

unique(starwars$eye_color)

# Interactive plot
p <- starwars %>% 
  drop_na(height, mass, eye_color) %>% 
  filter(mass < 250) %>% 
  filter(eye_color %in% c("blue", "red", "brown", "black", "orange")) %>% 
  ggplot(aes(x = height, y = mass, color = eye_color)) +
  geom_jitter(size =6, alpha = 0.5) +
  scale_color_manual(values = c("blue" = "blue", "red" = "red", 
                                "brown" = "brown", "black" = "black", 
                                "orange" = "orange")) +
  theme_bw() +
  theme(legend.position = c(0.05, 0.98),
        legend.justification = c("left", "top")) +
  labs(title = "Height, mass and eye color",
       x = "Height", y = "Mass", color = "Eye Color") +
  theme(plot.title = element_text(hjust = 0.5))
  
p

ggplotly(p)


# 3D scatter plot & also interactive
trees %>% 
  plot_ly(x = ~Girth, y = ~Height, z = ~Volume)


# Surface
?volcano
View(volcano)
glimpse(volcano)
names(volcano)

plot_ly(z = volcano, type = "surface")




