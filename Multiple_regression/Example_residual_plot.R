# Example code

library(ggplot2)

# Sample data (replace with your actual data)
data <- data.frame(
  x = 1:10,
  y = c(2, 5, 4, 7, 6, 8, 9, 11, 10, 13)
)

# Fit the linear model
model <- lm(y ~ x, data = data)

# Create the plot
ggplot(data, aes(x = x, y = y)) +
  geom_point(color = "steelblue", size = 3) +  # Customize point appearance
  geom_smooth(method = "lm", se = FALSE, color = "red") +  # Add regression line
  geom_segment(aes(xend = x, yend = predict(model)), color = "black", linetype = 2) +  # Add residuals
  labs(title = "Scatterplot with Regression Line",
     x = "Independent Variable", y = "Dependent Variable") +
  theme_minimal() +  # Choose a suitable theme
  theme(plot.title = element_text(hjust = 0.5)) +
  annotate("text", x = 5, y = 12, label = paste("R-squared =", round(summary(model)$r.squared, 2)))  # Add R-squared




# Try with mtcars data set
View(mtcars)
# Load necessary libraries
library(ggplot2)

# Create data frame with x and y values
data <- data.frame(
  x = mtcars$wt,  # Replace with actual x-values
  y = mtcars$mpg   # Replace with actual y-values
)
View(data)

# Calculate regression line coefficients (if not provided)
model <- lm(y ~ x, data = data)
summary(model)

# Create plot
ggplot(data, aes(x = x, y = y)) +
  geom_point() +  # Add data points
  geom_smooth(method = lm, se = F) +
  geom_segment(aes(xend = x, yend = predict(model)), color = "red") +  # Add residuals
  labs(x = "weight of cars", y = "mpg", title = "mpg vs weight of cars") +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5)) +
  annotate("text", x = 3.5, y = 30, label = paste("R-squared =", round(summary(model)$r.squared, 2)))  # Add R-squared














