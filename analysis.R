# Libraries
library(tidyverse)
library(readr)
library(dplyr)


# Importing my Data
Amazon <- read_csv("C:/Users/hp/OneDrive/Desktop/Dataset/amazon_updated.csv")
head(Amazon)


# Data Cleaning and manipulation
# Checked for missing values and summary
summary(Amazon)
Amazon <- na.omit(Amazon)


# Convert columns to numeric
Amazon <- Amazon %>%
  mutate(
    sales = as.numeric(sales),
    discounted_price = as.numeric(discounted_price),
    actual_price = as.numeric(actual_price),
    discount_percentage = as.numeric
    (str_remove_all(discount_percentage, "%")),
    rating = as.numeric(rating)
  )


# Relevant columns needed for my analysis
Amazon <- Amazon %>%
  select(discounted_price,
         actual_price,
         discount_percentage,
         rating,
         rating_count,
         sales,
         review_title,
         category)



# Statistical Analysis: Summary Sales, Rating, and Rating Count
Amazon_summary <- Amazon %>%
  summarise(
    Avg_Sales = mean(sales, na.rm = TRUE),
    Median_Sales = median(sales, na.rm = TRUE),
    Total_Sales = sum(sales, na.rm = TRUE),
    Avg_Rating = mean(rating, na.rm = TRUE),
    Avg_Rating_Count = mean(rating_count, na.rm = TRUE)
  )
print(Amazon_summary)



# Counting the total number of reviews
Num_Reviews <- nrow(Amazon)
print(paste("Total Number of Reviews:", Num_Reviews))


#
Amazon <- Amazon %>%
  mutate(scaled_price = scale(actual_price),
         scaled_rating = scale(rating),
         scaled_reviews = scale(rating_count))




# Correlation Between Sales, Rating, and Rating Count
correlation <- cor(Amazon %>% select(sales, rating, rating_count),
                   use = "complete.obs")
print(correlation)



# Simple Linear Regression: Sales & Rating
simple_model <- lm(sales ~ rating, data = Amazon)
print("Coefficients of Simple Model:")
print(simple_model$coefficients)



# Multiple Linear Regression
multiple_model <- lm(sales ~ rating + rating_count + actual_price, data = Amazon)
print("Summary of Multiple Regression Model:")
summary(multiple_model)




# Extracting fitted values and coefficients for reporting
print("Fitted Values (First 5):")
print(head(multiple_model$fitted.values, 5))



# Distribution of sales across categories
sales_by_category <- Amazon %>%
  group_by(category) %>%
  summarise(
    Avg_Sales = mean(sales, na.rm = TRUE),
    Total_Sales = sum(sales, na.rm = TRUE)
  ) %>%
  arrange(desc(Avg_Sales))
print(sales_by_category)



# Filter for Two Categories "Computers&Accessories" and "Electronics"
Amazon_filtered <- Amazon %>%
  filter(category %in% c("Computers&Accessories", "Electronics"))



# Perform a T-Test & Chi test
t_test_result <- t.test(sales ~ category, data = Amazon_filtered)
print(t_test_result)



#Visualizations (Scatterplot, Bar chart, Boxplot and Bar plot)
# Scatterplot: Ratings vs. Sales
Amazon %>%
  ggplot(aes(x = rating, y = sales)) +
  geom_point(color = "black") +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Scatterplot: Rating vs. Sales", x = "Rating", y = "Sales")



# Bar chart: Average sales per category
Amazon %>%
  group_by(category) %>%
  summarise(Avg_Sales = mean(sales, na.rm = TRUE)) %>%
  ggplot(aes(x = reorder(category, -Avg_Sales), y = Avg_Sales, fill = category)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Average Sales by Category",
       x = "Category",
       y = "Average Sales")




# Boxplot (Sales distribution across categories)
Amazon %>%
  mutate(category = as.factor(category)) %>%
  ggplot(aes(x = category, y = sales, fill = category)) +
  geom_boxplot() +
  labs(title = "Sales Distribution by Category",
       x = "Category",
       y = "Sales") +
  theme_minimal()




# Bar plot
ggplot(Amazon_filtered, aes(x = reorder(category, -table(category)[category]),
  fill = category)) +
  geom_bar() +
  labs(title = "Distribution of Reviews by Category",
       x = "Rating by category",
       y = "Number of Reviews") +
  theme_minimal()


