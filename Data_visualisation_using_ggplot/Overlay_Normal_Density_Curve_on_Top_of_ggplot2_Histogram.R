
set.seed(119864293)                   # Create an example data
data <- data.frame(x = rnorm(300))
View(data)
glimpse(data)
names(data)

library(ggplot2)

ggplot(data, aes(x)) +
  geom_histogram()

ggplot(data, aes(x)) +
  geom_histogram(aes(y = ..density..))

ggplot(data, aes(x)) +
  geom_histogram(aes(y = ..density..)) +
  stat_function(fun = dnorm,
                args = list(mean = mean(data$x),
                            sd = sd(data$x)),
                col = "#1b98e0",
                size = 5)

ggplot(data, aes(x)) +
  geom_density(linewidth = 5, col = "steelblue")


# Histogram
hist(data$x, freq = FALSE)
# Density
dx <- density(data$x)
lines(dx$x, dx$y, col = 2, lwd = 2)
# Theoretical mode
abline(v = 0, col = 4, lty = 2, lwd = 3)   # lwd=line width, lty =linetype



msleep %>% 
  ggplot(aes(sleep_total)) +
  geom_histogram(binwidth = 2, aes(y = ..density..)) +
  theme_bw() +
  stat_function(fun = dnorm,
                args = list(mean = mean(msleep$sleep_total),
                            sd = sd(msleep$sleep_total)),
                col = "red", linewidth = 3)



library(tidyverse)

summary(trees$Volume)

trees %>% 
  ggplot(aes(Volume)) +
  geom_histogram(binwidth = 20, aes(y = ..density..),
                 fill = "steelblue", alpha = 0.5) +
  stat_function(fun = dnorm,
                args = list(mean = mean(trees$Volume),
                            sd = sd(trees$Volume)),
                col = "blue", linewidth = 3) +
  theme_bw() +
  labs(title = "Distribution of Volume of Trees") +
  theme(plot.title = element_text(size = 20, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 15, face = "bold")) +
  annotate("text", x = 70, y = 0.02,
           label = "Right-skewed Distribution",
           color = "red", size = 5)
  

install.packages("DescTools")
library(DescTools)

mode <- Mode(trees$Volume)
print(mode)


install.packages("modeest")
library(modeest)
# Moda
mlv(trees$Volume, method = "meanshift")



trees %>% 
  ggplot(aes(Volume)) +
  geom_histogram(binwidth = 20, aes(y = ..density..),
                 fill = "steelblue", alpha = 0.5) +
  stat_function(fun = dnorm,
                args = list(mean = mean(trees$Volume),
                            sd = sd(trees$Volume)),
                col = "blue", linewidth = 3) +
  geom_vline(xintercept = mean(trees$Volume), size = 2, color = "darkgreen") +
  geom_vline(xintercept = median(trees$Volume), size = 2, color = "orange") +
  theme_bw() +
  labs(title = "Distribution of Volume of Trees") +
  theme(plot.title = element_text(size = 20, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 15, face = "bold")) +
  annotate("text", x = 70, y = 0.02,
           label = "Right-skewed Distribution",
           color = "red", size = 5)




                     
set.seed(123)  # For reproducibility
# Generate 400 values from a gamma distribution
data <- rgamma(400, shape = 2, rate = 1)         ### vector
data_2 <- data.frame(data)
View(data_2)

data_2 %>% 
  ggplot(aes(data)) +
  geom_histogram(aes(y = ..density..),
                 fill = "lightgreen", alpha = 0.5) +
  stat_function(fun = dnorm,
                args = list(mean = mean(data_2$data),
                            sd = sd(data_2$data)),
                col = "darkgreen", linewidth = 3) +
  theme_bw() +
  annotate("text", x = 6, y = 0.25,
           label = "Right-skewed Distribution",
           color = "red", size = 7)




set.seed(5)
#left skewness 
hist(rbeta(100000,100,1)*10)
#right skewness 
hist(rbeta(100000,1,100)*10)


xdata <- rbeta(100000,100,1)*10
xdata <- xdata * 10
data_3 <- data.frame(xdata)
View(data_3)

summary(data_3$xdata)

data_3 %>% 
  filter(xdata > 92) %>% 
  ggplot(aes(xdata)) +
  geom_histogram(binwidth = 0.5, aes(y = ..density..),
                 fill = "lightpink", alpha = 0.5) +
  stat_function(fun = dnorm,
                args = list(mean = mean(data_3$xdata),
                            sd = sd(data_3$xdata)),
                col = "brown", linewidth = 2) +
  theme_bw() +
  annotate("text", x = 94, y = 0.4,
           label = "Left-skewed Distribution",
           color = "blue", size = 7)




summary(msleep$awake)

msleep %>%
  ggplot(aes(awake)) + 
  geom_histogram(binwidth = 2, aes(y = ..density..)) +
  stat_function(fun = dnorm,
                args = list(mean = mean(msleep$awake),
                            sd = sd(msleep$awake)),
                col = "#1b98e0",
                size = 3) +
  theme_bw() +
  labs(title = "Distribution of Awake Time",
       x = "Awake Time (hour)", y = "") +
  theme(plot.title = element_text(hjust = 0.5))
  



library(forcats)
names(gss_cat)
unique(gss_cat$partyid)

ind <- gss_cat %>% 
  drop_na(age, partyid) %>% 
  filter(partyid == "Independent")

ind %>% 
  ggplot(aes(age)) + 
  geom_histogram(aes(y = ..density..)) +
  stat_function(fun = dnorm,
                args = list(mean = mean(ind$age),
                            sd = sd(ind$age)),
                col = "#1b98e0",
                size = 3) +
  theme_grey() +
  labs(title = "Age Distribution of Independent Party",
       x = "Age", y = "") +
  theme(plot.title = element_text(hjust = 0.5, size = 20,
                                  face = "bold", color = "steelblue")) +
  annotate("text", x = 75, y = 0.021,
           label = "Right skewed distribution",
           color = "red", size = 6)


