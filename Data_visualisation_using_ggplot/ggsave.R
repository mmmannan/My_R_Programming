library(tidyverse)

?mpg

## aes(x, y, color, fill)

mpg %>% 
  ggplot(aes(x = cty, fill = drv)) +
  geom_density(alpha = 0.3) +
  theme_bw()
                 ## by default, plot = last_plot() as argument in ggsave
  ggsave("ggsave_mpg_plot.png",
         width = 10, height = 7, units = "cm",
         dpi = 300)



p <- mpg %>% 
  ggplot(aes(x = cty, fill = drv)) +
  geom_density(alpha = 0.3) +
  theme_bw()

?ggsave()

ggsave("ggsave_p.tiff", plot = p,
         width = 10, height = 7, units = "cm",
         dpi = 300)




