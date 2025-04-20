library(readxl)
Friends <- read_excel("Friends_2.xlsx")
View(Friends)

str(Friends)

Friends$height = as.factor(Friends$Height)

library(ggplot2)
ggplot(Friends, aes(x= Friends$height, fill= Friends$height)) +
  labs(x= "Height Catagory", y= "Count", fill= "Heights",
       title= "Numbers of People with Different Heights") +
  geom_bar() +
  theme(plot.title= element_text(hjust= 0.5))

