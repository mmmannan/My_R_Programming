library(tidyverse)
data()
?women
head(women)
glimpse(women)
View(women)

ggplot(women, aes(height, weight)) +
  geom_point(size = 3, alpha = 0.5)+
  geom_smooth(method = lm, se = F)+
  theme_bw()+
  labs(title = "Weight explained by Height in Women",
       x = "Height (explanatory or independent variable)",
       y = "Weight (outcome or dependent variable")+
  theme(plot.title = element_text(hjust = 0.5))
# Or,
women %>% 
  ggplot(aes(height, weight)) +
  geom_point(size = 3, alpha = 0.5)+
  geom_smooth(method = lm, se = F)+
  theme_bw()+
  labs(title = "Weight explained by Height in Women",
       x = "Height (explanatory or independent variable)",
       y = "Weight (outcome or dependent variable")+
  theme(plot.title = element_text(hjust = 0.5))

  
# Create a model
# lm(outcome_variable ~ independent variable, data = dataset_name)
# lm(x_variable ~ y_variable, data = dataset_name)
model_1 <- lm(weight ~ height, data = women)
summary(model_1)
 
# Or,
lm(weight ~ height, data = women) %>% 
  summary()


# Predictive modeling
new_data <- data.frame(height = 68)   # predict() function expects a dataframe as argument
predict(model_1, new_data)
## if the height is 68 inch, the predicted weight according to the linear model is 147.0833 lbs

new_data <- data.frame(height = c(68, 70, 72))
round(predict(model_1, new_data))
## if the heights are 68, 70, 72 inch, 
## the predicted weights according to the linear model is around 147, 154, 161 lbs respectively


## Residual means the distance or, difference 
## between the actual value in the dataset and the predicted value by the model

## In this case, y intercept is meaningless because no women has 0 height
## y intercept is the y value when the x value is 0

## slope means the change in y value due to 1 unit change in x value
## In this case, slope 3.45 means increase in 3.45 lbs weight occurs due to increase in 1 inch height

## In linear regression, MUltiple R-squared is used
## Multiple R-squared 0.991 means 99% change in weight can be explained by change in height
## Adjusted R-squared is used in multiple regression


