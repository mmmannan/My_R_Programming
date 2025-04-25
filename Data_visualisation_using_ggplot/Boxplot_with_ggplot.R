library(tidyverse)
View(msleep)
glimpse(msleep)

names(msleep)

## A numeric (sleep_total) and a categorical (vore)

msleep %>% 
  ggplot(aes(vore, sleep_total)) +
  geom_boxplot()

msleep %>% 
  ggplot(aes(vore, sleep_total)) +
  geom_boxplot() +
  coord_flip() +
  theme_bw()

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(vore, sleep_total)) +
  geom_boxplot() +
  theme_bw()

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(vore, sleep_total, colour = vore)) +
  geom_boxplot() 

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(vore, sleep_total, fill = vore)) +
  geom_boxplot() +
  theme_bw()

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(vore, sleep_total, fill = vore, colour = vore)) +
  geom_boxplot() +
  theme_bw()

################################################################################
msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(vore, sleep_total, fill = vore)) +
  geom_boxplot() +
  coord_flip()+
  theme_bw()
################################################################################

# whisker = 1.5 * IQR


# Density plot x axis is numeric, fill is categorical
# y axis is probability of x axis values form 0 to 1
# Density plot is a similar idea of histogram to know the shape of data / distribution of data
# In density plot, probability / proportion is plotted along y axis instead of frequency
msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total))+
  geom_histogram()+
  theme_bw()

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total))+
  geom_histogram()+
  facet_wrap(~vore)+
  theme_bw()

msleep %>% 
  ggplot(aes(sleep_cycle))+    
  geom_density()       ### does not work 

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total))+
  geom_density()       ### does not work 

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total))+
  geom_density()+
  facet_wrap(~vore)

#########################################################
msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total))+
  geom_density()+
  facet_wrap(~vore)+
  theme_bw()
#########################################################

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total, fill = vore))+
  geom_density()+
  facet_wrap(~vore)+
  theme_bw()

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total, colour = vore))+
  geom_density()+
  facet_wrap(~vore)+
  theme_bw()

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total, fill = vore, colour = vore))+
  geom_density()+
  facet_wrap(~vore)+
  theme_bw()


msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total, fill = vore))+
  geom_density()+
  theme_bw()

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total, colour = vore))+
  geom_density()+
  theme_bw()

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total, fill = vore, colour = vore))+
  geom_density()+
  theme_bw()

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total, fill = vore))+
  geom_density(alpha = 0.3)+
  theme_bw()

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total, fill = vore, colour = vore))+
  geom_density(alpha = 0.3)+
  theme_bw()

################################################################################
msleep %>% 
  drop_na(vore) %>% 
  filter(vore == "carni" | vore == "omni") %>% 
  ggplot(aes(sleep_total, fill = vore))+
  geom_density(alpha = 0.2)+
  theme_bw()
  
msleep %>% 
  drop_na(vore) %>% 
  filter(vore %in% c("carni", "omni")) %>% 
  ggplot(aes(sleep_total, fill = vore))+
  geom_density(alpha = 0.3)+
  theme_bw()
################################################################################










