# Outliers



# Collinearity

mtcars %>% 
  select(mpg, disp, hp) %>% 
  cor() %>%
  round(2)
