
# faceting in 2 directions: both horizontally and vertically

library(tidyverse)
library(car)
library(forcats)

glimpse(Salaries)
names(Salaries)

class(Salaries$discipline)

Salaries %>% 
  mutate(discipline = factor(discipline, levels = c("A", "B"),
                             labels = c("Agriculture", "Biology"))) %>% 
  View()
# Or,
Salaries %>% 
  mutate(discipline = fct_recode(discipline,
                                 "Agriculture" = "A", "Biology" = "B")) %>% 
  View()


################################################################################
theme_set(theme_bw() +
            theme(title = element_text(colour = "steelblue", face = "bold")))
################################################################################


Salaries %>% 
  mutate(discipline = factor(discipline, levels = c("A", "B"),
                             labels = c("Agriculture", "Biology"))) %>% 
  ggplot(aes(yrs.since.phd, salary)) +
  geom_point(aes(color = rank), alpha = 0.5) +
  geom_smooth()

Salaries %>% 
  mutate(discipline = factor(discipline, levels = c("A", "B"),
                             labels = c("Agriculture", "Biology"))) %>% 
  ggplot(aes(yrs.since.phd, salary)) +
  geom_point(aes(color = rank), alpha = 0.5) +
  geom_smooth() +
  facet_grid(~discipline)

Salaries %>% 
  mutate(discipline = factor(discipline, levels = c("A", "B"),
                             labels = c("Agriculture", "Biology"))) %>% 
  ggplot(aes(yrs.since.phd, salary)) +
  geom_point(aes(color = rank), alpha = 0.5) +
  geom_smooth() +
  facet_grid(~sex)
  
Salaries %>% 
  mutate(discipline = factor(discipline, levels = c("A", "B"),
                             labels = c("Agriculture", "Biology"))) %>% 
  ggplot(aes(yrs.since.phd, salary)) +
  geom_point(aes(color = rank), alpha = 0.5) +
  geom_smooth() +
  facet_grid(sex~discipline)     # facet_grid(row_variable ~ column_variable)


################################################################################
Salaries %>% 
  mutate(discipline = factor(discipline, levels = c("A", "B"),
                             labels = c("Agriculture", "Biology"))) %>% 
  ggplot(aes(yrs.since.phd, salary)) +
  geom_point(aes(color = rank), alpha = 0.5) +
  geom_smooth() +
  facet_grid(sex~discipline) + 
  # facet_grid(row_variable ~ column_variable)
  labs(title = "Salary vs Years since PhD",
       x = "Number of years since PhD", y = "Current Salary",
       color = "Position") +
  theme(plot.title = element_text(hjust = 0.5))
################################################################################ 
  
 

