# Analysis of variance (ANOVA)

library(tidyverse)
View(msleep)

# H0 = the average rem sleep of each vore categories are same

my_data <- msleep %>% 
  select(vore, sleep_rem) %>% 
  drop_na()

model_1 <- aov(sleep_rem ~ vore, data = my_data)
summary(model_1)

# Or
msleep %>% 
  select(vore, sleep_rem) %>% 
  drop_na() %>% 
  aov(sleep_rem ~ vore, data = .) %>% 
  summary()

# if p-value < 0.05 , statistically insignificant, reject H0


# graphics
msleep %>% 
  select(vore, sleep_rem) %>% 
  drop_na() %>% 
  ggplot(aes(sleep_rem)) +
  geom_density(fill = "steelblue", 
               color = 'steelblue',
               alpha = 0.3)+
  facet_wrap(~ vore)+
  labs(title = "Distribution of REM Sleep by Eating Category",
       x = NULL, y = NULL)+
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))


