library(tidyverse)
library(forcats)

View(msleep)
names(msleep)


msleep %>% 
  group_by(order) %>% 
  summarise(avg_sleep = mean(sleep_total)) %>% 
  View()

################################################################################
theme_set(theme_bw() +
            theme(panel.grid = element_blank()))
################################################################################
# panel.grid = element_blank() removes grid from the background


msleep %>% 
  group_by(order) %>% 
  summarise(avg_sleep = mean(sleep_total)) %>% 
  ggplot(aes(order, avg_sleep)) + 
  geom_point(size = 3, color = "orange")

msleep %>% 
  group_by(order) %>% 
  summarise(avg_sleep = mean(sleep_total)) %>% 
  ggplot(aes(order, avg_sleep)) + 
  geom_point(size = 3, color = "orange") +
  geom_hline(yintercept = mean(msleep$sleep_total),
             colour = "grey", size = 1) +
  geom_segment(aes(x = order, y = mean(msleep$sleep_total), 
                   xend = order, yend = avg_sleep),
               colour = "grey") +
  labs(title = "Average sleep time of mammals by order",
       x = "", y = "Hours") +
  theme(axis.text.x = element_text(angle = 90),
        plot.title = element_text(hjust = 0.5))



msleep %>% 
  group_by(order) %>% 
  summarise(avg_sleep = mean(sleep_total)) %>% 
  mutate(order = fct_reorder(order, avg_sleep)) %>% 
  ggplot(aes(order, avg_sleep)) + 
  geom_point(size = 3, color = "orange")

msleep %>% 
  group_by(order) %>% 
  summarise(avg_sleep = mean(sleep_total)) %>% 
  mutate(order = fct_reorder(order, avg_sleep)) %>% 
  mutate(order = fct_rev(order)) %>% 
  ggplot(aes(order, avg_sleep)) + 
  geom_point(size = 3, color = "orange")

msleep %>% 
  group_by(order) %>% 
  summarise(avg_sleep = mean(sleep_total)) %>% 
  mutate(order = fct_reorder(order, avg_sleep)) %>% 
  ggplot(aes(order, avg_sleep)) + 
  geom_point(size = 3, color = "orange") + 
  geom_hline(yintercept = mean(msleep$sleep_total))

msleep %>% 
  group_by(order) %>% 
  summarise(avg_sleep = mean(sleep_total)) %>% 
  mutate(order = fct_reorder(order, avg_sleep)) %>% 
  ggplot(aes(order, avg_sleep)) + 
  geom_point(size = 3, color = "orange") + 
  geom_hline(yintercept = mean(msleep$sleep_total)) +
  geom_segment(aes(xend = avg_sleep, yend = mean(msleep$sleep_total)))


msleep %>% 
  group_by(order) %>% 
  summarise(avg_sleep = mean(sleep_total)) %>% 
  mutate(order = fct_reorder(order, avg_sleep)) %>% 
  ggplot(aes(order, avg_sleep)) + 
  geom_point(size = 3, color = "orange") + 
  geom_hline(yintercept = mean(msleep$sleep_total)) +
  geom_segment(aes(xend = order, yend = mean(msleep$sleep_total)))

msleep %>% 
  group_by(order) %>% 
  summarise(avg_sleep = mean(sleep_total)) %>% 
  mutate(order = fct_reorder(order, avg_sleep)) %>% 
  ggplot(aes(order, avg_sleep)) + 
  geom_point(size = 3, color = "orange") + 
  geom_hline(yintercept = mean(msleep$sleep_total)) +
  geom_segment(aes(x = order, y = mean(msleep$sleep_total), 
                   xend = order, yend = avg_sleep))

msleep %>% 
  group_by(order) %>% 
  summarise(avg_sleep = mean(sleep_total)) %>% 
  mutate(order = fct_reorder(order, avg_sleep)) %>% 
  ggplot(aes(order, avg_sleep)) + 
  geom_point(size = 3, color = "orange") + 
  geom_hline(yintercept = mean(msleep$sleep_total), size = 1) +
  geom_segment(aes(x = order, y = mean(msleep$sleep_total), 
                   xend = order, yend = avg_sleep), size = 1)

msleep %>% 
  group_by(order) %>% 
  summarise(avg_sleep = mean(sleep_total)) %>% 
  mutate(order = fct_reorder(order, avg_sleep)) %>% 
  ggplot(aes(order, avg_sleep)) + 
  geom_point(size = 3, color = "orange") + 
  geom_hline(yintercept = mean(msleep$sleep_total),
             colour = "grey", size = 1) +
  geom_segment(aes(x = order, y = mean(msleep$sleep_total), 
                   xend = order, yend = avg_sleep),
               colour = "grey")

msleep %>% 
  group_by(order) %>% 
  summarise(avg_sleep = mean(sleep_total)) %>% 
  mutate(order = fct_reorder(order, avg_sleep)) %>% 
  ggplot(aes(order, avg_sleep)) + 
  geom_point(size = 3, color = "orange") + 
  geom_hline(yintercept = mean(msleep$sleep_total),
             colour = "grey", size = 1) +
  geom_segment(aes(x = order, y = mean(msleep$sleep_total), 
                   xend = order, yend = avg_sleep),
               colour = "grey") +
  theme(axis.text.x = element_text(angle = 90))

msleep %>% 
  group_by(order) %>% 
  summarise(avg_sleep = mean(sleep_total)) %>% 
  mutate(order = fct_reorder(order, avg_sleep)) %>% 
  ggplot(aes(order, avg_sleep)) + 
  geom_point(size = 3, color = "orange") + 
  geom_hline(yintercept = mean(msleep$sleep_total),
             colour = "grey", size = 1) +
  geom_segment(aes(x = order, y = mean(msleep$sleep_total), 
                   xend = order, yend = avg_sleep),
               colour = "grey") +
  labs(title = "Average sleep time of mammals by order",
       x = "", y = "Hours") +
  theme(axis.text.x = element_text(angle = 90))
  
msleep %>% 
  group_by(order) %>% 
  summarise(avg_sleep = mean(sleep_total)) %>% 
  mutate(order = fct_reorder(order, avg_sleep)) %>% 
  ggplot(aes(order, avg_sleep)) + 
  geom_point(size = 3, color = "orange") + 
  geom_hline(yintercept = mean(msleep$sleep_total),
             colour = "grey", size = 1) +
  geom_segment(aes(x = order, y = mean(msleep$sleep_total), 
                   xend = order, yend = avg_sleep),
               colour = "grey") +
  labs(title = "Average sleep time of mammals by order",
       x = "", y = "Hours") +
  theme(axis.text.x = element_text(angle = 90),
        plot.title = element_text(hjust = 0.5))






