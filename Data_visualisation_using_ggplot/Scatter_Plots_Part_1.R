library(tidyverse)
data()
?mpg
View(mpg)
glimpse(mpg)

names(mpg)

mpg %>% 
  filter(hwy < 35) %>% 
  ggplot(aes(x = displ,
             y = hwy,
             colour = drv))+
  geom_point()+
  geom_smooth(method = lm,
              se = F)+
  labs(x = "Engine Size",
       y = "MPG on the highway",
       title = "Fuel Efficiency")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))+
  ggsave("MPG_hwy.jpg")
###########################################################################

mpg %>% 
  ggplot(aes(x = displ,
             y = hwy,
             colour = drv))+
  geom_point()+
  geom_smooth(method = lm,
              se = F)+
  labs(x = "Engine Size",
       y = "MPG on the highway",
       title = "Fuel Efficiency")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))


mpg %>% 
  ggplot(aes(x = displ,
             y = hwy,
             colour = drv))+
  geom_point()+
  geom_smooth(method = lm)+
  labs(x = "Engine Size",
       y = "MPG on the highway",
       title = "Fuel Efficiency")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))


mpg %>% 
  ggplot(aes(x = displ,
             y = hwy,
             colour = drv))+
  geom_point()+
  geom_smooth()+
  labs(x = "Engine Size",
       y = "MPG on the highway",
       title = "Fuel Efficiency")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))


mpg %>% 
  filter(hwy < 35) %>% 
  ggplot(aes(x = displ,
             y = hwy))+
  geom_point()+
  geom_smooth(method = lm,
              se = F)+
  labs(x = "Engine Size",
       y = "MPG on the highway",
       title = "Fuel Efficiency")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))
  

mpg %>% 
  filter(hwy < 35) %>% 
  ggplot(aes(x = displ,
             y = hwy))+
  geom_point(aes(colour = drv))+
  geom_smooth(method = lm,
              se = F)+
  labs(x = "Engine Size",
       y = "MPG on the highway",
       title = "Fuel Efficiency")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))


mpg %>% 
  filter(hwy < 35) %>% 
  ggplot(aes(x = displ,
             y = hwy))+
  geom_point(aes(colour = drv))+
  geom_smooth()+
  labs(x = "Engine Size",
       y = "MPG on the highway",
       title = "Fuel Efficiency")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))


mpg %>% 
  filter(hwy < 35) %>% 
  ggplot(aes(x = displ,
             y = hwy))+
  geom_point(aes(colour = drv))+
  geom_smooth(se = F)+
  labs(x = "Engine Size",
       y = "MPG on the highway",
       title = "Fuel Efficiency")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))


mpg %>% 
  filter(hwy < 35) %>% 
  ggplot(aes(x = displ,
             y = hwy,
             colour = drv))+
  geom_point(size = 4, alpha = 0.5)+
  geom_smooth(method = lm,
              se = F)+
  labs(x = "Engine Size",
       y = "MPG on the highway",
       title = "Fuel Efficiency")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))


mpg %>% 
  filter(hwy < 35) %>% 
  ggplot(aes(x = displ,
             y = hwy,
             colour = drv))+
  geom_point(size = 4, alpha = 0.5)+
  geom_smooth(method = lm)+
  labs(x = "Engine Size",
       y = "MPG on the highway",
       title = "Fuel Efficiency")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))














