library(tidyverse)
data()
head(cars, 10)
glimpse(cars)
View(cars)

# Create a model
# lm(outcome_variable ~ independent variable, data = dataset_name)
# lm(x_variable ~ y_variable, data = dataset_name)
cars %>% 
  lm(dist ~ speed, data = .) %>% 
  summary()
# Or,
model <- lm(dist ~ speed, data = cars)
model
summary(model)

attributes(model)
model$residuals
hist(model$residuals)

new_speeds <- data.frame(speed = c(10, 15, 20))

predict(model, new_speeds) %>% round(1)

# Or,
cars %>% 
  lm(dist ~ speed, data = .) %>% 
  predict(data.frame(speed = c(10, 15, 20))) %>% 
  round()

# plot
ggplot(cars, aes(speed, dist)) +
  geom_jitter() +
  geom_smooth()

ggplot(cars, aes(speed, dist)) +
  geom_jitter() +
  geom_smooth(method = lm)

ggplot(cars, aes(speed, dist)) +
  geom_jitter() +
  geom_smooth(method = lm, se = F)

ggplot(cars, aes(speed, dist)) +
  geom_jitter(colour = "#DE3E4B") +
  geom_smooth(method = lm, se = F)

ggplot(cars, aes(speed, dist)) +
  geom_jitter(colour = "#DE3E4B") +
  geom_smooth(method = lm, se = F)+
  theme_bw()

ggplot(cars, aes(speed, dist)) +
  geom_jitter(colour = "#DE3E4B") +
  geom_smooth(method = lm, se = F)+
  theme_bw()+
  labs(title = "The relationship between speed and stopping distance",
       x = "speed of car",
       y = "Distance taken to stop")+
  theme(plot.title = element_text(hjust = 0.5))

ggplot(cars, aes(speed, dist)) +
  geom_point(colour = "#DE3E4B") +
  geom_smooth(method = lm, se = F)+
  theme_bw()+
  labs(title = "The relationship between speed and stopping distance",
       x = "speed of car",
       y = "Distance taken to stop")+
  theme(plot.title = element_text(hjust = 0.5))



