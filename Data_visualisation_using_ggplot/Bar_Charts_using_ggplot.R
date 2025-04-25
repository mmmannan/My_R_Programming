library(tidyverse)

names(starwars)

###############################################################################
starwars %>% 
  filter(hair_color == "black" | hair_color == "brown") %>% 
  drop_na(sex) %>% 
  ggplot(aes(hair_color, fill = sex)) +
  geom_bar(position = "dodge", alpha = 0.5)+
  theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0.5))+
  labs(title = 'Gender and Hair Colour',
       x = "Hair Colour", y = 'Number')


starwars %>% 
  filter(hair_color %in% c('black', 'brown')) %>% 
  drop_na(sex) %>% 
  ggplot(aes(sex))+
  geom_bar(aes(fill = sex), alpha = 0.5)+
  facet_wrap(~hair_color)+
  theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0.5),
        legend.position = "none" )+
  labs(title = "Gender and Hair Colour",
       x = 'Hair Colour', y = "Number")
################################################################################

starwars %>% 
  ggplot(aes(hair_color, fill = sex)) +
  geom_bar(position = "dodge", alpha = 0.5)+
  theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0.5))+
  labs(title = 'Gender and Hair Colour',
       x = "Hair Colour", y = 'Number')

starwars %>% 
  drop_na(hair_color, gender) %>% 
  ggplot(aes(hair_color, fill = sex)) +
  geom_bar(position = "dodge", alpha = 0.5)+
  theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0.5))+
  labs(title = 'Gender and Hair Colour',
       x = "Hair Colour", y = 'Number') 


starwars %>% 
  filter(hair_color == "black" | hair_color == "brown") %>% 
  drop_na(sex) %>% 
  ggplot(aes(hair_color, fill = sex)) +
  geom_bar(alpha = 0.5)+      ### bars corresponding to the count of each gender are on one another
  theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0.5))+
  labs(title = 'Gender and Hair Colour',
       x = "Hair Colour", y = 'Number')

starwars %>% 
  filter(hair_color == "black" | hair_color == "brown") %>% 
  drop_na(sex) %>% 
  ggplot(aes(hair_color, fill = sex)) +
  geom_bar(position = "fill", alpha = 0.5)+      ### proportion (0 to 1) of gender along y axis
  theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0.5))+
  labs(title = 'Gender and Hair Colour',
       x = "Hair Colour", y = 'Proportion')


starwars %>% 
  filter(hair_color == "black" | hair_color == "brown") %>% 
  drop_na(sex) %>% 
  ggplot(aes(hair_color, fill = sex)) +
  geom_bar(position = "dodge", alpha = 0.5)+
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5))+
  labs(title = 'Gender and Hair Colour',
       x = "Hair Colour", y = 'Number')

starwars %>% 
  filter(hair_color == "black" | hair_color == "brown") %>% 
  drop_na(sex) %>% 
  ggplot(aes(hair_color, fill = sex)) +
  geom_bar(position = "dodge", alpha = 0.5)+
  theme_bw()+
  theme(panel.grid.major = element_blank(),
        plot.title = element_text(hjust = 0.5))+
  labs(title = 'Gender and Hair Colour',
       x = "Hair Colour", y = 'Number')


starwars %>% 
  filter(hair_color == "black" | hair_color == "brown") %>% 
  drop_na(sex) %>% 
  ggplot(aes(hair_color, fill = sex)) +
  geom_bar(position = "dodge", alpha = 0.5)+
  theme_bw()+
  theme(panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0.5))+
  labs(title = 'Gender and Hair Colour',
       x = "Hair Colour", y = 'Number')








