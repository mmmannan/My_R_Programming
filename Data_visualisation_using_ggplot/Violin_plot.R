
# Violin plot ====== Box plot

starwars %>% 
  filter(sex %in% c("male", "female")) %>% 
  ggplot(aes(sex, height, fill = sex, color = sex)) + 
  geom_violin(alpha = 0.5) +
  theme_bw() +
  labs(title = "Height distribution of\nstarwars characters by their sex") +
  theme(plot.title = element_text(hjust = 0.5))

starwars %>% 
  filter(sex %in% c("male", "female")) %>% 
  ggplot(aes(sex, height, fill = sex, color = sex)) + 
  geom_violin(alpha = 0.5, trim = FALSE) +
  theme_bw() +
  labs(title = "Height distribution of\nstarwars characters by their sex") +
  theme(plot.title = element_text(hjust = 0.5))


starwars %>% 
  filter(mass < 500) %>% 
  ggplot(aes(x = mass, y = "")) +
  geom_violin(fill = "#fb89d7", color = "red", alpha = 0.7) +
  theme_bw()




? ToothGrowth  
names(ToothGrowth)
glimpse(ToothGrowth)
unique(ToothGrowth$dose)

ToothGrowth %>%
  mutate(dose = factor(dose)) %>% 
  ggplot(aes(dose, len, fill = dose, color = dose)) +
  geom_violin(alpha = 0.5) +
  theme_bw()

ToothGrowth %>%
  mutate(dose = factor(dose)) %>% 
  ggplot(aes(dose, len, fill = dose, color = dose)) +
  geom_violin(alpha = 0.5, trim = FALSE) +
  geom_point(color = "black", size = 2) +
  theme_bw() +
  labs(x = "Dose (mg)", y = "Tooth length")
  
ToothGrowth %>%
  mutate(dose = factor(dose)) %>% 
  ggplot(aes(dose, len, fill = dose)) +
  geom_violin(alpha = 0.5, trim = FALSE,
              draw_quantiles = c(0.5)) +   # draw median
  theme_classic() +
  labs(x = "Dose (mg)", y = "Tooth length",
       title = "Plot of tooth length by dose") +
  theme(plot.title = element_text(hjust = 0.5))

ToothGrowth %>%
  mutate(dose = factor(dose)) %>% 
  ggplot(aes(dose, len, fill = dose)) +
  geom_violin(alpha = 0.5, trim = FALSE,
              draw_quantiles = c(0.25, 0.5, 0.75)) +
  theme_classic()

ToothGrowth %>%
  mutate(dose = factor(dose)) %>% 
  ggplot(aes(dose, len, fill = dose)) +
  geom_violin(alpha = 0.5, trim = FALSE) + 
  geom_boxplot(width = 0.1) +
  theme_classic() +
  labs(x = "Dose (mg)", y = "Tooth length",
       title = "Plot of tooth length by dose") +
  theme(plot.title = element_text(hjust = 0.5)) 

ToothGrowth %>%
  mutate(dose = factor(dose)) %>% 
  ggplot(aes(dose, len, fill = dose)) +
  geom_violin(alpha = 0.5, trim = FALSE) + 
  geom_boxplot(width = 0.3, fill = "white") +
  theme_classic() +
  labs(x = "Dose (mg)", y = "Tooth length",
       title = "Plot of tooth length by dose") +
  theme(plot.title = element_text(hjust = 0.5)) 

ToothGrowth %>%
  mutate(dose = factor(dose)) %>% 
  ggplot(aes(dose, len, fill = dose, color = dose)) +
  geom_violin(alpha = 0.5, trim = FALSE) + 
  geom_boxplot(width = 0.3, fill = "white") +
  theme_classic() +
  labs(x = "Dose (mg)", y = "Tooth length",
       title = "Plot of tooth length by dose") +
  theme(plot.title = element_text(hjust = 0.5)) 

library(ggplot2)

ggplot(ToothGrowth, aes(x = factor(dose), y = len)) +
  geom_violin(trim = FALSE) + 
  stat_summary(fun = "mean", geom = "point",
               color = "red", size = 4, alpha = 0.5) +
  stat_summary(fun = "median", geom = "point",
               color = "blue", size = 4, alpha = 0.5) +
  labs(x = "Dose (mg)", y = "Tooth length",
       title = "Plot of tooth length by dose") +
  theme(plot.title = element_text(hjust = 0.5))

ggplot(ToothGrowth, aes(x = factor(dose), y = len)) +
  geom_violin(trim = FALSE) + 
  stat_summary(fun = "mean", geom = "point",
               color = "red", size = 4, alpha = 0.5) +
  stat_summary(fun = "median", geom = "crossbar",
               color = "blue") +
  labs(x = "Dose (mg)", y = "Tooth length",
       title = "Plot of tooth length by dose") +
  theme(plot.title = element_text(hjust = 0.5))



