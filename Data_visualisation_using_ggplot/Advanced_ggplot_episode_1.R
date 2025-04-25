install.packages("car")
library(car)
library(tidyverse)

# Set ggplot themes
theme_set(theme_bw())

head(Salaries)
View(Salaries)
str(Salaries)
dim(Salaries)
glimpse(Salaries)
names(Salaries)


Salaries %>% 
  ggplot(aes(yrs.since.phd, salary, color = rank)) +
  geom_point()

Salaries %>% 
  ggplot(aes(x = yrs.since.phd,
             y = salary,
             color = rank)) +
  geom_point()

Salaries %>% 
  ggplot(aes(yrs.since.phd, salary, color = rank, shape = discipline)) +
  geom_point()

################################################################################
Salaries %>% 
  ggplot(aes(yrs.since.phd, salary)) +
  geom_jitter(aes(color = rank, shape = discipline)) + 
  geom_smooth(method = lm) +
  facet_wrap(~sex) +
  labs(title = "Salary vs Years since PhD",
       x = "Years since PhD", y = "Income",
       color = "Position", shape = "Research Area") +
  theme(plot.title = element_text(hjust = 0.5))
################################################################################

Salaries %>% 
  ggplot(aes(yrs.since.phd, salary, color = rank)) +
  geom_jitter(aes(shape = discipline)) + 
  geom_smooth(method = lm) +
  labs(title = "Salary vs Years since PhD",
       x = "Years since PhD", y = "Income",
       color = "Position", shape = "Research Area")

Salaries %>% 
  ggplot(aes(yrs.since.phd, salary, color = rank)) +
  geom_jitter(aes(shape = discipline)) + 
  geom_smooth(method = lm) +
  facet_wrap(~sex) +
  labs(title = "Salary vs Years since PhD",
       x = "Years since PhD", y = "Income",
       color = "Position", shape = "Research Area")



# How to change tic marks and tic mark label

Salaries %>% 
  ggplot(aes(rank, salary)) +
  geom_boxplot()

Salaries %>% 
  ggplot(aes(rank, salary, color = sex)) +
  geom_boxplot()

Salaries %>% 
  ggplot(aes(rank, salary, fill = sex)) +
  geom_boxplot()

Salaries %>% 
  ggplot(aes(rank, salary, fill = sex)) +
  geom_boxplot(alpha = 0.5)

Salaries %>% 
  ggplot(aes(rank, salary, fill = sex)) +
  geom_boxplot(alpha = 0.5) +
  labs(title = "Faculty Salary by Rank and Gender",
       x = "", y = "", fill = "Gender") +
  theme(plot.title = element_text(hjust = 0.5))


# Change of tics and tic labels
Salaries %>% 
  filter(salary < 150000) %>% 
  ggplot(aes(x = rank, y = salary, fill = sex)) +
  geom_boxplot(alpha = 0.5) +
  scale_x_discrete(breaks = c("AsstProf", "AssocProf", "Prof"),
                   labels = c("Assistant\nProfessor", "Associate\nProfessor",
                              "Full\nProfessor")) +
  scale_y_continuous(breaks = c(50000, 100000, 150000, 200000),
                     labels = c("$50K", "$100K", "$150K", "$200K")) +
  labs(title = "Faculty Salary by Rank and Gender",
       x = "", y = "", fill = "Gender") +
  theme(plot.title = element_text(hjust = 0.5))


# Move the legend
Salaries %>% 
  filter(salary < 150000) %>% 
  ggplot(aes(x = rank, y = salary, fill = sex)) +
  geom_boxplot(alpha = 0.5) +
  scale_x_discrete(breaks = c("AsstProf", "AssocProf", "Prof"),
                   labels = c("Assistant\nProfessor", "Associate\nProfessor",
                              "Full\nProfessor")) +
  scale_y_continuous(breaks = c(50000, 100000, 150000, 200000),
                     labels = c("$50K", "$100K", "$150K", "$200K")) +
  labs(title = "Faculty Salary by Rank and Gender",
       x = "", y = "", fill = "Gender") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(legend.position = c(.11, .78))    # Move 11% along x-axis & 78% along y-axis   














