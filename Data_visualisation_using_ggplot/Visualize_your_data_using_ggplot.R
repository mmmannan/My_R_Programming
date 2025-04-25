library(tidyverse)
library(gapminder)

names(gapminder)
unique(gapminder$continent)

##################### 5 variables ##############################################
gapminder %>% 
  filter(continent %in% c("Africa", "Europe")) %>% 
  filter(gdpPercap < 30000) %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp,
             size = pop, colour = year)) +
  geom_point() +
  facet_wrap(~continent) +
  labs(title = "Life expectancy explained by GDP per capita",
       x = "GDP per capita", y = "Life expectancy") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))
################################################################################



