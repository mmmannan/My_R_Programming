# Managing time and date data in R
# Lubridate-How to manipulate date and time data in R

library(tidyverse)
library(lubridate)

# Creating date and time object
now()                          # output the date and time right now
today()

ymd("2024-08-03")
mdy("August 03, 2024")
dmy("03-Aug-2024")

a <- dmy("03/08/2024")
print(a)
class(a)


ymd_hms("2024-08-03 19:13:59")
mdy_hm("08/03/2024 19:15")


install.packages("nycflights13")
library(nycflights13)

?flights
View(flights)
str(flights)
dim(flights)
glimpse(flights)
names(flights)


flights %>% 
  select(origin, year, month, day, hour, minute) %>% 
  head(4)


flights %>% 
  mutate(ymd_hm(paste(year, month, day, hour, minute))) %>% 
  View()
  
flights %>% 
  mutate(flight_date = ymd_hm(paste(year, month, day, hour, minute))) %>% 
  select(origin, dest, flight_date) %>% 
  head(4)


# no need to use paste if you use make_datetime() or, make_date() function
flights %>% 
  mutate(flight_date = make_datetime(year, month, day, hour, minute)) %>% 
  select(origin, dest, flight_date) %>% 
  head(4)

flights %>% 
  mutate(flight_date = make_date(year, month, day)) %>% 
  select(origin, dest, flight_date) %>% 
  head(4)


# Extracting date-time data
flights %>% 
  mutate(flight_date = make_date(year, month, day)) %>% 
  mutate(week_day = wday(flight_date),                  # gives week day as a number
         month_name = month(flight_date)) %>%           # gives month name as a number
  select(origin, flight_date, week_day, month_name) %>% 
  head(4)

flights %>% 
  mutate(flight_date = make_date(year, month, day)) %>% 
  mutate(week_day = wday(flight_date, label = T),               # gives week day in word
         month_name = month(flight_date, label = T)) %>%        # gives month name in word
  select(origin, flight_date, week_day, month_name) %>% 
  head(4)


# Arrhythmic with date-time data

# The date and time in exactly 30 years from now
now() + years(30)
now() - years(10)

# filter for the month of September
flights %>% 
  filter(time_hour >= ymd("2013-09-01") &
           time_hour < ymd("2013-10-01")) %>% 
  select(origin, month) %>% 
  head(4)


# Time spans (duration, periods and intervals)

my_duration <- dseconds(15)
print(my_duration)

dminutes(1)
dminutes(4)
dminutes(15)
dhours(1)
dhours(5)
ddays(1)
dweeks(1)
dmonths(1)
dyears(1)
dyears(10)

# Using duration
ymd("2016-01-01") + dyears(1)


# Using period
ymd("2016-01-01") + years(1)        # Much better!

# You can also add periods
months(3) + days(1) + minutes(8)
# And even multiply or divide periods
months(3) * 2


# Intervals : have a defined start and end point
start <- ymd_hms("2023-01-01 12:00:00")
end <- ymd_hms("2023-01-15 12:00:00")
iv <- interval(start, end)
print(iv)

ymd_hms("2023-01-10 10:00:00") %within% iv
ymd_hms("2023-01-16 14:00:00") %within% iv

start2 <- ymd_hms("2023-01-01 12:00:00")
end2 <- ymd_hms("2023-01-11 12:00:00")
iv2 <- interval(start2, end2)
iv < iv2

start3 <- ymd_hms("2023-01-01 12:00:00")
end3 <- ymd_hms("2023-01-16 12:00:00")
iv3 <- interval(start3, end3)
iv < iv3


# Convert interval into duration or periods
as.duration(iv)
as.period(iv)


# Working with GGPLOT2

unique(flights$carrier)
length(unique(flights$carrier))

################################################################################
flights %>% 
  filter(carrier %in% c("9E", "US", "AA", "MQ")) %>% 
  mutate(week_day = wday(time_hour, label = T)) %>% 
  ggplot(aes(week_day)) +
  geom_bar(fill = "steelblue", alpha = 0.8) +
  facet_wrap(~carrier) +
  theme_bw() +
  labs(title = "Number of flights by carrier and weekday",
       x = "Week days", y = "") +
  theme(plot.title = element_text(hjust = 0.5))
################################################################################

flights %>% 
  mutate(week_day = wday(time_hour, label = T)) %>% 
  ggplot(aes(week_day)) +
  geom_bar(fill = "steelblue", alpha = 0.8) +
  facet_wrap(~carrier) +
  theme_bw() +
  labs(title = "Number of flights by carrier and weekday",
       x = "Week days", y = "") +
  theme(plot.title = element_text(hjust = 0.5))


flights %>% 
  filter(time_hour < ymd("2013-10-01"),
           carrier %in% c("9E", "US", "AA", "MQ")) %>% 
  ggplot(aes(time_hour, color = carrier)) + 
  geom_freqpoly()

################################################################################
flights %>% 
  filter(time_hour < ymd("2013-10-01"),
         carrier %in% c("9E", "US", "AA", "MQ")) %>% 
  ggplot(aes(time_hour, color = carrier)) + 
  geom_freqpoly(linewidth = 1.5) +
  theme_bw() +
  labs(title = "Number of flights by carrier",
       x = "", y = "") +
  theme(plot.title = element_text(hjust = 0.5))
################################################################################




