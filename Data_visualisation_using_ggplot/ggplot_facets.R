# facets disaggregate the data by categorical variables 
# to look at the plot next to each other to see the differences
# facets can be either or both horizontally or vertically 
# tilde (~) means by

library(tidyverse)

library(gapminder)

glimpse(gapminder)
names(gapminder)
unique(gapminder$continent)

gapminder %>% 
  filter(continent %in% c("Asia", "Europe", "Africa", "Americas")) %>% 
  ggplot(aes(gdpPercap, lifeExp, colour = continent, shape = continent)) +
  geom_point(alpha = 0.5) +
  labs(title = "Life Expectancy as a function of Wealth",
       x = "GDP per Capita", y = "Life Expectancy",
       colour = "Region", shape = "Region") +
  theme_bw()

gapminder %>% 
  filter(continent != "Oceania") %>% 
  ggplot(aes(gdpPercap, lifeExp, colour = continent, shape = continent)) +
  geom_point(alpha = 0.5) +
  labs(title = "Life Expectancy as a function of Wealth",
       x = "GDP per Capita", y = "Life Expectancy",
       colour = "Region", shape = "Region") +
  theme_bw()

################################################################################
gapminder %>% 
  filter(gdpPercap < 40000 & continent != "Oceania") %>% 
  ggplot(mapping = aes(x = gdpPercap, y = lifeExp, colour = continent)) +
  geom_point(shape = "square", alpha = 0.4, size = 2) +
  labs(title = "Life Expectancy as a function of Wealth",
       x = "GDP per Capita", y = "Life Expectancy",
       colour = "Region") +
  theme_bw()
################################################################################


gapminder %>% 
  filter(gdpPercap < 40000 & continent != "Oceania") %>% 
  ggplot(mapping = aes(x = gdpPercap, y = lifeExp, colour = year)) +
  geom_jitter(shape = "square", alpha = 0.4, size = 2) +
  facet_wrap(~continent) +
  labs(title = "Life Expectancy as a function of Wealth",
       x = "GDP per Capita", y = "Life Expectancy",
       colour = "Year") +
  theme_bw()

################################################################################
gapminder %>% 
  filter(gdpPercap < 40000 & continent != "Oceania") %>% 
  ggplot(mapping = aes(x = gdpPercap, y = lifeExp, colour = year)) +
  geom_jitter(shape = "square", alpha = 0.4, size = 2) +
  geom_smooth() +
  facet_wrap(~continent) +
  labs(title = "Life Expectancy as a function of Wealth",
       x = "GDP per Capita", y = "Life Expectancy",
       colour = "Year") +
  theme_bw()
################################################################################



library(forcats)

glimpse(gss_cat)
names(gss_cat)
unique(gss_cat$partyid)

gss_cat %>% 
  filter(partyid %in% c("Independent", "Strong democrat", "Strong republican")) %>%
  ggplot(aes(age)) +
  geom_histogram(fill = "steelblue") +
  facet_wrap(~partyid) +
  labs(title = "Age distribution by political affiliation",
       x = "", y = "") +
  theme_bw()

gss_cat %>% 
  filter(partyid %in% c("Independent", "Strong democrat", "Strong republican")) %>%
  ggplot(aes(age)) +
  geom_histogram(binwidth = 5, fill = "steelblue", alpha = 0.8) +
  # binwidth means class width/ shreni bebodhan
  facet_wrap(~partyid, nrow = 1) +
  labs(title = "Age distribution by political affiliation",
       x = "", y = "") +
  theme_bw()

################################################################################
gss_cat %>% 
  filter(partyid %in% c("Independent", "Strong democrat", "Strong republican")) %>%
  ggplot(aes(age)) +
  geom_histogram(binwidth = 5, fill = "steelblue", alpha = 0.8) +
  facet_wrap(~partyid, nrow = 1, ncol = 3, strip.position = "bottom") +
  labs(title = "Age distribution by political affiliation",
       x = "", y = "") +
  theme_bw()
################################################################################


unique(gss_cat$relig)

gss_cat %>% 
  filter(tvhours <= 6) %>% 
  filter(partyid %in% c("Independent", "Strong democrat", "Strong republican")) %>% 
  filter(relig %in% c("Christian", "Moslem/islam")) %>% 
  ggplot(aes(tvhours, colour = partyid, fill = partyid)) +
  geom_density(alpha = 0.3) +
  facet_grid(relig ~ partyid) +
  labs(title = "TV watching by political and religious affiliation",
       x = "Hour spent watching TV", y = "") +
  theme_bw()

################################################################################
gss_cat %>% 
  mutate(relig = recode(relig, "Moslem/islam" = "Muslim")) %>% 
  filter(relig %in% c("Christian", "Muslim") &
           partyid %in% c("Independent", "Strong democrat", "Strong republican") &
           tvhours < 10) %>% 
  ggplot(aes(x = tvhours, color = partyid, fill = partyid)) +
  geom_density(alpha = 0.3, show.legend = F) +
  facet_grid(relig ~ partyid) +
  labs(title = "TV watching by political and religious affiliation",
       x = "Hour spent watching TV", y = "") +
  theme_bw()
################################################################################

gss_cat %>% 
  mutate(relig = recode(relig, "Moslem/islam" = "Muslim")) %>% 
  filter(relig %in% c("Christian", "Muslim") &
           partyid %in% c("Independent", "Strong democrat", "Strong republican") &
           tvhours < 10) %>% 
  ggplot(aes(x = tvhours, color = partyid, fill = partyid)) +
  geom_density(alpha = 0.3, show.legend = F) +
  facet_grid(partyid ~ relig) +
  labs(title = "TV watching by political and religious affiliation",
       x = "Hour spent watching TV", y = "") +
  theme_bw()

gss_cat %>% 
  mutate(relig = recode(relig, "Moslem/islam" = "Muslim")) %>% 
  filter(relig %in% c("Christian", "Muslim") &
           partyid %in% c("Independent", "Strong democrat", "Strong republican") &
           tvhours < 10) %>% 
  ggplot(aes(x = tvhours, color = relig, fill = relig)) +
  geom_density(alpha = 0.3, show.legend = F) +
  facet_grid(partyid ~ relig) +
  labs(title = "TV watching by political and religious affiliation",
       x = "Hour spent watching TV", y = "") +
  theme_bw()



