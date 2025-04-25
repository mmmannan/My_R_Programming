?diamonds
View(diamonds)
glimpse(diamonds)
names(diamonds)
unique(diamonds$color)

library(tidyverse)
library(plotly)
install.packages("IRdisplay")
library(IRdisplay)

colors <- c("#FFFFFF", "#F5FCC2", "#E0ED87", "#CCDE57",
            "#B3C732", "#94A813", "#718200")

# color is a variable in diamond data set
# colors is a vector consist of colors

# Find the counts of each color diamond
diamonds %>% 
  group_by(color) %>% 
  summarise(counts = n()) %>% 
  View()

data <- diamonds %>% 
  group_by(color) %>% 
  summarise(counts = n(), percentage = n()/nrow(diamonds))

diamonds %>% 
  group_by(color) %>% 
  summarise(counts = n(), percentage = (n()/nrow(diamonds)) * 100) %>% 
  View()

data

pie <- plot_ly(data = data, labels = ~color, values = ~percentage,
               type = "pie", sort = FALSE,
               marker = list(colors = colors,
                             line = list(color = "black", width = 1))) %>% 
  layout(title = "Pie chart of Diamond Color (with Plotly)")

pie   # interactive pie chart



print(paste(data$percentage * 100, "%"))
print(paste0(data$percentage * 100, "%"))

print(paste0(round(data$percentage * 100, 2), "%"))
print(paste0(round(data$percentage * 100), "%"))


library(ggplot2)
pie_2 <- ggplot(data = data, aes(x = "", y = percentage, fill = color)) +
  geom_col(color = "black") +
  coord_polar("y", start = 0) +
  geom_text(aes(label = paste0(round(percentage * 100), "%")),
            position = position_stack(vjust = 0.5)) +
  labs(fill = "Diamond Color") +
  theme(panel.background = element_blank(),
        axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 18)) +
  ggtitle("Pie chart of Diamond Color (ggplot2)") +
  scale_fill_manual(values = colors)

pie_2



names(msleep)
unique(msleep$vore)

mammals <- msleep %>% 
  drop_na(vore) %>% 
  group_by(vore) %>% 
  summarise(counts = n())

total_mammals = sum(mammals[c(1:4), 2])

msleep_vore <- msleep %>% 
  drop_na(vore) %>% 
  group_by(vore) %>% 
  summarise(counts = n(), percentage = n()/total_mammals)



pie_3 <- ggplot(data = msleep_vore, aes(x = "", y = percentage, fill = vore)) +
  geom_col(color = "black") +
  coord_polar("y", start = 0) +
  geom_text(aes(label = paste0(round(percentage * 100, 2), "%")),
            position = position_stack(vjust = 0.5)) +
  labs(fill = "Vore") +
  theme(panel.background = element_blank(),
        axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 18)) +
  ggtitle("Pie chart of Vores") +
  scale_fill_brewer(palette = "Set2")

pie_3


library(RColorBrewer)

pie_2 <- ggplot(data = data, aes(x = "", y = percentage, fill = color)) +
  geom_col(color = "black") +
  coord_polar("y", start = 0) +
  geom_text(aes(label = paste0(round(percentage * 100), "%")),
            position = position_stack(vjust = 0.5)) +
  labs(fill = "Diamond Color") +
  theme(panel.background = element_blank(),
        axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 18)) +
  ggtitle("Pie chart of Diamond Color") +
  scale_fill_brewer(palette = "Paired")

pie_2



unique(starwars$eye_color)

stars_eye <- starwars %>% 
  drop_na(eye_color) %>% 
  filter(eye_color %in% c("blue", "yellow", "red","brown",
                          "black", "orange"))

eye <- stars_eye %>% 
  group_by(eye_color) %>% 
  summarise(counts = n(), percentage = n()/length(stars_eye$eye_color))


pie_4 <- ggplot(data = eye, aes(x = "", y = percentage, fill = eye_color)) +
  geom_col(color = "black") +
  coord_polar("y", start = 0) +
  geom_text(aes(label = paste0(round(percentage * 100, 2), "%")),
            position = position_stack(vjust = 0.5),
            color = "grey") +
  labs(fill = "Eye Color") +
  theme(panel.background = element_blank(),
        axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 18)) +
  ggtitle("Pie chart of Eye Color") +
  scale_fill_manual(values = c("blue" = "blue", "red" = "red",
                                "brown" = "brown", "black" = "black",
                                "orange" = "orange", "yellow" = "yellow"))

pie_4



