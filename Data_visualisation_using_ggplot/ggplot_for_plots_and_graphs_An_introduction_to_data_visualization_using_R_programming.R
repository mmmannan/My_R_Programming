
####  gg means grammar of graphics

library(tidyverse)
data()

BOD
?BOD
View(BOD)
str(BOD)
dim(BOD)
glimpse(BOD)

ggplot(data = BOD,
       mapping = aes(x = Time,
                     y = demand))

ggplot(data = BOD,
       mapping = aes(x = Time,
                     y = demand))+
  geom_point()

ggplot(data = BOD,
       mapping = aes(x = Time,
                     y = demand))+
  geom_point(size = 5)

ggplot(data = BOD,
       mapping = aes(x = Time,
                     y = demand))+
  geom_point(size = 5)+
  geom_line()

##############################################################
ggplot(data = BOD,
       mapping = aes(x = Time,
                     y = demand))+
  geom_point(size = 5)+
  geom_line(colour = 'red')
##############################################################


ggplot(BOD, aes(Time, demand))+
  geom_point()+
  geom_line()

##############################################################
ggplot(BOD, aes(Time, demand))+
  geom_point(size = 3)+
  geom_line(colour = "red")
##############################################################

BOD %>% 
  ggplot(aes(Time, demand))+ 
  geom_point(size = 5)+
  geom_line(colour = 'red', size = 2)


data()
CO2
?CO2
##### ordered factor means factor with levels
View(CO2)
str(CO2)
dim(CO2)
glimpse(CO2)

unique(CO2$Plant)

# uptake of CO2 by grass plants depends on the ambient concentration of CO2
# In this case, concentration is independent variable and uptake is dependent variable
CO2 %>% 
  ggplot(aes(conc, uptake, colour = Treatment))+
  geom_point()

CO2 %>% 
  ggplot(aes(conc, uptake, colour = Treatment))+
  geom_point()

CO2 %>% 
  ggplot(aes(conc, uptake, colour = Treatment))+
  geom_point(size = 3)

CO2 %>% 
  ggplot(aes(conc, uptake, colour = Treatment))+
  geom_point(size = 4, alpha = 0.5)

CO2 %>% 
  ggplot(aes(conc, uptake, colour = Treatment))+
  geom_point(size = 4, alpha = 0.5)+
  geom_line()

CO2 %>% 
  ggplot(aes(conc, uptake, colour = Treatment))+
  geom_point(size = 4, alpha = 0.5)+
  geom_smooth()
## geom_smooth() shows standard deviation / error
## by default standard error, se = T

CO2 %>% 
  ggplot(aes(conc, uptake, colour = Treatment))+
  geom_point(size = 4, alpha = 0.5)+
  geom_smooth(method = lm, se = F)
## lm means linear model, se means standard error

CO2 %>% 
  ggplot(aes(conc, uptake, colour = Treatment))+
  geom_point(size = 4, alpha = 0.5)+
  geom_smooth(method = lm, se = F)+
  facet_wrap(~Type)

CO2 %>% 
  ggplot(aes(conc, uptake, colour = Treatment))+
  geom_point(size = 4, alpha = 0.5)+
  geom_smooth(method = lm, se = F)+
  facet_wrap(~Type)+
  labs(title = "Atmospheric Concentration VS Uptake of CO2")

CO2 %>% 
  ggplot(aes(conc, uptake, colour = Treatment))+
  geom_point(size = 4, alpha = 0.5)+
  geom_smooth(method = lm, se = F)+
  facet_wrap(~Type)+
  labs(title = "Atmospheric Concentration VS Uptake of CO2")+
  theme_bw()

#################################################################
CO2 %>% 
  ggplot(aes(conc, uptake, colour = Treatment))+
  geom_point(size = 4, alpha = 0.5)+
  geom_smooth(method = lm, se = F)+
  facet_wrap(~Type)+
  labs(title = "Atmospheric Concentration VS Uptake of CO2")+
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5))
#################################################################

## Uptake of CO2 by grass plants depends on the treatment / stress given
## In this case, Treatment is dependent variable and uptake of CO2 is independent variable

CO2 %>% 
  ggplot(aes(Treatment, uptake))+
  geom_boxplot()

CO2 %>% 
  ggplot(aes(Treatment, uptake))+
  geom_boxplot()+
  geom_point()

CO2 %>% 
  ggplot(aes(Treatment, uptake))+
  geom_boxplot()+
  geom_point(aes(size = conc))

CO2 %>% 
  ggplot(aes(Treatment, uptake))+
  geom_boxplot()+
  geom_point(aes(size = conc, colour = Plant))

CO2 %>% 
  ggplot(aes(Treatment, uptake))+
  geom_boxplot()+
  geom_point(alpha = 0.5,
             aes(size = conc, colour = Plant))

CO2 %>% 
  ggplot(aes(Treatment, uptake))+
  geom_boxplot()+
  geom_point(alpha = 0.5,
             aes(size = conc, colour = Plant))+
  coord_flip()       ###################

CO2 %>% 
  ggplot(aes(Treatment, uptake))+
  geom_boxplot()+
  geom_point(alpha = 0.5,
             aes(size = conc, colour = Plant))+
  coord_flip()+   
  theme_bw()

CO2 %>% 
  ggplot(aes(Treatment, uptake))+
  geom_boxplot()+
  geom_point(alpha = 0.5,
             aes(size = conc, colour = Plant))+
  facet_wrap(~Type)+
  coord_flip()+   
  theme_bw()

CO2 %>% 
  ggplot(aes(Treatment, uptake))+
  geom_boxplot()+
  geom_point(alpha = 0.5,
             aes(size = conc, colour = Plant))+
  facet_wrap(~Type)+
  coord_flip()+   
  theme_bw()+
  labs(title = "Chilled VS Nonchilled")

#######################################################################
CO2 %>% 
  ggplot(aes(Treatment, uptake))+
  geom_boxplot()+
  geom_point(alpha = 0.5,
             aes(size = conc, colour = Plant))+
  facet_wrap(~Type)+
  coord_flip()+   
  theme_bw()+
  labs(title = "Chilled VS Nonchilled")+
  theme(plot.title = element_text(hjust = 0.5))
########################################################################

?mpg
glimpse(mpg)
View(mpg)

mpg %>% 
  ggplot(aes(displ, cty))+
  geom_point()
## this scatter plot shows that as the engine size (displ) increases, the city miles per gallon decreases.
## That means as the engine size increases, fuel efficiency decreases.

mpg %>% 
  ggplot(aes(displ, cty))+
  geom_point(aes(colour = drv, size = trans))

mpg %>% 
  ggplot(aes(displ, cty))+
  geom_point(aes(colour = drv, size = trans),
             alpha = 0.5)

mpg %>% 
  ggplot(aes(displ, cty))+
  geom_point(aes(colour = drv, size = trans),
             alpha = 0.5)+
  geom_smooth()       ## non linear model

### grey watermark along the curve (non linear model) / straight line (linear model) is standard error (se)

mpg %>% 
  ggplot(aes(displ, cty))+
  geom_point(aes(colour = drv, size = trans),
             alpha = 0.5)+
  geom_smooth(method = lm)       ## linear model

unique(mpg$year)

mpg %>% 
  ggplot(aes(displ, cty))+
  geom_point(aes(colour = drv, size = trans),
             alpha = 0.5)+
  geom_smooth()+
  facet_wrap(~year)

mpg %>% 
  ggplot(aes(displ, cty))+
  geom_point(aes(colour = drv, size = trans),
             alpha = 0.5)+
  geom_smooth()+
  facet_wrap(~year, nrow = 1)

mpg %>% 
  ggplot(aes(displ, cty))+
  geom_point(aes(colour = drv, size = trans),
             alpha = 0.5)+
  geom_smooth()+
  facet_wrap(~year, nrow = 2)

mpg %>% 
  ggplot(aes(displ, cty))+
  geom_point(aes(colour = drv, size = trans),
             alpha = 0.5)+
  geom_smooth(method = lm)+
  facet_wrap(~year, nrow = 1)

mpg %>% 
  ggplot(aes(displ, cty))+
  geom_point(aes(colour = drv, size = trans),
             alpha = 0.5)+
  geom_smooth(method = lm)+
  facet_wrap(~year, nrow = 1)

mpg %>% 
  ggplot(aes(displ, cty))+
  geom_point(aes(colour = drv, size = trans),
             alpha = 0.5)+
  geom_smooth(method = lm)+
  facet_wrap(~year, nrow = 2)

mpg %>%
  filter(cty < 25) %>% 
  ggplot(aes(displ, cty))+
  geom_point(aes(colour = drv, size = trans),
             alpha = 0.5)+
  geom_smooth(method = lm)+
  facet_wrap(~year, nrow = 1)

mpg %>%
  filter(cty < 25) %>% 
  ggplot(aes(displ, cty))+
  geom_point(aes(colour = drv, size = trans),
             alpha = 0.5)+
  geom_smooth(method = lm)+
  facet_wrap(~year, nrow = 1)+
  labs(x = "Engine Size", y = "MPG in the city",
       title = "Fuel Efficiency")

mpg %>%
  filter(cty < 25) %>% 
  ggplot(aes(displ, cty))+
  geom_point(aes(colour = drv, size = trans),
             alpha = 0.5)+
  geom_smooth(method = lm)+
  facet_wrap(~year, nrow = 1)+
  labs(x = "Engine Size", y = "MPG in the city",
       title = "Fuel Efficiency")+
  theme_bw()

################################################################################
mpg %>%
  filter(cty < 25) %>% 
  ggplot(aes(displ, cty))+
  geom_point(aes(colour = drv, size = trans),
             alpha = 0.5)+
  geom_smooth(method = lm)+
  facet_wrap(~year, nrow = 1)+
  labs(x = "Engine Size", y = "MPG in the city",
       title = "Fuel Efficiency")+
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5))
################################################################################

