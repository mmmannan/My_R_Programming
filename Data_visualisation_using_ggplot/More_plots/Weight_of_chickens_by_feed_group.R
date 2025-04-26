library(tidyverse)

?ChickWeight
View(ChickWeight)
glimpse(ChickWeight)

ChickWeight %>% 
  group_by(Diet) %>% 
  summarise(avg_weight = mean(weight)) %>% 
  View()


ChickWeight %>% 
  group_by(Diet) %>% 
  summarise(avg_weight = mean(weight)) %>% 
  ggplot(aes(avg_weight, Diet, color = Diet)) +
  geom_point(size = 3) +
  geom_vline(xintercept = mean(ChickWeight$weight), color = "grey", size = 1) +
  geom_segment(aes(x = mean(ChickWeight$weight), y = Diet,
                   xend = avg_weight, yend = Diet,
                   color = Diet))


ChickWeight %>% 
  group_by(Diet) %>% 
  summarise(avg_weight = mean(weight)) %>% 
  ggplot(aes(Diet, avg_weight, color = Diet)) +
  geom_point(size = 3) +
  geom_hline(yintercept = mean(ChickWeight$weight), color = "grey", linewidth = 1) +
  geom_segment(aes(x = Diet, y = mean(ChickWeight$weight),
                   xend = Diet, yend = avg_weight,
                   color = Diet))


library(forcats)

##################### 2 variables ( 1 numeric, 1 categorical) ##################
################################################################################
ChickWeight %>% 
  group_by(Diet) %>% 
  summarise(avg_weight_by_Diet = mean(weight)) %>% 
  mutate(Diet = fct_reorder(Diet, avg_weight_by_Diet)) %>% 
  ggplot(aes(avg_weight_by_Diet, Diet, color = Diet)) +
  geom_point(size = 3) +
  geom_vline(xintercept = mean(ChickWeight$weight), color = "grey", linewidth = 1) +
  geom_segment(aes(x = mean(ChickWeight$weight), y = Diet,
                   xend = avg_weight_by_Diet, yend = Diet,
                   color = Diet)) +
  theme_bw() +
  theme(panel.grid = element_blank()) +
  labs(x = "Weight of Chicken", y = "Diet",
       title = "ChickWeight Dataset") +
  theme(plot.title = element_text(hjust = 0.5))
################################################################################

##################### 2 variables ( 1 numeric, 1 categorical) ##################
################################################################################
ChickWeight %>% 
  group_by(Diet) %>% 
  summarise(avg_weight_by_Diet = mean(weight)) %>% 
  mutate(Diet = fct_reorder(Diet, avg_weight_by_Diet))  %>%
  ggplot(aes(Diet, avg_weight_by_Diet, color = Diet)) +
  geom_point(size = 3) +
  geom_hline(yintercept = mean(ChickWeight$weight), color = "grey", size = 1) +
  geom_segment(aes(x = Diet, y = mean(ChickWeight$weight),
                   xend = Diet, yend = avg_weight_by_Diet,
                   color = Diet)) +
  theme_bw() +
  theme(panel.grid = element_blank()) +
  labs(x = "Diet", y = "Weight",
       title = "ChickWeight Dataset") +
  theme(plot.title = element_text(hjust = 0.5))
################################################################################



?chickwts
View(chickwts)
glimpse(chickwts)


chickwts %>% 
  group_by(feed) %>% 
  summarise(avg_weight_by_feed = mean(weight)) %>% 
  mutate(feed = fct_reorder(feed, avg_weight_by_feed)) %>% 
  ggplot(aes(avg_weight_by_feed, feed, color = feed)) +
  geom_point(size = 3) +
  geom_vline(xintercept = mean(chickwts$weight), color = "grey", size = 1) +
  geom_segment(aes(x = mean(chickwts$weight), y = feed,
                   xend = avg_weight_by_feed, yend = feed,
                   color = feed)) +
  theme_bw() +
  labs(x = "Weight of Chickens", y = "Feed",
       title = "chickwts dataset") +
  theme(plot.title = element_text(hjust = 0.5))



chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  View()

chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  ungroup() %>% 
  mutate(feed = fct_reorder(feed, avg_wt_by_feed)) %>% 
  ggplot(aes(weight, feed, colour = feed, show.legend = F)) +
  geom_jitter()

chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  ungroup() %>% 
  mutate(feed = fct_reorder(feed, avg_wt_by_feed)) %>% 
  ggplot(aes(weight, feed, colour = feed, show.legend = F)) +
  geom_jitter(show.legend = F, size = 4, alpha = 0.2, width = 0.05)

chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  ungroup() %>% 
  mutate(feed = fct_reorder(feed, avg_wt_by_feed)) %>% 
  ggplot(aes(weight, feed, colour = feed, show.legend = F)) +
  geom_jitter(show.legend = F, size = 4, alpha = 0.2, width = 0.05) + 
  ## geom_jitter shows all the points of each feed category
  stat_summary(fun = mean, geom = "point", size = 8)
  ## stat summary shows the avg_wt_by_feed point of each feed category

chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  ungroup() %>% 
  mutate(feed = fct_reorder(feed, avg_wt_by_feed)) %>% 
  ggplot(aes(weight, feed, color = feed, show.legend = F)) +
  geom_jitter(show.legend = F, size = 4, alpha = 0.2, width = 0.05) + 
  ## geom_jitter shows all the points of each feed category
  stat_summary(fun = mean, geom = "point", size = 8, show.legend = F) +
  ## stat summary shows the avg_wt_by_feed point of each feed category
  geom_vline(xintercept = mean(chickwts$weight), color = "grey70", linewidth = 1)

chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  ungroup() %>% 
  mutate(feed = fct_reorder(feed, avg_wt_by_feed)) %>% 
  ggplot(aes(weight, feed, color = feed, show.legend = F)) +
  geom_jitter(show.legend = F, size = 4, alpha = 0.2, width = 0.05) + 
  ## geom_jitter shows all the points of each feed category
  stat_summary(fun = mean, geom = "point", size = 8, show.legend = F) +
  ## stat summary shows the avg_wt_by_feed point of each feed category
  geom_vline(xintercept = mean(chickwts$weight), color = "grey70", linewidth = 1) +
  geom_segment(aes(x = mean(weight), xend = avg_wt_by_feed,
                   y = feed, yend = feed))

chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  ungroup() %>% 
  mutate(feed = fct_reorder(feed, avg_wt_by_feed)) %>% 
  ggplot(aes(weight, feed, color = feed, show.legend = F)) +
  geom_jitter(show.legend = F, size = 4, alpha = 0.2, width = 0.05) + 
  ## geom_jitter shows all the points of each feed category
  stat_summary(fun = mean, geom = "point", size = 8, show.legend = F) +
  ## stat summary shows the avg_wt_by_feed point of each feed category
  geom_vline(xintercept = mean(chickwts$weight), color = "grey70", linewidth = 1) +
  geom_segment(aes(x = mean(weight), xend = avg_wt_by_feed,
                   y = feed, yend = feed), linewidth = 2, show.legend = F) +
  labs(title = "Weight of chickens by feed group (chickwts dataset)",
       x = "Weight of Chickens", y = "Feed") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))


################################################################################
chickwts %>%
  group_by(feed) %>%
  mutate(mean_by_feed = mean(weight)) %>%
  ungroup() %>%
  mutate(feed = fct_reorder(feed, mean_by_feed)) %>%
  ggplot(aes(feed, weight, colour = feed,
             show.legend = F)) +
  coord_flip() +
  geom_jitter(show.legend = F,
              size = 4,
              alpha = 0.2,
              width = 0.05) +
  stat_summary(fun = mean, geom = "point", size = 8, show.legend = F) +
  geom_hline(aes(yintercept = mean(weight)),
             colour = "gray70",
             size = 0.9) +
  geom_segment(aes(x = feed, xend = feed,
                   y = mean(weight), yend = mean_by_feed),
               size = 2, show.legend = F) +
  labs(title = "Weight of chickens by feed group",
       x = "Feed",
       y = "Weight of chickens") +
  theme(legend.position = "none") +
  theme_bw()
################################################################################

library(tidyverse)

?ChickWeight
View(ChickWeight)
glimpse(ChickWeight)

ChickWeight %>% 
  group_by(Diet) %>% 
  summarise(avg_weight = mean(weight)) %>% 
  View()


ChickWeight %>% 
  group_by(Diet) %>% 
  summarise(avg_weight = mean(weight)) %>% 
  ggplot(aes(avg_weight, Diet, color = Diet)) +
  geom_point(size = 3) +
  geom_vline(xintercept = mean(ChickWeight$weight), color = "grey", size = 1) +
  geom_segment(aes(x = mean(ChickWeight$weight), y = Diet,
                   xend = avg_weight, yend = Diet,
                   color = Diet))


ChickWeight %>% 
  group_by(Diet) %>% 
  summarise(avg_weight = mean(weight)) %>% 
  ggplot(aes(Diet, avg_weight, color = Diet)) +
  geom_point(size = 3) +
  geom_hline(yintercept = mean(ChickWeight$weight), color = "grey", linewidth = 1) +
  geom_segment(aes(x = Diet, y = mean(ChickWeight$weight),
                   xend = Diet, yend = avg_weight,
                   color = Diet))


library(forcats)

##################### 2 variables ( 1 numeric, 1 categorical) ##################
################################################################################
ChickWeight %>% 
  group_by(Diet) %>% 
  summarise(avg_weight_by_Diet = mean(weight)) %>% 
  mutate(Diet = fct_reorder(Diet, avg_weight_by_Diet)) %>% 
  ggplot(aes(avg_weight_by_Diet, Diet, color = Diet)) +
  geom_point(size = 3) +
  geom_vline(xintercept = mean(ChickWeight$weight), color = "grey", linewidth = 1) +
  geom_segment(aes(x = mean(ChickWeight$weight), y = Diet,
                   xend = avg_weight_by_Diet, yend = Diet,
                   color = Diet)) +
  theme_bw() +
  theme(panel.grid = element_blank()) +
  labs(x = "Weight of Chicken", y = "Diet",
       title = "ChickWeight Dataset") +
  theme(plot.title = element_text(hjust = 0.5))
################################################################################

##################### 2 variables ( 1 numeric, 1 categorical) ##################
################################################################################
ChickWeight %>% 
  group_by(Diet) %>% 
  summarise(avg_weight_by_Diet = mean(weight)) %>% 
  mutate(Diet = fct_reorder(Diet, avg_weight_by_Diet))  %>%
  ggplot(aes(Diet, avg_weight_by_Diet, color = Diet)) +
  geom_point(size = 3) +
  geom_hline(yintercept = mean(ChickWeight$weight), color = "grey", size = 1) +
  geom_segment(aes(x = Diet, y = mean(ChickWeight$weight),
                   xend = Diet, yend = avg_weight_by_Diet,
                   color = Diet)) +
  theme_bw() +
  theme(panel.grid = element_blank()) +
  labs(x = "Diet", y = "Weight",
       title = "ChickWeight Dataset") +
  theme(plot.title = element_text(hjust = 0.5))
################################################################################



?chickwts
View(chickwts)
glimpse(chickwts)


chickwts %>% 
  group_by(feed) %>% 
  summarise(avg_weight_by_feed = mean(weight)) %>% 
  mutate(feed = fct_reorder(feed, avg_weight_by_feed)) %>% 
  ggplot(aes(avg_weight_by_feed, feed, color = feed)) +
  geom_point(size = 3) +
  geom_vline(xintercept = mean(chickwts$weight), color = "grey", size = 1) +
  geom_segment(aes(x = mean(chickwts$weight), y = feed,
                   xend = avg_weight_by_feed, yend = feed,
                   color = feed)) +
  theme_bw() +
  labs(x = "Weight of Chickens", y = "Feed",
       title = "chickwts dataset") +
  theme(plot.title = element_text(hjust = 0.5))



chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  View()

chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  ungroup() %>% 
  mutate(feed = fct_reorder(feed, avg_wt_by_feed)) %>% 
  ggplot(aes(weight, feed, colour = feed, show.legend = F)) +
  geom_jitter()

chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  ungroup() %>% 
  mutate(feed = fct_reorder(feed, avg_wt_by_feed)) %>% 
  ggplot(aes(weight, feed, colour = feed, show.legend = F)) +
  geom_jitter(show.legend = F, size = 4, alpha = 0.2, width = 0.05)

chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  ungroup() %>% 
  mutate(feed = fct_reorder(feed, avg_wt_by_feed)) %>% 
  ggplot(aes(weight, feed, colour = feed, show.legend = F)) +
  geom_jitter(show.legend = F, size = 4, alpha = 0.2, width = 0.05) + 
  ## geom_jitter shows all the points of each feed category
  stat_summary(fun = mean, geom = "point", size = 8)
## stat summary shows the avg_wt_by_feed point of each feed category

chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  ungroup() %>% 
  mutate(feed = fct_reorder(feed, avg_wt_by_feed)) %>% 
  ggplot(aes(weight, feed, color = feed, show.legend = F)) +
  geom_jitter(show.legend = F, size = 4, alpha = 0.2, width = 0.05) + 
  ## geom_jitter shows all the points of each feed category
  stat_summary(fun = mean, geom = "point", size = 8, show.legend = F) +
  ## stat summary shows the avg_wt_by_feed point of each feed category
  geom_vline(xintercept = mean(chickwts$weight), color = "grey70", linewidth = 1)

chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  ungroup() %>% 
  mutate(feed = fct_reorder(feed, avg_wt_by_feed)) %>% 
  ggplot(aes(weight, feed, color = feed, show.legend = F)) +
  geom_jitter(show.legend = F, size = 4, alpha = 0.2, width = 0.05) + 
  ## geom_jitter shows all the points of each feed category
  stat_summary(fun = mean, geom = "point", size = 8, show.legend = F) +
  ## stat summary shows the avg_wt_by_feed point of each feed category
  geom_vline(xintercept = mean(chickwts$weight), color = "grey70", linewidth = 1) +
  geom_segment(aes(x = mean(weight), xend = avg_wt_by_feed,
                   y = feed, yend = feed))

chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  ungroup() %>% 
  mutate(feed = fct_reorder(feed, avg_wt_by_feed)) %>% 
  ggplot(aes(weight, feed, color = feed, show.legend = F)) +
  geom_jitter(show.legend = F, size = 4, alpha = 0.2, width = 0.05) + 
  ## geom_jitter shows all the points of each feed category
  stat_summary(fun = mean, geom = "point", size = 8, show.legend = F) +
  ## stat summary shows the avg_wt_by_feed point of each feed category
  geom_vline(xintercept = mean(chickwts$weight), color = "grey70", linewidth = 1) +
  geom_segment(aes(x = mean(weight), xend = avg_wt_by_feed,
                   y = feed, yend = feed), linewidth = 2, show.legend = F) +
  labs(title = "Weight of chickens by feed group (chickwts dataset)",
       x = "Weight of Chickens", y = "Feed") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))


################################################################################
chickwts %>%
  group_by(feed) %>%
  mutate(mean_by_feed = mean(weight)) %>%
  ungroup() %>%
  mutate(feed = fct_reorder(feed, mean_by_feed)) %>%
  ggplot(aes(feed, weight, colour = feed,
             show.legend = F)) +
  coord_flip() +
  geom_jitter(show.legend = F,
              size = 4,
              alpha = 0.2,
              width = 0.05) +
  stat_summary(fun = mean, geom = "point", size = 8, show.legend = F) +
  geom_hline(aes(yintercept = mean(weight)),
             colour = "gray70",
             size = 0.9) +
  geom_segment(aes(x = feed, xend = feed,
                   y = mean(weight), yend = mean_by_feed),
               size = 2, show.legend = F) +
  labs(title = "Weight of chickens by feed group",
       x = "Feed",
       y = "Weight of chickens") +
  theme(legend.position = "none") +
  theme_bw()
################################################################################

library(tidyverse)

?ChickWeight
View(ChickWeight)
glimpse(ChickWeight)

ChickWeight %>% 
  group_by(Diet) %>% 
  summarise(avg_weight = mean(weight)) %>% 
  View()


ChickWeight %>% 
  group_by(Diet) %>% 
  summarise(avg_weight = mean(weight)) %>% 
  ggplot(aes(avg_weight, Diet, color = Diet)) +
  geom_point(size = 3) +
  geom_vline(xintercept = mean(ChickWeight$weight), color = "grey", size = 1) +
  geom_segment(aes(x = mean(ChickWeight$weight), y = Diet,
                   xend = avg_weight, yend = Diet,
                   color = Diet))


ChickWeight %>% 
  group_by(Diet) %>% 
  summarise(avg_weight = mean(weight)) %>% 
  ggplot(aes(Diet, avg_weight, color = Diet)) +
  geom_point(size = 3) +
  geom_hline(yintercept = mean(ChickWeight$weight), color = "grey", linewidth = 1) +
  geom_segment(aes(x = Diet, y = mean(ChickWeight$weight),
                   xend = Diet, yend = avg_weight,
                   color = Diet))


library(forcats)

##################### 2 variables ( 1 numeric, 1 categorical) ##################
################################################################################
ChickWeight %>% 
  group_by(Diet) %>% 
  summarise(avg_weight_by_Diet = mean(weight)) %>% 
  mutate(Diet = fct_reorder(Diet, avg_weight_by_Diet)) %>% 
  ggplot(aes(avg_weight_by_Diet, Diet, color = Diet)) +
  geom_point(size = 3) +
  geom_vline(xintercept = mean(ChickWeight$weight), color = "grey", linewidth = 1) +
  geom_segment(aes(x = mean(ChickWeight$weight), y = Diet,
                   xend = avg_weight_by_Diet, yend = Diet,
                   color = Diet)) +
  theme_bw() +
  theme(panel.grid = element_blank()) +
  labs(x = "Weight of Chicken", y = "Diet",
       title = "ChickWeight Dataset") +
  theme(plot.title = element_text(hjust = 0.5))
################################################################################

##################### 2 variables ( 1 numeric, 1 categorical) ##################
################################################################################
ChickWeight %>% 
  group_by(Diet) %>% 
  summarise(avg_weight_by_Diet = mean(weight)) %>% 
  mutate(Diet = fct_reorder(Diet, avg_weight_by_Diet))  %>%
  ggplot(aes(Diet, avg_weight_by_Diet, color = Diet)) +
  geom_point(size = 3) +
  geom_hline(yintercept = mean(ChickWeight$weight), color = "grey", size = 1) +
  geom_segment(aes(x = Diet, y = mean(ChickWeight$weight),
                   xend = Diet, yend = avg_weight_by_Diet,
                   color = Diet)) +
  theme_bw() +
  theme(panel.grid = element_blank()) +
  labs(x = "Diet", y = "Weight",
       title = "ChickWeight Dataset") +
  theme(plot.title = element_text(hjust = 0.5))
################################################################################



?chickwts
View(chickwts)
glimpse(chickwts)


chickwts %>% 
  group_by(feed) %>% 
  summarise(avg_weight_by_feed = mean(weight)) %>% 
  mutate(feed = fct_reorder(feed, avg_weight_by_feed)) %>% 
  ggplot(aes(avg_weight_by_feed, feed, color = feed)) +
  geom_point(size = 3) +
  geom_vline(xintercept = mean(chickwts$weight), color = "grey", size = 1) +
  geom_segment(aes(x = mean(chickwts$weight), y = feed,
                   xend = avg_weight_by_feed, yend = feed,
                   color = feed)) +
  theme_bw() +
  labs(x = "Weight of Chickens", y = "Feed",
       title = "chickwts dataset") +
  theme(plot.title = element_text(hjust = 0.5))



chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  View()

chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  ungroup() %>% 
  mutate(feed = fct_reorder(feed, avg_wt_by_feed)) %>% 
  ggplot(aes(weight, feed, colour = feed, show.legend = F)) +
  geom_jitter()

chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  ungroup() %>% 
  mutate(feed = fct_reorder(feed, avg_wt_by_feed)) %>% 
  ggplot(aes(weight, feed, colour = feed, show.legend = F)) +
  geom_jitter(show.legend = F, size = 4, alpha = 0.2, width = 0.05)

chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  ungroup() %>% 
  mutate(feed = fct_reorder(feed, avg_wt_by_feed)) %>% 
  ggplot(aes(weight, feed, colour = feed, show.legend = F)) +
  geom_jitter(show.legend = F, size = 4, alpha = 0.2, width = 0.05) + 
  ## geom_jitter shows all the points of each feed category
  stat_summary(fun = mean, geom = "point", size = 8)
## stat summary shows the avg_wt_by_feed point of each feed category

chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  ungroup() %>% 
  mutate(feed = fct_reorder(feed, avg_wt_by_feed)) %>% 
  ggplot(aes(weight, feed, color = feed, show.legend = F)) +
  geom_jitter(show.legend = F, size = 4, alpha = 0.2, width = 0.05) + 
  ## geom_jitter shows all the points of each feed category
  stat_summary(fun = mean, geom = "point", size = 8, show.legend = F) +
  ## stat summary shows the avg_wt_by_feed point of each feed category
  geom_vline(xintercept = mean(chickwts$weight), color = "grey70", linewidth = 1)

chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  ungroup() %>% 
  mutate(feed = fct_reorder(feed, avg_wt_by_feed)) %>% 
  ggplot(aes(weight, feed, color = feed, show.legend = F)) +
  geom_jitter(show.legend = F, size = 4, alpha = 0.2, width = 0.05) + 
  ## geom_jitter shows all the points of each feed category
  stat_summary(fun = mean, geom = "point", size = 8, show.legend = F) +
  ## stat summary shows the avg_wt_by_feed point of each feed category
  geom_vline(xintercept = mean(chickwts$weight), color = "grey70", linewidth = 1) +
  geom_segment(aes(x = mean(weight), xend = avg_wt_by_feed,
                   y = feed, yend = feed))

chickwts %>% 
  group_by(feed) %>% 
  mutate(avg_wt_by_feed = mean(weight)) %>% 
  ungroup() %>% 
  mutate(feed = fct_reorder(feed, avg_wt_by_feed)) %>% 
  ggplot(aes(weight, feed, color = feed, show.legend = F)) +
  geom_jitter(show.legend = F, size = 4, alpha = 0.2, width = 0.05) + 
  ## geom_jitter shows all the points of each feed category
  stat_summary(fun = mean, geom = "point", size = 8, show.legend = F) +
  ## stat summary shows the avg_wt_by_feed point of each feed category
  geom_vline(xintercept = mean(chickwts$weight), color = "grey70", linewidth = 1) +
  geom_segment(aes(x = mean(weight), xend = avg_wt_by_feed,
                   y = feed, yend = feed), linewidth = 2, show.legend = F) +
  labs(title = "Weight of chickens by feed group (chickwts dataset)",
       x = "Weight of Chickens", y = "Feed") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))


################################################################################
chickwts %>%
  group_by(feed) %>%
  mutate(mean_by_feed = mean(weight)) %>%
  ungroup() %>%
  mutate(feed = fct_reorder(feed, mean_by_feed)) %>%
  ggplot(aes(feed, weight, colour = feed,
             show.legend = F)) +
  coord_flip() +
  geom_jitter(show.legend = F,
              size = 4,
              alpha = 0.2,
              width = 0.05) +
  stat_summary(fun = mean, geom = "point", size = 8, show.legend = F) +
  geom_hline(aes(yintercept = mean(weight)),
             colour = "gray70",
             size = 0.9) +
  geom_segment(aes(x = feed, xend = feed,
                   y = mean(weight), yend = mean_by_feed),
               size = 2, show.legend = F) +
  labs(title = "Weight of chickens by feed group",
       x = "Feed",
       y = "Weight of chickens") +
  theme(legend.position = "none") +
  theme_bw()
################################################################################

chickwts %>%
  group_by(feed) %>%
  mutate(mean_by_feed = mean(weight)) %>%
  ungroup() %>%
  mutate(feed = fct_reorder(feed, mean_by_feed)) %>%
  ggplot(aes(feed, weight, colour = feed)) +
  coord_flip() +
  geom_jitter(show.legend = F,
              size = 4,
              alpha = 0.2,
              width = 0.05) +
  stat_summary(fun = mean, geom = "point", size = 8) +
  geom_hline(aes(yintercept = mean(weight)),
             colour = "gray70",
             size = 0.9) +
  geom_segment(aes(x = feed, xend = feed,
                   y = mean(weight), yend = mean_by_feed),
               size = 2) +
  labs(title = "Weight of chickens by feed group",
       x = "Feed",
       y = "Weight of chickens") +
  theme_bw() +
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5))














