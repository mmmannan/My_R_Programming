## When you plot a single categorical variable, you get bar chart
## When you plot a single numeric variable, you get histogram
library(tidyverse)
data()
?msleep
View(msleep)
glimpse(msleep)

unique(msleep$vore)


msleep %>%
  ggplot(aes(x = vore))+
  geom_bar()

msleep %>%        ######## Creates a bar for NA category
  ggplot(aes(x = vore))+
  geom_bar(fill = "#97B3C6")+
  theme_bw()+
  labs(x = "Who eats what?", y = NULL,
       title = "Number of Observations per Vore")


### Always use drop_na(variable_1, variable_2, ...) ==>> it will only remove observations which have NA in variables of interest
### Never use drop_na() ==>> it will remove necessary observations which don't have NA in variables of interest,
### but have NA in other observations


### Get Hexadecimal colour code from https://htmlcolorcodes.com/

msleep %>%
  drop_na(vore) %>%       ### Do in this way
  ggplot(aes(vore))+
  geom_bar(fill = "#97B3C6")+
  theme_bw()+
  labs(x = "Vore", y = NULL,
       title = "Number of Observations per Vore")
## In graph, herbi > 30

msleep %>%
  drop_na() %>%   ####### Never do in this way
  ggplot(aes(x = vore))+
  geom_bar(fill = "#97B3C6")+
  theme_bw()+
  labs(x = "Vore", y = NULL,
       title = "Number of Observations per Vore") 
## In graph, herbi < 10 ==>> Error

msleep %>%
  drop_na(vore) %>%       
  ggplot(aes(x = vore))+
  geom_bar(fill = "#3C963C")+
  theme_bw()+
  labs(x = "Vore", y = NULL,
       title = "Number of Observations per Vore")

msleep %>%
  drop_na(vore) %>%       
  ggplot(aes(x = vore))+
  geom_bar(fill = "#97B3C6")+
  coord_flip()+
  theme_bw()+
  labs(x = "Vore", y = NULL,
       title = "Number of Observations per Vore")


##########################################################################

### Single Categorical

msleep %>%
  drop_na(vore) %>%       ### Do in this way
  ggplot(aes(x = vore))+
  geom_bar(fill = "#97B3C6")+
  #coord_flip()+
  theme_bw()+
  labs(x = "Vore", y = NULL,
       title = "Number of Observations per Vore")+
  theme(plot.title = element_text(hjust = 0.5))

###########################################################################

# use fct_infreq(vore) to create order
msleep %>%
  drop_na(vore) %>%     
  ggplot(aes(x = fct_infreq(vore)))+
  geom_bar(fill = "#97B3C6")+
  theme_bw()+
  labs(x = "Vore", y = NULL,
       title = "Number of Observations per Vore")+
  theme(plot.title = element_text(hjust = 0.5))

msleep %>%
  drop_na(vore) %>%     
  ggplot(aes(fct_infreq(vore)))+
  geom_bar(fill = "#3C963C")+
  theme_bw()+
  labs(x = "Vore", y = NULL,
       title = "Number of Observations per Vore")


table(msleep$vore)
sort(table(msleep$vore))
barplot(sort(table(msleep$vore)))
barplot(sort(table(msleep$vore), decreasing = T))


msleep %>%
  drop_na(vore) %>%     
  ggplot(aes(x = fct_infreq(vore)))+
  geom_bar(fill = "#97B3C6")+
  coord_flip()+
  theme_bw()+
  labs(x = "Vore", y = NULL,
       title = "Number of Observations per Vore")


msleep %>% 
  ggplot(aes(awake))+
  geom_histogram()   ### Not looks good and continuous

# bin means class / shreni
# binwidth means class range / shreni bebodhan

msleep %>% 
  ggplot(aes(awake))+
  geom_histogram(binwidth = 1)

msleep %>% 
  ggplot(aes(awake))+
  geom_histogram(binwidth = 2)

msleep %>% 
  ggplot(aes(awake))+
  geom_histogram(binwidth = 3)

msleep %>% 
  ggplot(aes(awake))+
  geom_histogram(binwidth = 2, fill = "#3C963C")

msleep %>% 
  ggplot(aes(awake))+
  geom_histogram(binwidth = 2, fill = "#97B3C6")+
  theme_bw()+
  labs(x = "Awake Time (hour)",
       y = NULL,
       title = "Histogram of Awake time")


##########################################################################

### Single Numeric

msleep %>% 
  ggplot(aes(awake))+
  geom_histogram(binwidth = 2, fill = "#97B3C6")+
  theme_bw()+
  labs(x = "Awake Time (hour)",
       y = NULL,
       title = "Histogram of Awake time")+
  theme(plot.title = element_text(hjust = 0.5))
##########################################################################


msleep %>% 
  ggplot(aes(awake))+
  geom_histogram(binwidth = 2, fill = "#712b1c")+
  theme_bw()+
  labs(x = "Awake Time (hour)",
       y = NULL,
       title = "Histogram of Awake time")+
  theme(plot.title = element_text(hjust = 0.5))


