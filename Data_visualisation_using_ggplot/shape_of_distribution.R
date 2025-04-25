# Tried 
install.packages("fGarch")
library(fGarch)
library(tidyverse)
N <- 10000
x <- rnbinom(N, 10, .5)

r <- rsnorm(x, mean = 0, sd = 1, xi = 1.5) 

data_x <- data.frame(x)
data_x %>% 
  ggplot(aes(x)) +
  geom_histogram()
## Normal
ggplot(data_x, aes(x)) +
  geom_histogram(aes(y = ..density..)) +
  stat_function(fun = dnorm,
                args = list(mean = mean(data_x$x),
                            sd = sd(data_x$x)),
                col = "#1b98e0",
                size = 3)



data_r<- data.frame(r)
data_r %>% 
  ggplot(aes(r)) +
  geom_histogram()
### Normal
ggplot(data_r, aes(r)) +
  geom_histogram(aes(y = ..density..)) +
  stat_function(fun = dnorm,
                args = list(mean = mean(data_r$r),
                            sd = sd(data_r$r)),
                col = "#1b98e0",
                size = 3) +
  theme_bw()

ggplot(data_r, aes(r)) +
  geom_histogram(aes(y = ..density..),
                 fill = "#fb878e", alpha = 0.5) +
  stat_function(fun = dnorm,
                args = list(mean = mean(data_r$r),
                            sd = sd(data_r$r)),
                col = "#ff0312",
                size = 3) +
  theme_bw() +
  annotate("text", x = 3, y = 0.3,
           label = "Normal Distribution",
           size = 6)




