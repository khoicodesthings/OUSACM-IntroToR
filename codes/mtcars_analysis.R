
# Load the dataset
data(mtcars)

# View the structure of the dataset
str(mtcars)

# Summary statistics of the dataset
summary(mtcars)

# Check the first few rows
head(mtcars)

# Mean, median, and standard deviation of mpg
mean(mtcars$mpg)
median(mtcars$mpg)
sd(mtcars$mpg)

# Correlation matrix
cor(mtcars)

# Scatterplot between mpg and hp (horsepower)
plot(mtcars$mpg, mtcars$hp, 
     xlab = "Miles per Gallon (mpg)", 
     ylab = "Horsepower (hp)",
     main = "MPG vs Horsepower",
     pch = 19, col = "blue")

# Boxplot for mpg across different number of cylinders
boxplot(mpg ~ cyl, data = mtcars, 
        xlab = "Number of Cylinders", 
        ylab = "Miles per Gallon",
        main = "MPG by Cylinders")

# Simple linear regression: predicting mpg based on hp
model <- lm(mpg ~ hp, data = mtcars)
summary(model)

# Multiple linear regression: predicting mpg based on multiple variables
multi_model <- lm(mpg ~ hp + wt + qsec, data = mtcars)
summary(multi_model)

# Filter cars with more than 6 cylinders
subset_mtcars <- subset(mtcars, cyl > 6)

# Display the result
subset_mtcars

# Group by number of cylinders and calculate mean mpg for each group
library(dplyr)

mtcars %>%
  group_by(cyl) %>%
  summarise(mean_mpg = mean(mpg))

# Scatterplot with regression line using ggplot2
library(ggplot2)

ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "MPG vs Horsepower", x = "Horsepower", y = "Miles per Gallon")