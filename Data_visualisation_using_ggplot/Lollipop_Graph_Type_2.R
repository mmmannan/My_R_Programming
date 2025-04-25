library(tidyverse)
library(forcats)

names(msleep)

msleep %>% 
  group_by(order) %>% 
  summarise(avg_awake = mean(awake)) %>%
  mutate(order = fct_reorder(order, avg_awake)) %>% 
  ggplot(aes(avg_awake, order)) + 
  geom_point(size = 4) +
  geom_vline(xintercept = mean(msleep$awake)) +
  geom_segment(aes(x = 0, xend = mean(msleep$awake),
                   y = order, yend = order))



msleep %>% 
  group_by(order) %>% 
  summarise(avg_awake = mean(awake)) %>%
  mutate(order = fct_reorder(order, avg_awake)) %>% 
  ggplot(aes(avg_awake, order)) + 
  geom_point(size = 4) +
  geom_segment(aes(x = 0, xend = avg_awake,
                   y = order, yend = order)) +
  labs(x = "Average Awake Time (hour)", y = "Order",
       title = "Msleep Lollipop Plot Type 2") +
  theme(plot.title = element_text(hjust = 0.5))




names(chickwts)
?chickwts

chickwts %>% 
  group_by(feed) %>% 
  summarise(avg_weight = mean(weight)) %>%
  mutate(feed = fct_reorder(feed, avg_weight)) %>% 
  ggplot(aes(avg_weight, feed, colour = feed)) +
  geom_point(size = 10) +
  geom_segment(aes(x = 0, xend = avg_weight,
                   y = feed, yend = feed, color = feed, size = 1)) +
  theme_bw() +
  labs(title = "Chickwts Lollipop Graph Type 2",
       x = "Average Weight of Chick (g)", y = "Feed") +
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5))










