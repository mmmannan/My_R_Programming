library(RColorBrewer)

display.brewer.all(colorblindFriendly = TRUE)

?mpg

# scale_color_brewer
mpg %>% 
  ggplot(aes(displ, hwy, color = drv)) +
  geom_jitter(size = 5) +
  scale_color_brewer(palette = "Set2") +
  labs(x = "Engine Size", y = "Highway Fuel Efficiency", color = "Drive") +
  theme_minimal()


unique(mpg$class)
# scale_fill_brewer
mpg %>% 
  ggplot(aes(class, fill = class)) + 
  geom_bar() +
  scale_fill_brewer(palette = "Paired") +
  labs(x = "Type of Car", y = "Number", fill = "Car Types") +
  theme_minimal()


# scale_color_manual
mpg %>% 
  ggplot(aes(displ, hwy, color = drv)) +
  geom_jitter(size = 5) +
  scale_color_manual(values = c("4" = "#719AC9", "f" = "#75B99C",
                                "r" = "#C98D71")) +
  theme_minimal()


mpg %>% 
  ggplot(aes(displ, hwy)) +
  geom_jitter(color = "steelblue", size = 5) +
  theme_minimal()


mpg %>% 
  ggplot(aes(displ, hwy, color = drv)) +
  geom_jitter(size = 5) +
  scale_color_manual(values = c("4" = "darkblue", "f" = "darkred",
                                "r" = "darkgreen")) +
  theme_minimal()




