library(tidyverse)
install.packages("gganimate")
library(gganimate)
install.packages("babynames")
library(babynames)
library(gapminder)
library(viridis)
library(RColorBrewer)


View(babynames)
glimpse(babynames)

babynames %>% 
  filter(name %in% c("James", "Paul", "Andrew", "John")) %>% 
  filter(sex == "M") %>% 
  ggplot(aes(x = year, y = n, group = name, color = name)) +
  geom_line() +
  theme_bw() +
  labs(title = "Popularity of American names in the previous 30 years",
       x = "", y = "", color = "Names") +
  theme(plot.title = element_text(hjust = 0.5))


babynames %>% 
  filter(name %in% c("James", "Paul", "Andrew", "John")) %>% 
  filter(sex == "M") %>% 
  ggplot(aes(x = year, y = n, group = name, color = name)) +
  geom_line(linewidth = 1.5) +
  theme_bw() +
  scale_color_viridis(discrete = TRUE) +    ##### to get color palette
  labs(title = "Popularity of American names in the previous 30 years",
       x = "", y = "", color = "Names") +
  theme(plot.title = element_text(hjust = 0.5, size = 13, color = "steelblue")) +
  transition_reveal(year)

# Save at gif
anim_save("287_smooth_animation_with_tweenr.gif")



## To not to show the legend, use show.legend = FALSE

p <- ggplot(gapminder, 
            aes(x = gdpPercap, y=lifeExp, size = pop, colour = country)) +
  geom_point(show.legend = FALSE, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita", y = "Life expectancy")

p + transition_time(year)
  

?gapminder

gapminder %>% 
  ggplot(aes(gdpPercap, lifeExp, size = pop, color = continent)) +
  geom_point() +
  labs(x = "GDP per Capita", y = "Life Expectancy") +
  theme_bw()

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp,
                      size = pop, color = continent)) +
  geom_point() +
  scale_x_log10() +        ########
  theme_bw()  
  
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp,
                      size = pop, color = continent)) +
  geom_point() +
  scale_x_log10() +
  theme_bw() +
  labs(title = 'Year: {frame_time}',
       x = "GDP per Capita", y = "Life Expectancy") +
  theme(plot.title = element_text(size = 60, hjust = 0.5,
                                  color = "steelblue")) +
  transition_time(year)

# Save at gif
anim_save("271_ggplot2_animated_gif_chart_with_gganimate.gif")



unique(gapminder$continent)

gapminder %>% 
  filter(continent != "Oceania") %>% 
  ggplot(aes(gdpPercap, lifeExp, size = pop, color = continent)) + 
  geom_point(alpha = 0.5) +
  facet_wrap(~continent) +
  theme_bw()

gapminder %>% 
  filter(continent != "Oceania") %>% 
  ggplot(aes(gdpPercap, lifeExp, size = pop, color = country)) + 
  geom_point(alpha = 0.5, show.legend = FALSE) +
  facet_wrap(~continent) +
  theme_bw()

gapminder %>% 
  filter(continent != "Oceania") %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp, 
             size = pop, color = country)) +      ####
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +  ####
  scale_size(range = c(2, 12)) +   ####
  scale_x_log10() +    ####
  facet_wrap(~continent) +
  theme_bw() +
  labs(title = "Year: {frame_time}",
       x = "GDP per Capita", y = "Life Expectancy") +
  theme(plot.title = element_text(size = 60, hjust = 0.5,
                                  color = "steelblue")) +
  transition_time(year)




?ChickWeight
glimpse(ChickWeight)
View(ChickWeight)
names(ChickWeight)
unique(ChickWeight$Chick)
unique(ChickWeight$Diet)

ChickWeight %>% 
  ggplot(aes(Diet, weight, fill = Diet)) + 
  geom_bar(stat = "identity") +     ###########
  theme_bw()

## use stat = "identity" as argument in geom_bar 
## to create a bar plot with different variables along both axes

ggplot(ChickWeight, aes(x = Diet, y = weight, fill = Diet)) +
  geom_bar(stat = "identity") +
  theme_bw() +
  scale_fill_brewer(palette = "Set2") +
  labs(title = 'Time: {frame_time}',
       x = 'Diet', y = 'Weight') +
  theme(plot.title = element_text(size = 20, hjust = 0.5,
                                  color = "steelblue")) +
  transition_time(Time)
  
  
  
  
  
  

