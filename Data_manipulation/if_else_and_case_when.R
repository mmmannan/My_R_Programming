library(tidyverse)

install.packages("gtExtras")
library(gtExtras)               # to create tables

################################################################################
starwars %>% 
  select(name, hair_color, species) %>% 
  head(10) %>% 
  # Add table formatting
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Starwars Characters") %>% 
  gt_highlight_rows(rows = species == "Droid", fill = "steelblue") %>% 
  gt_highlight_rows(rows = hair_color == "brown", fill = "brown")
################################################################################


?if_else()
# if_else(conditions, true, false)
# if_else(1 or more conditions, TRUE, FALSE)

################################################################################
starwars %>% 
  select(name, hair_color, species) %>% 
  mutate(hair_color = if_else(is.na(hair_color) & species == "Droid", "no hair", hair_color)) %>% 
  # add table themes
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Starwars Characters") %>% 
  gt_highlight_rows(rows = species == "Droid", fill = "steelblue")
################################################################################


?case_when

################################################################################
starwars %>% 
  select(name, hair_color, species) %>% 
  mutate(hair_color = case_when(
    is.na(hair_color) & species == "Droid" ~ "no hair",
    hair_color == "brown" ~ "pink",
    TRUE ~ hair_color)) %>% 
  head(10) %>% 
  # add table themes
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Starwars Characters") %>% 
  gt_highlight_rows(rows = species == "Droid", fill = "steelblue") %>% 
  gt_highlight_rows(rows = hair_color == "pink", fill = "pink")
################################################################################



starwars %>% 
  select(name, hair_color, species) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Starwars Characters") %>% 
  gt_highlight_rows(rows = species == "Droid", fill = "steelblue") %>% 
  gt_highlight_rows(rows = hair_color == "brown", fill = "brown")

starwars %>% 
  select(name, hair_color, species) %>% 
  gt() %>% 
  tab_header(title = "Starwars Characters") %>% 
  gt_highlight_rows(rows = species == "Droid", fill = "steelblue") %>% 
  gt_highlight_rows(rows = hair_color == "brown", fill = "brown")

starwars %>% 
  select(name, hair_color, species) %>% 
  gt() %>% 
  gt_theme_dark() %>% 
  tab_header(title = "Starwars Characters") %>% 
  gt_highlight_rows(rows = species == "Droid", fill = "steelblue") %>% 
  gt_highlight_rows(rows = hair_color == "brown", fill = "brown")

starwars %>% 
  select(name, hair_color, species) %>% 
  gt() %>% 
  gt_theme_pff() %>% 
  tab_header(title = "Starwars Characters") %>% 
  gt_highlight_rows(rows = species == "Droid", fill = "steelblue") %>% 
  gt_highlight_rows(rows = hair_color == "brown", fill = "brown")

starwars %>% 
  select(name, hair_color, species) %>% 
  gt() %>% 
  gt_theme_dot_matrix() %>% 
  tab_header(title = "Starwars Characters") %>% 
  gt_highlight_rows(rows = species == "Droid", fill = "steelblue") %>% 
  gt_highlight_rows(rows = hair_color == "brown", fill = "brown")

starwars %>% 
  select(name, hair_color, species) %>% 
  gt() %>% 
  gt_theme_excel() %>% 
  tab_header(title = "Starwars Characters") %>% 
  gt_highlight_rows(rows = species == "Droid", fill = "steelblue") %>% 
  gt_highlight_rows(rows = hair_color == "brown", fill = "brown")

starwars %>% 
  select(name, hair_color, species) %>% 
  gt() %>% 
  gt_theme_espn() %>% 
  tab_header(title = "Starwars Characters") %>% 
  gt_highlight_rows(rows = species == "Droid", fill = "steelblue") %>% 
  gt_highlight_rows(rows = hair_color == "brown", fill = "brown")

starwars %>% 
  select(name, hair_color, species) %>% 
  gt() %>% 
  gt_theme_nytimes() %>% 
  tab_header(title = "Starwars Characters") %>% 
  gt_highlight_rows(rows = species == "Droid", fill = "steelblue") %>% 
  gt_highlight_rows(rows = hair_color == "brown", fill = "brown")


unique(starwars$eye_color)
starwars %>% 
  select(name, hair_color, eye_color, species) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Starwars Characters") %>% 
  gt_highlight_rows(rows = species == "Droid", fill = "steelblue") %>% 
  gt_highlight_rows(rows = hair_color == "brown", fill = "brown") %>% 
  gt_highlight_rows(rows = eye_color == "yellow", fill = "yellow")



