# Chi squared goodness of fit test

library(tidyverse)
library(forcats)
View(gss_cat)

unique(gss_cat$marital)
levels(gss_cat$marital)

my_data <- gss_cat %>% 
  select(marital) %>% 
  filter(marital %in% c("Married", "Never married", "Divorced")) %>% 
  mutate(marital = fct_drop(marital))

my_table <- table(my_data)
View(my_table)

# Use chi squared goodness of fit
chisq.test(my_table)
# Or
my_data %>% 
  table() %>% 
  chisq.test()


# graphics

my_data %>% 
  ggplot(aes(marital)) +
  geom_bar(fill = 'steelblue', alpha = 0.7) +
  theme_minimal()










