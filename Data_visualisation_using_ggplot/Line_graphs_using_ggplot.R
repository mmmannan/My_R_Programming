library(tidyverse)

View(Orange)
glimpse(Orange)
## In Orange data set, Tree is a categorical variable (in this case, ordered factor)
## Tree type 1, Tree type 2, Tree type 3 each are different categories

Orange %>% 
  ggplot(aes(age, circumference)) +
  geom_point()+
  theme_bw()+
  labs(title = "Circumference Vs Age of Trees")

Orange %>% 
  ggplot(aes(age, circumference)) +
  geom_point()+
  geom_smooth()+
  theme_bw()+
  labs(title = "Circumference Vs Age of Trees")

unique(Orange$Tree)

# One Categorical (Tree) and two numeric (age, circumference)

Orange %>% 
  ggplot(aes(age, circumference)) +
  geom_point()+
  geom_smooth()+
  facet_wrap(~Tree)+
  theme_bw()+
  labs(title = "Circumference Vs Age of Trees")

## the subplots are shown according to the levels of Tree variable

####################################################################
Orange %>% 
  filter(Tree != 2) %>% 
  ggplot(aes(age, circumference)) +
  geom_point()+
  geom_smooth()+
  facet_wrap(~Tree)+
  theme_bw()+
  labs(title = "Circumference Vs Age of Trees")+
  theme(plot.title = element_text(hjust = 0.5))
####################################################################


Orange %>% 
  ggplot(aes(age, circumference, colour = Tree))+ 
  geom_point()+
  geom_line()+
  theme_minimal()+
  labs(title = "Circumference Vs Age of Trees")+
  theme(plot.title = element_text(hjust = 0.5))

Orange %>% 
  ggplot(aes(age, circumference, colour = Tree))+ 
  geom_point(size = 5, alpha = 0.5)+
  geom_line(size = 1)+
  theme_minimal()+
  labs(title = "Circumference Vs Age of Trees")+
  theme(plot.title = element_text(hjust = 0.5))

##########################################################################
# One Categorical (Tree) and two numeric (age, circumference)
Orange %>% 
  filter(Tree != 1 & Tree != 2) %>% 
  ggplot(aes(age, circumference, colour = Tree))+ 
  geom_point(size = 5, alpha = 0.5)+
  geom_line(size = 1)+
  theme_minimal()+
  labs(title = "Circumference Vs Age of Trees")+
  theme(plot.title = element_text(hjust = 0.5))
##########################################################################

class(Orange$Tree)

Orange %>% 
  filter(Tree != "1" & Tree != "2") %>% 
  ggplot(aes(age, circumference, colour = Tree))+ 
  geom_point(size = 5, alpha = 0.5)+
  geom_line(size = 1)+
  theme_minimal()+
  labs(title = "Circumference Vs Age of Trees")+
  theme(plot.title = element_text(hjust = 0.5))















