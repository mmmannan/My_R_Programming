# categorical variable means factor
# forcats : tools for working with categorical variables (factors)

library(tidyverse)
library(forcats)
install.packages("patchwork")
library(patchwork)

?forcats
data()
View(gss_cat)
dim(gss_cat)
glimpse(gss_cat)

table(gss_cat$marital)
sort(table(gss_cat$marital))
sort(table(gss_cat$marital), decreasing = TRUE)

barplot(table(gss_cat$marital))
barplot(sort(table(gss_cat$marital)))
barplot(sort(table(gss_cat$marital), decreasing = TRUE))


# The order of categorical variables matters
p1
p2
p3

###### each variables/columns in a data set is a vector

unique(gss_cat$race)
# Same as
gss_cat %>% 
  pull(race) %>%      # pulls out the race vector / variable
  unique()

?count()
# count(data_set, vector_or_variable)
count(gss_cat, race)      # by default increasing
count(gss_cat, race, sort = T)       # decreasing
count(gss_cat, race, sort = TRUE)
# same as
# data_set %>%  count(vector_or_variable)
gss_cat %>% 
  count(race)       # by default increasing

gss_cat %>% 
  count(race, sort = T)


levels(gss_cat$race)
# same as
gss_cat %>% 
  pull(race) %>% 
  levels()

gss_cat %>% select(race) %>% View()


table(gss_cat$race)  
# same as
gss_cat %>% 
  select(race) %>% 
  table()
  
gss_cat %>% 
  select(race, marital) %>% 
  table()
 

# here using function from forcats
# to get rid of "Not applicable" factor which has 0 count
gss_cat %>% 
  mutate(fct_drop(race)) %>% 
  View()

gss_cat %>% 
  mutate(race = fct_drop(race)) %>% 
  View()

gss_cat %>% 
  mutate(race = fct_drop(race)) %>% 
  pull(race) 

gss_cat %>% 
  mutate(race = fct_drop(race)) %>% 
  pull(race) %>% 
  levels()

gss_cat %>% xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  mutate(race = fct_drop(race)) %>% 
  pull(race) %>% 
  levels() %>% 
  ggplot(aes(race)) +
  geom_bar()



# Order a factor levels by the value
# of another numeric variables
gss_cat %>% 
  drop_na(tvhours) %>% 
  group_by(relig) %>% 
  summarise(avg_tv = mean(tvhours)) %>% 
  View()


gss_cat %>% 
  drop_na(tvhours) %>% 
  group_by(relig) %>% 
  summarise(avg_tv = mean(tvhours)) %>% 
  ggplot(aes(avg_tv, relig)) +
  geom_point()

gss_cat %>% 
  drop_na(tvhours) %>% 
  group_by(relig) %>% 
  summarise(avg_tv = mean(tvhours)) %>% 
  ggplot(aes(avg_tv, relig)) +
  geom_point(size = 4)


gss_cat %>% 
  drop_na(tvhours) %>% 
  group_by(relig) %>% 
  summarise(avg_tv = mean(tvhours)) %>% 
  mutate(fct_reorder(relig, avg_tv)) %>%   
  View()
# fct_reorder(variable to order, according to which variable)  
gss_cat %>% 
  drop_na(tvhours) %>% 
  group_by(relig) %>% 
  summarise(avg_tv = mean(tvhours)) %>% 
  mutate(relig = fct_reorder(relig, avg_tv)) %>%   
  View()

gss_cat %>% 
  drop_na(tvhours) %>% 
  group_by(relig) %>% 
  summarise(avg_tv = mean(tvhours)) %>% 
  mutate(relig = fct_reorder(relig, avg_tv)) %>% 
  ggplot(aes(avg_tv, relig)) + 
  geom_point(size = 4)



levels(gss_cat$rincome)
# same as
gss_cat %>% 
  pull(rincome) %>% 
  levels()


table(gss_cat$rincome)


gss_cat %>% 
  count(rincome) 

barplot(sort(table(gss_cat$rincome)))

unique(gss_cat$rincome)


gss_cat %>% 
  drop_na(age) %>% 
  filter(rincome == "Not application") %>% 
  View()

gss_cat %>% 
  drop_na(age) %>% 
  filter(rincome != "Not application") %>% 
  View()

gss_cat %>% 
  drop_na(age) %>% 
  filter(rincome != "Not application") %>% 
  group_by(rincome) %>% 
  summarise(avg_age = mean(age)) %>% 
  View()

gss_cat %>% 
  drop_na(age) %>% 
  filter(rincome != "Not applicable") %>% 
  group_by(rincome) %>% 
  summarise(avg_age = mean(age)) %>% 
  ggplot(aes(avg_age, rincome)) +
  geom_point(size = 3)


gss_cat %>% 
  drop_na(age) %>% 
  filter(rincome != "Not applicable") %>% 
  group_by(rincome) %>% 
  summarise(avg_age = mean(age)) %>% 
  mutate(rincome = fct_reorder(rincome, avg_age)) %>% 
  ggplot(aes(avg_age, rincome)) +
  geom_point(size = 3)


# Reverse factor levels
gss_cat %>%                ## Problem
  filter(rincome != "Not applicable") %>% 
  group_by(rincome) %>% 
  summarise(avg_age = mean(age)) %>% 
  mutate(rincome = fct_rev(rincome)) %>% 
  ggplot(aes(avg_age, rincome)) +
  geom_point(size = 4)

gss_cat %>%                ## Problem
  filter(rincome != "Not applicable") %>% 
  group_by(rincome) %>% 
  summarise(avg_age = mean(age)) %>% 
  mutate(rincome = fct_rev(rincome)) %>% 
  ggplot(aes(avg_age, rincome)) +
  geom_point(size = 4)

gss_cat %>% 
  drop_na(age) %>% 
  filter(rincome != "Not applicable") %>% 
  group_by(rincome) %>% 
  summarise(avg_age = mean(age)) %>% 
  mutate(rincome = fct_rev(rincome)) %>% 
  ggplot(aes(avg_age, rincome)) +
  geom_point(size = 4)



# Order factor levels by frequency of the value of that variable
gss_cat %>% 
  count(marital)

gss_cat %>% 
  ggplot(aes(marital)) +
  geom_bar()

gss_cat %>% 
  mutate(marital = fct_infreq(marital)) %>% 
  # fct_infreq() orders things in order of frequency/gonosongkha
  count(marital)

gss_cat %>% 
  mutate(marital = fct_infreq(marital)) %>% 
  mutate(marital = fct_rev(marital)) %>% 
  count(marital)

gss_cat %>% 
  mutate(marital = fct_infreq(marital)) %>% 
  mutate(marital = fct_rev(marital)) %>% 
  ggplot(aes(marital)) +
  geom_bar()

gss_cat %>% 
  mutate(marital = fct_infreq(marital)) %>% 
  mutate(marital = fct_rev(marital)) %>% 
  ggplot(aes(marital)) +
  geom_bar(fill = "steelblue") +
  theme_bw()

gss_cat %>% 
  mutate(marital = fct_infreq(marital)) %>% 
  mutate(marital = fct_rev(marital)) %>% 
  ggplot(aes(marital)) +
  geom_bar(fill = "steelblue", alpha = 0.5) +
  theme_bw()

########################################################################
gss_cat %>% 
  mutate(marital = marital %>% fct_infreq() %>% fct_rev()) %>% 
  ggplot(aes(marital)) +
  geom_bar(fill = "steelblue", alpha = 0.5) +
  theme_bw()
########################################################################

gss_cat %>% 
  mutate(marital = fct_infreq(marital)) %>% 
  ggplot(aes(marital)) +
  geom_bar(fill = "steelblue", alpha = 0.5) +
  theme_bw()

gss_cat %>% 
  mutate(marital = marital %>% fct_infreq()) %>% 
  ggplot(aes(marital)) +
  geom_bar(fill = "steelblue", alpha = 0.5) +
  theme_bw()


# Recode factors

unique(gss_cat$partyid)

gss_cat %>% 
  mutate(fct_recode(partyid,
                              "Republican, strong" = "Strong republican",
                              "Republican, weak" = "Not str republican",
                              "Independent, near rep" = "Ind,near rep",
                              "Independent, near dem" = "Ind,near dem",
                              "Democrat, weak" = "Not str democrat",
                              "Democrat, strong" = "Strong democrat",
                              "Other" = "No answer",
                              "Other" = "Don't know",
                              "Other" = "Other party"
  )) %>% 
  View()

gss_cat %>% 
  mutate(partyid = fct_recode(partyid,
                              "Republican, strong" = "Strong republican",
                              "Republican, weak" = "Not str republican",
                              "Independent, near rep" = "Ind,near rep",
                              "Independent, near dem" = "Ind,near dem",
                              "Democrat, weak" = "Not str democrat",
                              "Democrat, strong" = "Strong democrat",
                              "Other" = "No answer",
                              "Other" = "Don't know",
                              "Other" = "Other party"
  )) %>% 
  View()

gss_cat %>% 
  count(partyid)

################################################################################
gss_cat %>% 
  mutate(partyid = fct_recode(partyid,
                    "Republican, strong" = "Strong republican",
                    "Republican, weak" = "Not str republican",
                    "Independent, near rep" = "Ind,near rep",
                    "Independent, near dem" = "Ind,near dem",
                    "Democrat, weak" = "Not str democrat",
                    "Democrat, strong" = "Strong democrat",
                    "Other" = "No answer",
                    "Other" = "Don't know",
                    "Other" = "Other party"
                    )) %>% 
  count(partyid)
################################################################################


# Collapsing factors

gss_cat %>% 
  mutate(fct_collapse(partyid,
                      other = c("No answer", "Don't know", "Other party"),
                      rep = c("Strong republican", "Not str republican"),
                      ind = c("Ind,near rep", "Independent", "Ind,near dem"),
                      dem = c("Not str democrat", "Strong democrat"))) %>% 
  View()

gss_cat %>% 
  mutate(partyid = fct_collapse(partyid,
                      other = c("No answer", "Don't know", "Other party"),
                      rep = c("Strong republican", "Not str republican"),
                      ind = c("Ind,near rep", "Independent", "Ind,near dem"),
                      dem = c("Not str democrat", "Strong democrat"))) %>% 
  View()

################################################################################
gss_cat %>% 
  mutate(partyid = fct_collapse(partyid,
                                other = c("No answer", "Don't know", "Other party"),
                                rep = c("Strong republican", "Not str republican"),
                                ind = c("Ind,near rep", "Independent", "Ind,near dem"),
                                dem = c("Not str democrat", "Strong democrat"))) %>% 
  count(partyid)
################################################################################

gss_cat %>%  count()    # gives the number of observations/rows in a data set


# Lumping into others
gss_cat %>% 
  count(relig, sort = T)

################################################################################
gss_cat %>% 
  mutate(relig = fct_lump(relig, n = 2)) %>% 
  count(relig)
################################################################################

gss_cat %>% 
  mutate(relig = fct_lump(relig, n = 2)) %>% 
  count(relig, sort = T)

gss_cat %>% 
  mutate(relig = fct_lump(relig, n = 3)) %>% 
  count(relig)

gss_cat %>% 
  mutate(relig = fct_lump(relig, n = 4)) %>% 
  count(relig)



# Reordering a factor y (variable) by its value corresponding to
# the largest x (another variable) value

is.na(gss_cat$age)
gss_cat %>% 
  select(marital, age) %>% 
  filter(is.na(age)) %>% 
  View()

!is.na(gss_cat$age)
gss_cat %>% 
  select(marital, age) %>% 
  filter(!is.na(age)) %>% 
  View()

gss_cat %>% 
  filter(!is.na(age)) %>% 
  filter(marital %in% c("Never married",
                        "Married",
                        "Widowed")) %>% 
  View()

gss_cat %>% 
  filter(!is.na(age)) %>% 
  filter(marital %in% c("Never married",
                        "Married",
                        "Widowed")) %>% 
  count(age, marital) %>% 
  View()

gss_cat %>% 
  filter(!is.na(age)) %>% 
  filter(marital %in% c("Never married",
                        "Married",
                        "Widowed")) %>% 
  count(age, marital) %>% 
  group_by(age) %>% 
  View()


gss_cat %>% 
  filter(!is.na(age)) %>% 
  filter(marital %in% c("Never married",
                        "Married",
                        "Widowed")) %>% 
  count(age, marital) %>% 
  mutate(prop = n / sum(n)) %>% 
  ggplot(aes(age, prop)) +        ## Very very bad
  geom_line()


gss_cat %>% 
  filter(!is.na(age)) %>% 
  filter(marital %in% c("Never married",
                        "Married",
                        "Widowed")) %>% 
  count(age, marital) %>% 
  mutate(prop = n / sum(n)) %>% 
  ggplot(aes(age, prop, col = marital)) +
  geom_line()

gss_cat %>% 
  filter(!is.na(age)) %>% 
  filter(marital %in% c("Never married",
                        "Married",
                        "Widowed")) %>% 
  count(age, marital) %>% 
  mutate(prop = n / sum(n)) %>% 
  ggplot(aes(age, prop, col = marital)) +
  geom_line(size = 1.5)


gss_cat %>% 
  filter(!is.na(age)) %>% 
  filter(marital %in% c("Never married",
                        "Married",
                        "Widowed")) %>% 
  count(age, marital) %>% 
  group_by(age) %>% 
  mutate(prop = n / sum(n)) %>% 
  ggplot(aes(age, prop, col = marital)) +
  geom_line(size = 1.5) +
  theme_minimal()

gss_cat %>% 
  filter(!is.na(age)) %>% 
  filter(marital %in% c("Never married",
                        "Married",
                        "Widowed")) %>% 
  count(age, marital) %>% 
  group_by(age) %>% 
  mutate(prop = n / sum(n)) %>% 
  ggplot(aes(age, prop, colour = marital)) +  ######
  geom_line(size = 1.5) +
  theme_minimal()

gss_cat %>% 
  filter(!is.na(age)) %>% 
  filter(marital %in% c("Never married",
                        "Married",
                        "Widowed")) %>% 
  count(age, marital) %>% 
  group_by(age) %>% 
  mutate(prop = n / sum(n)) %>% 
  ggplot(aes(age, prop, colour = marital)) +
  geom_line(size = 1.5, na.rm = TRUE) +
  theme_minimal()



gss_cat %>% 
  filter(!is.na(age)) %>% 
  filter(marital %in% c("Never married",
                        "Married",
                        "Widowed")) %>% 
  count(age, marital) %>% 
  group_by(age) %>% 
  mutate(prop = n / sum(n)) %>% 
  mutate(marital = fct_reorder2(marital, age, prop)) %>% 
  mutate(marital = fct_rev(marital)) %>% 
  ggplot(aes(age, prop, colour = marital)) +
  geom_line(size = 1.5, na.rm = TRUE) +
  theme_minimal()


