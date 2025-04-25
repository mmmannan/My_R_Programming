library(tidyverse)
?msleep
View(msleep)
glimpse(msleep)

names(msleep)

# two or more numeric

msleep %>% 
  ggplot(aes(bodywt, brainwt)) +
  geom_point()

msleep %>% 
  ggplot(aes(bodywt, brainwt)) +
  geom_point(aes(colour = sleep_total, size = awake))

msleep %>% 
  ggplot(aes(bodywt, brainwt)) +
  geom_point(aes(colour = sleep_total, size = awake))+
  labs(x = "Body Weight", y = "Brain Weight",
       title = "Brain VS Body Weight")+
  theme_minimal()

### aes() includes x axis, y axis, colour, size

msleep %>% 
  ggplot(aes(bodywt, brainwt)) +
  geom_point(aes(colour = sleep_total, size = awake)) +
  geom_smooth()          ### Because of keeping the outliers, the graph is looking bad

msleep %>% 
  ggplot(aes(bodywt, brainwt)) +
  geom_point(aes(colour = sleep_total, size = awake)) +
  geom_smooth() +      ### Because of keeping the outliers, the graph is looking bad
  labs(x = "Body Weight", y = "Brain Weight",
       title = "Brain VS Body Weight")+
  theme_minimal()

msleep %>% 
  ggplot(aes(bodywt, brainwt)) +
  geom_point(aes(colour = sleep_total, size = awake))+
  geom_smooth(method = lm)+
  labs(x = "Body Weight", y = "Brain Weight",
       title = "Brain VS Body Weight")+
  theme_minimal()

msleep %>% 
  ggplot(aes(bodywt, brainwt)) +
  geom_point(aes(colour = sleep_total, size = awake))+
  geom_smooth(method = lm, se = F)+
  labs(x = "Body Weight", y = "Brain Weight",
       title = "Brain VS Body Weight")+
  theme_minimal()


msleep %>% 
  select(name, brainwt, bodywt) %>% 
  filter(bodywt > 1000) %>% 
  View()

msleep %>% 
  select(name, brainwt, bodywt) %>% 
  filter(brainwt > 2) %>% 
  View()

# Remove the outliers by filtering

msleep %>% 
  filter(brainwt < 2) %>%     # Not looking good
  ggplot(aes(bodywt, brainwt)) +
  geom_point(aes(colour = sleep_total, size = awake)) +
  geom_smooth() +
  labs(x = "Body Weight", y = "Brain Weight",
       title = "Brain VS Body Weight")+
  theme_minimal()


## plot using data from small mammals which have body weight < 2 kg
## Remove other observations by filtering
msleep %>% 
  filter(bodywt < 2) %>%     
  ggplot(aes(bodywt, brainwt)) +
  geom_point(aes(colour = sleep_total, size = awake)) +
  geom_smooth() +
  labs(x = "Body Weight", y = "Brain Weight",
       title = "Brain VS Body Weight")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))

msleep %>% 
  filter(bodywt < 2) %>%     
  ggplot(aes(bodywt, brainwt)) +
  geom_point(aes(colour = sleep_total, size = awake)) +
  geom_smooth(method = lm) +
  labs(x = "Body Weight", y = "Brain Weight",
       title = "Brain VS Body Weight")+
  theme_minimal()

msleep %>% 
  filter(bodywt < 2) %>%     
  ggplot(aes(bodywt, brainwt)) +
  geom_point(aes(colour = sleep_total, size = awake)) +
  geom_smooth(method = lm, se = F) +
  labs(x = "Body Weight", y = "Brain Weight",
       title = "Brain VS Body Weight")+
  theme_minimal()
################################################################################
