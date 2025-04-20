### Understanding your missing data
# 1) The magnitude of missing data
# 2) The distribution of missing data
# 3) Is relationship to other variables
# 4) The nature of missing data(randomness)

### Dealing with missing data
# 1) Do nothing
# 2) Delete
# 3) Replace
# 4) Impute

library(tidyverse)
install.packages("naniar")
library(naniar)
library(gtExtras)

View(airquality)
View(starwars)


# The magnitude of missing data: For each variables how many values are missing?
miss_var_summary(airquality)            # miss_var_summary() function is from naniar package

# Table
miss_var_summary(airquality) %>% 
  gt()

miss_var_summary(airquality) %>% 
  gt() %>% 
  gt_theme_guardian()

miss_var_summary(airquality) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Missingness of variables")

miss_var_summary(starwars) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Missingness of variables")


# Plot
# Visualize the missingness
gg_miss_var(airquality)         # gg_miss_var() function is from naniar package
gg_miss_var(starwars)


# Table of observations with missing data
airquality %>% 
  filter(!complete.cases(.)) %>% 
  head(10) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Rows that contain missing values")

airquality %>% 
  filter(!complete.cases(.)) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Rows that contain missing values")

airquality %>% 
  filter(!complete.cases(.)) %>% 
  gt()
  
airquality %>% 
  filter(!complete.cases(.))
  
airquality %>% 
  filter(!complete.cases(.)) %>% 
  View()

airquality %>% 
  filter(complete.cases(.))

airquality %>% 
  filter(complete.cases(.)) %>% 
  View()

airquality %>% 
  filter(complete.cases(.)) %>% 
  gt()

airquality %>% 
  filter(complete.cases(.)) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Rows that contain no missing value")


# The distribution of missing data
vis_miss(airquality)                # vis_miss() function is from naniar package
vis_miss(starwars)



airquality %>% 
  mutate(factor(is.na(Ozone))) %>% 
  View()

airquality %>% 
  mutate(Missing_Ozone = factor(is.na(Ozone))) %>% 
  View()

airquality %>% 
  mutate(Missing_Ozone = factor(is.na(Ozone),
                                levels = c("TRUE", "FALSE"),
                                labels = c("Missing", "Not Missing"))) %>% 
  View()
  
airquality %>% 
  mutate(Missing_Ozone = factor(is.na(Ozone),
                                levels = c("TRUE", "FALSE"),
                                labels = c("Missing", "Not Missing"))) %>% 
  ggplot(aes(x = Wind, fill = Missing_Ozone)) +
  geom_histogram()
  
airquality %>% 
  mutate(Missing_Ozone = factor(is.na(Ozone),
                                levels = c("TRUE", "FALSE"),
                                labels = c("Missing", "Not Missing"))) %>% 
  ggplot(aes(x = Wind, fill = Missing_Ozone)) +
  geom_histogram() +
  labs(title = "Distribution of Wind Speeds for Missing vs. Not Missing Ozone",
       x = "Wind Speed", y = "Ozone Observations",
       fill = "Missingness") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

################################################################################
# The relationship to one variable
airquality %>% 
  mutate(Missing_Ozone = factor(is.na(Ozone),
                                levels = c("TRUE", "FALSE"),
                                labels = c("Missing", "Not Missing"))) %>% 
  ggplot(aes(x = Wind, fill = Missing_Ozone)) +
  geom_histogram(position = "stack") +
  labs(title = "Distribution of Wind Speeds for Missing vs. Not Missing Ozone",
       x = "Wind Speed", y = "Ozone Observations",
       fill = "Missingness") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))


airquality %>% 
  mutate(Missing_Ozone = factor(is.na(Ozone),
                                levels = c("FALSE", "TRUE"),
                                labels = c("Not Missing", "Missing"))) %>% 
  ggplot(aes(x = Wind, fill = Missing_Ozone)) +
  geom_histogram(position = "stack") +
  labs(title = "Distribution of Wind Speeds for Missing vs. Not Missing Ozone",
       x = "Wind Speed", y = "Ozone Observations",
       fill = "Missingness") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))
################################################################################


# Pattern in missingness: Is it random?
airquality %>% 
  ggplot(aes(x = Wind, y = Temp)) +
  geom_point() +
  facet_wrap(~is.na(Ozone))

airquality %>% 
  ggplot(aes(x = Wind, y = Temp)) +
  geom_point() +
  facet_wrap(~is.na(Ozone)) +
  theme_bw() +
  labs(title = "Missing Ozone Data by Wind and Temperature",
       x = "Wind Speed", y = "Temperature") +
  theme(plot.title = element_text(hjust = 0.5))

airquality %>% 
  ggplot(aes(x = Wind, y = Temp,
             colour = is.na(Ozone))) +
  geom_point() +
  facet_wrap(~is.na(Ozone)) +
  theme_bw() +
  labs(title = "Missing Ozone Data by Wind and Temperature",
       x = "Wind Speed", y = "Temperature") +
  theme(plot.title = element_text(hjust = 0.5))

airquality %>% 
  ggplot(aes(x = Wind, y = Temp,
             colour = is.na(Ozone))) +
  geom_point() +
  facet_wrap(~is.na(Ozone)) +
  theme_bw() +
  labs(title = "Missing Ozone Data by Wind and Temperature",
       x = "Wind Speed", y = "Temperature",
       colour = "Missing Ozone Data") +
  theme(plot.title = element_text(hjust = 0.5))

airquality %>% 
  ggplot(aes(x = Wind, y = Temp,
             colour = is.na(Ozone), size = Solar.R)) +
  geom_point() +
  facet_wrap(~is.na(Ozone)) +
  theme_bw() +
  labs(title = "Missing Ozone Data by Wind and Temperature",
       x = "Wind Speed", y = "Temperature",
       colour = "Missing Ozone Data") +
  theme(plot.title = element_text(hjust = 0.5))


################################################################################
airquality %>% 
  ggplot(aes(x = Wind, y = Temp,
             colour = is.na(Ozone), size = Solar.R)) +
  geom_point(alpha = 0.7) +
  facet_wrap(~is.na(Ozone)) +
  theme_bw() +
  labs(title = "Missing Ozone Data by Wind and Temperature",
       x = "Wind Speed", y = "Temperature",
       colour = "Missing Ozone Data",
       size = "Solar Radiation") +
  theme(plot.title = element_text(hjust = 0.5))
################################################################################


# Dealing with missing data
starwars %>% 
  select(name, height, mass, hair_color) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Starwars Characters") %>% 
  gt_highlight_rows(rows = is.na(hair_color), fill = "steelblue") %>% 
  gt_highlight_rows(rows = is.na(height) | is.na(mass), fill = "brown")

starwars %>% 
  select(name, mass, height, hair_color) %>% 
  head(15) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Starwars Characters") %>% 
  gt_highlight_rows(rows = is.na(mass), fill = "steelblue") %>% 
  gt_highlight_rows(rows = is.na(hair_color), fill = "lightpink")


# 1) Drop missing values
starwars %>% 
  select(name, mass, height, hair_color) %>% 
  drop_na(mass) %>% 
  head(20) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Starwars Characters")

starwars %>% 
  select(name, height, mass, hair_color) %>% 
  drop_na(height, mass) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Starwars Characters")


# 2) Change the missing values

starwars %>% 
  select(name, hair_color, species) %>% 
  head(5) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Starwars Characters")

starwars %>% 
  select(name, hair_color, species) %>% 
  filter(species == "Droid") %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Starwars Characters")

starwars %>% 
  select(name, hair_color, species) %>%
  filter(species == "Droid") %>% 
  mutate(case_when(is.na(hair_color) & species == "Droid" ~ "none",
                    TRUE ~ hair_color)) %>% 
  View()
starwars %>% 
  select(name, hair_color, species) %>%
  filter(species == "Droid") %>% 
  mutate(hair_color = case_when(is.na(hair_color) & species == "Droid" ~ "none",
                   TRUE ~ hair_color)) %>% 
  View()

starwars %>% 
  select(name, hair_color, species) %>%
  filter(species == "Droid") %>% 
  mutate(hair_color = case_when(is.na(hair_color) & species == "Droid" ~ "none",
                                TRUE ~ hair_color)) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Starwars Characters")


# 3) Imputation

starwars %>% 
  select(name, height) %>% 
  filter(is.na(height)) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Starwars Characters")

# Whenever height is missing, replace it with the median value of all of the heights

median(starwars$height)    # problem due to NA
median(starwars$height, na.rm = TRUE)

starwars %>% 
  select(name, height) %>% 
  mutate(case_when(is.na(height) ~ median(starwars$height, na.rm = TRUE),
                   TRUE ~ height)) %>% 
  View()

starwars %>% 
  mutate(height = case_when(is.na(height) ~ median(starwars$height, na.rm = TRUE),
                   TRUE ~ height)) %>%
  select(name, height) %>% 
  View()  

starwars %>% 
  mutate(height = case_when(is.na(height) ~ median(starwars$height, na.rm = TRUE),
                            TRUE ~ height)) %>% 
  select(name, height) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Starwars Characters")

starwars %>% 
  select(name, height) %>% 
  filter(is.na(height))

starwars %>% 
  mutate(height = case_when(is.na(height) ~ median(starwars$height, na.rm = TRUE),
                            TRUE ~ height)) %>% 
  select(name, height) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Starwars Characters") %>% 
  gt_highlight_rows(rows = name %in% c("Arvel Crynyd", "Finn", "Rey",
                                       "Poe Dameron", "BB8", "Captain Phasma"),
                    fill = "steelblue")


starwars %>% 
  mutate(height = case_when(is.na(height) ~ median(starwars$height, na.rm = TRUE),
                            TRUE ~ height)) %>% 
  select(name, height) %>% 
  arrange(name) %>% 
  gt() %>% 
  gt_theme_guardian() %>% 
  tab_header(title = "Starwars Characters") %>% 
  gt_highlight_rows(rows = name %in% c("Arvel Crynyd", "Finn", "Rey",
                                       "Poe Dameron", "BB8", "Captain Phasma"),
                    fill = "steelblue")




