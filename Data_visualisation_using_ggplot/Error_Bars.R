## Errorbars are mean +- standard deviation

library(tidyverse)


?geom_errorbar

?ToothGrowth
View(ToothGrowth)
glimpse(ToothGrowth)

unique(ToothGrowth$supp)
unique(ToothGrowth$dose)
summary(ToothGrowth)

ToothGrowth %>% 
  group_by(dose) %>% 
  summarise(average_tooth_length = mean(len))

ToothGrowth %>% 
  filter(supp == 'VC') %>% 
  group_by(dose) %>% 
  summarise(average_tooth_length = mean(len))
  
ToothGrowth %>% 
  filter(supp == 'VC') %>% 
  mutate(dose = as.factor(dose)) %>% 
  group_by(dose) %>% 
  summarise(average_tooth_length = mean(len)) %>% 
  glimpse()


ToothGrowth %>% 
  filter(supp == 'VC') %>% 
  mutate(dose = as.factor(dose)) %>% 
  group_by(dose) %>% 
  summarise(average_tooth_length = mean(len),
            sd_tooth_length = sd(len))

ToothGrowth %>% 
  filter(supp == 'VC') %>% 
  mutate(dose = as.factor(dose)) %>% 
  group_by(dose) %>% 
  summarise(average_tooth_length = mean(len),
            sd_tooth_length = sd(len)) %>% 
  ggplot(aes(dose, average_tooth_length)) + 
  geom_point(size = 5, colour = "blue")


ToothGrowth %>% 
  filter(supp == 'VC') %>% 
  mutate(dose = as.factor(dose)) %>% 
  group_by(dose) %>% 
  summarise(average_tooth_length = mean(len),
            sd_tooth_length = sd(len)) %>% 
  ggplot(aes(dose, average_tooth_length)) + 
  geom_point(size = 3, colour = "blue") +
  geom_errorbar(aes(x = dose,
                    ymin = average_tooth_length - sd_tooth_length,
                    ymax = average_tooth_length + sd_tooth_length))

ToothGrowth %>% 
  filter(supp == 'VC') %>% 
  mutate(dose = as.factor(dose)) %>% 
  group_by(dose) %>% 
  summarise(average_tooth_length = mean(len),
            sd_tooth_length = sd(len)) %>% 
  ggplot(aes(dose, average_tooth_length)) + 
  geom_point(size = 3, colour = "blue") +
  geom_errorbar(aes(x = dose,
                    ymin = average_tooth_length - sd_tooth_length,
                    ymax = average_tooth_length + sd_tooth_length,
                    width = 0.05))

################################################################################
ToothGrowth %>% 
  filter(supp == 'VC') %>% 
  mutate(dose = as.factor(dose)) %>% 
  group_by(dose) %>% 
  summarise(average_tooth_length = mean(len),
            sd_tooth_length = sd(len)) %>% 
  ggplot(aes(dose, average_tooth_length)) + 
  geom_point(size = 3, colour = "blue") +
  geom_errorbar(aes(x = dose,
                    ymin = average_tooth_length - sd_tooth_length,
                    ymax = average_tooth_length + sd_tooth_length,
                    width = 0.05)) +
  labs(title = "Average Tooth Growth for VC Supplement Group") +
  xlab("Dose") +
  ylab("Average Tooth Growth")+
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5))
################################################################################  


ToothGrowth %>% 
  filter(supp == "VC") %>% 
  mutate(dose = as.factor(dose)) %>% 
  group_by(dose) %>% 
  summarise(average_tooth_length = mean(len),
            sd_tooth_length = sd(len)) %>% 
  ggplot(aes(dose, average_tooth_length))+
  geom_bar(stat = "identity")     #################### VVI  VVI

ToothGrowth %>% 
  filter(supp == "VC") %>% 
  mutate(dose = as.factor(dose)) %>% 
  group_by(dose) %>% 
  summarise(average_tooth_length = mean(len),
            sd_tooth_length = sd(len)) %>% 
  ggplot(aes(dose, average_tooth_length)) +
  geom_bar(stat = "identity", fill = "skyblue", alpha = 0.7)

ToothGrowth %>% 
  filter(supp == "VC") %>% 
  mutate(dose = as.factor(dose)) %>% 
  group_by(dose) %>% 
  summarise(average_tooth_length = mean(len),
            sd_tooth_length = sd(len)) %>% 
  ggplot(aes(dose, average_tooth_length)) +
  geom_bar(stat = "identity", fill = "skyblue", alpha = 0.7) +
  geom_errorbar(aes(dose,
                    ymax = average_tooth_length + sd_tooth_length,
                    ymin = average_tooth_length - sd_tooth_length))

ToothGrowth %>% 
  filter(supp == "VC") %>% 
  mutate(dose = as.factor(dose)) %>% 
  group_by(dose) %>% 
  summarise(average_tooth_length = mean(len),
            sd_tooth_length = sd(len)) %>% 
  ggplot(aes(dose, average_tooth_length)) +
  geom_bar(stat = "identity", fill = "skyblue", alpha = 0.7) +
  geom_errorbar(aes(dose,
                    ymax = average_tooth_length + sd_tooth_length,
                    ymin = average_tooth_length - sd_tooth_length,
                    width = 0.1))

ToothGrowth %>% 
  filter(supp == "VC") %>% 
  mutate(dose = as.factor(dose)) %>% 
  group_by(dose) %>% 
  summarise(average_tooth_length = mean(len),
            sd_tooth_length = sd(len)) %>% 
  ggplot(aes(dose, average_tooth_length)) +
  geom_bar(stat = "identity", fill = "skyblue", alpha = 0.7) +
  geom_errorbar(aes(dose,
                    ymax = average_tooth_length + sd_tooth_length,
                    ymin = average_tooth_length - sd_tooth_length,
                    width = 0.1))+
  labs(title = "Average Tooth Growth for VC Supplement Group") +
  xlab("Dose") +
  ylab("Average Tooth Growth")

################################################################################
ToothGrowth %>% 
  filter(supp == "VC") %>% 
  mutate(dose = as.factor(dose)) %>% 
  group_by(dose) %>% 
  summarise(average_tooth_length = mean(len),
            sd_tooth_length = sd(len)) %>% 
  ggplot(aes(dose, average_tooth_length)) +
  geom_bar(stat = "identity", fill = "skyblue", alpha = 0.7) +    ##### VVI
  geom_errorbar(aes(dose,
                    ymax = average_tooth_length + sd_tooth_length,
                    ymin = average_tooth_length - sd_tooth_length,
                    width = 0.1))+
  labs(title = "Average Tooth Growth for VC Supplement Group") +
  xlab("Dose") +
  ylab("Average Tooth Growth")+
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5))
################################################################################









