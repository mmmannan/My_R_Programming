library(tidyverse)

mtcars %>% 
  mutate(predicted = predict(lm(mpg ~ wt, data = .))) %>% 
  ggplot(aes(wt, mpg)) + 
  geom_point(size = 1.5) +
  geom_smooth(method = lm, se = F, size = 0.5) +
  geom_segment(aes(xend = wt, yend = predicted), color = "red") +
  theme_bw()

model <- lm(mpg ~ wt, data = mtcars)
mtcars %>% 
  mutate(predicted = predict(lm(mpg ~ wt, data = .))) %>% 
  ggplot(aes(wt, mpg)) + 
  geom_point(size = 1.5) +
  geom_smooth(method = lm, se = F, size = 0.5) +
  geom_segment(aes(xend = wt, yend = predicted), color = "red") +
  theme_bw() +
  annotate("text", x = 4, y = 28, label = paste("R-squared =", round(summary(model)$r.squared, 2))) 
# Add Multiple R-squared value for this simple linear regression in the plot



model <- lm(mpg ~ wt, data = mtcars)
plot(model)


# 4 assumptions
# 1) The relationship between the two variables is linear
# 2) Residuals are normally distributed
# 3) Residuals are homoscedastic
# 4) Residuals are independence



# Harvey-Collier Multiplier Test for Linearity
install.packages("lmtest")
library(lmtest)

harvtest(model)


# Shapiro-Wilk Test for normality
shapiro.test(residuals(model))



# Breusch-Pagan test for heteroscedasticity
# Or, Cook-Weisberg test
bptest(model)



# Durbin Watson test for independence / dependence
# Durbin Watson test comes with car package
library(car)

durbinWatsonTest(model)
# For this model, D-W Statistic is 1.251727 which is close to 2
# Therefore, residuals are independent in this model


######## Time series problem ###############
install.packages("nlme")
library(nlme)

?Orthodont
View(Orthodont)
glimpse(Orthodont)


Orthodont %>% 
  mutate(age = factor(age)) %>% 
  glimpse()
  
Orthodont %>% 
  mutate(age = factor(age)) %>% 
  ggplot(aes(age, distance, group = Subject, color = Subject)) +
  geom_point() +
  geom_line() +
  theme_minimal()

Orthodont %>% 
  ggplot(aes(age, distance, group = Subject, color = Subject)) +
  geom_point() +
  geom_line() +
  theme_minimal() +
  labs(title = "Orthodontic Distance vs. Age by Subject",
       x = "Age", y = "Distance") +
  theme(plot.title = element_text(hjust = 0.5))


