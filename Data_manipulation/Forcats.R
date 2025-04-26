library(forcats)
View(gss_cat)

# Dropping unused levels
levels(gss_cat$race)

table(gss_cat$race)
# Or
gss_cat %>% 
  select(race) %>% 
  table()

gss_cat %>% 
  mutate(race = fct_drop(race)) %>% 
  select(race) %>% 
  table()


# Modifying factor order
gss_cat %>% 
  mutate(race = fct_drop(race)) %>% 
  mutate(race = fct_relevel(race, c("White", "Black", "Other"))) %>% 
  select(race) %>% 
  table()


gss_cat %>% 
  ggplot(aes(marital)) +
  geom_bar(fill = 'steelblue')

# fct_infreq orders largest to smallest
gss_cat %>% 
  mutate(marital = fct_infreq(marital)) %>% 
  ggplot(aes(marital)) +
  geom_bar(fill = 'steelblue')

# fct_rev does the opposite order
gss_cat %>% 
  mutate(marital = fct_infreq(marital)) %>% 
  mutate(marital = fct_rev(marital)) %>% 
  ggplot(aes(marital)) +
  geom_bar(fill = "steelblue")


gss_cat %>% 
  group_by(relig) %>% 
  summarise(average_tv = mean(tvhours, na.rm = T)) %>% 
  ggplot(aes(average_tv, relig)) +
  geom_point(size = 4, color = "steelblue")
  
gss_cat %>% 
  group_by(relig) %>% 
  summarise(average_tv = mean(tvhours, na.rm = T)) %>% 
  mutate(relig = fct_reorder(relig, average_tv)) %>% 
  ggplot(aes(average_tv, relig)) +
  geom_point(size = 4, color = "steelblue")


# Modifying factor levels
gss_cat %>% 
  count(partyid)

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


gss_cat %>% 
  mutate(partyid = fct_collapse(partyid,
                                Other = c("No answer", "Don't know", "Other party"),
                                Republican = c("Strong republican", "Not str republican"),
                                Independent = c("Ind,near rep", "Independent", "Ind,near dem"),
                                Democrat = c("Not str democrat", "Strong democrat"))) %>% 
  count(partyid)



  
  
  
  










  
  
  
  