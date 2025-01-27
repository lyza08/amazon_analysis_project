**Analysis of Ratings and Reviews Impact on Amazon Sales Across Categories**

This project explores the relationship between ratings, reviews, and sales on Amazon using a dataset sourced from Kaggle. 
The analysis aims to uncover actionable insights for sellers and researchers by applying statistical analysis and data visualization techniques.

**Project Overview**
Ratings and reviews play a significant role in e-commerce. This project investigates:

The influence of product ratings on sales.
The relationship between the number of reviews and sales.
The role of pricing in driving sales compared to ratings and reviews.
Ratings and reviews influence category-specific trends in sales.
The study employs various statistical models to derive meaningful conclusions, including correlation analysis, simple and multiple linear regression, and hypothesis testing.

**Dataset**

Source: Amazon Sales Dataset - Kaggle

The dataset includes information about product prices, discounts, ratings, reviews, and categories. 
A sales column was estimated by multiplying the actual price by its rating and dividing it by 5, providing a proxy for sales performance.

**Methodology**

Data Cleaning and Preparation:
Handled missing values.
Converted relevant columns to numeric types.
Selected key variables for analysis: discounted_price, actual_price, discount_percentage, rating, rating_count, sales, review_title, and category.
Scaled numeric variables for normalization.
Statistical Methods:
Descriptive Statistics: Summarized sales, ratings, and review counts.
Correlation Analysis: Measured relationships between sales, ratings, and review counts.
Regression Analysis:
Simple Linear Regression: Sales vs. Rating.
Multiple Linear Regression: Sales vs. Rating, Review Count, and Actual Price.
Hypothesis Testing: Welch’s t-test was conducted to compare sales across categories.
Visualization: Scatterplots, bar charts, and boxplots were used to represent trends and distributions.

**Key Findings**

Correlation Analysis:

Weak positive correlation between ratings and sales (ρ = 0.1287).
Negligible correlation between review count and sales (ρ = -0.0347).
Regression Analysis:

Simple Linear Model: Each unit increase in rating corresponds to an average increase of $3846.12 in sales.
Multiple Linear Model: Pricing is the dominant predictor of sales, followed by ratings. Review count has minimal impact.

**Category Insights:**

The electronics category showed the highest average and total sales.
Significant variability in sales across categories, with Electronics demonstrating the most outliers.
Visualization Highlights:

Scatterplot: Weak positive trend between ratings and sales.
Bar Chart: Electronics dominate average sales.
Boxplot: Variability in sales performance across categories.
Visualizations
Key visualizations include:

Scatterplot of Ratings vs. Sales with trendlines.
Bar chart of Average Sales by Category.
Boxplot of Sales Distribution by Category.

**Conclusion**

Pricing is the most critical driver of sales, followed by ratings.
Quality feedback (high ratings) is more impactful than the number of reviews.
Sales dynamics vary significantly across categories, emphasizing the importance of category-specific strategies.
Requirements
R (v4.0+)

Libraries: tidyverse, readr, dplyr, ggplot2
