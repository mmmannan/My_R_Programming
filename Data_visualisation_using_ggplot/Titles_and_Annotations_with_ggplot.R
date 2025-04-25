library(tidyverse)

?mtcars
glimpse(mtcars)
unique(mtcars$gear)

theme_set(theme_bw() +
            theme(title = element_text(colour = "steelblue", face = "bold")))

mtcars %>% 
  ggplot(aes(wt, mpg, color = as.factor(gear))) + 
  geom_point(size = 2, alpha = 0.5) +
  labs(title = "Weight vs Miles per Gallon",
       x = "Weight", y = "Miles per Gallon",
       color = "Gears") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(legend.position = c(.90, .80))          

### hjust means horizontal adjustment


###################################################################################################
mtcars %>% 
  ggplot(aes(x = wt, y = mpg, color = factor(gear))) +
  geom_point(size = 3, alpha = 0.6) +
  labs(title = "Weight vs Miles per Gallon",
       x = "Weight", y = "Miles per Gallon",
       color = "Gears") +
  theme_bw() +
  theme(plot.title = element_text(size = 18, face = "bold",
                                  color = "steelblue", hjust = 0.5),
        axis.text = element_text(size = 10, color = "grey", face = "bold"),
        axis.title = element_text(size = 12, color = "steelblue"),
        legend.position = c(0.9, 0.8)) +
  annotate("text", x = 4, y = 30,
           label = "Notice the difference \n between cars with \n three and four gears",
           color = "black", face = "bold", size = 4) +
  geom_segment(x = 4.5, y = 27, xend = 5, yend = 17,
               arrow = arrow(length = unit(0.7, "cm")), color = "darkred", size = 1.5) +
  geom_segment(x = 3.4, y = 30, xend = 2.4, yend = 30,
               arrow = arrow(length = unit(0.7, "cm")), color = "darkgreen", size = 1.5)
###################################################################################################

mtcars %>% 
  ggplot(aes(x = wt, y = mpg, color = factor(gear))) +
  geom_point(size = 3, alpha = 0.6) +
  labs(title = "Weight vs Miles per Gallon",
       x = "Weight", y = "Miles per Gallon",
       color = "Gears") +
  theme_bw() +
  theme(plot.title = element_text(size = 18, face = "bold",
                                  color = "blue", hjust = 0.5),
        axis.text = element_text(size = 10, color = "green", face = "bold"),
        axis.title = element_text(size = 12, color = "red"),
        legend.position = c(0.9, 0.8)) +
  annotate("text", x = 4, y = 30,
           label = "Notice the difference \n between cars with \n three and four gears",
           color = "orange", face = "bold", size = 4) +
  geom_segment(x = 4.5, y = 27, xend = 5, yend = 17,
               arrow = arrow(length = unit(0.7, "cm")), color = "darkred", size = 1) +
  geom_segment(x = 3.4, y = 30, xend = 2.4, yend = 30,
               arrow = arrow(length = unit(0.7, "cm")), color = "darkgreen", size = 1)


