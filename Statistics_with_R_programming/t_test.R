library(tidyverse)

unique(starwars$sex)

my_data <- starwars %>% 
  select(sex, height) %>% 
  filter(sex %in% c("male", "female")) %>% 
  drop_na(height)

# Is the average height of males in the starwars universe
# more than the average height of females
t.test(height ~ sex, data = my_data)

# here p-value = 0.1181 means not statistically significant, means
# this difference in given sample size can be by chance

starwars %>% 
  select(sex, height) %>% 
  filter(sex %in% c("male", "female")) %>% 
  drop_na(height) %>% 
  t.test(height ~ sex, data = .)


# default arguments in R for t test
t.test(height ~ sex,
       data = my_data,
       alternative = two.sided,
       mu = 0,
       paired = FALSE,
       var.equal = FALSE,
       conf.level = 0.95)


starwars %>% 
  select(sex, height) %>% 
  filter(sex %in% c("male", "female")) %>% 
  drop_na(height) %>% 
  ggplot(aes(height, fill = sex, color = sex)) +
  geom_density(alpha = 0.3) +
  labs(title = "Distribution of Height by Sex",
       x = "Height",
       y = NULL)+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))
  




