# Consumer Segmentation Using R

## 1. Defining the Question

### a. Specifying the Question

#A Kenyan entrepreneur has created an online cryptography course and would want
#to advertise it on her blog. She currently targets audiences originating from 
#various countries. In the past, she ran ads to advertise a related course on the
#same blog and collected data in the process. She would now like to employ your 
#services as a Data Science Consultant to help her identify which individuals are
#most likely to click on her ads. 

### b. Defining the metric of success

#Successfully perform consumer segmentation

### c. Understanding the Context

#As a data Scientist we have been tasked to understand the type of individuals
#who are more likely to subscribe to our clients services based on data shared.

### d. Recording the Experimental Design

#1. Univariate Analysis
#2. Bivariate analysis

### e. Data Relevance

#The data provided is relevant to answering the research question.

## 2. Reading the Data

library(readr)

advertising <- read_csv("C:/Users/color/Downloads/advertising.csv")

## 3. Checking the Data

head(advertising)

tail(advertising)

## 4. Tidying the Dataset

summary(advertising)

names(advertising)

colSums(is.na(advertising))

is.double(advertising)

colSums(is.double(advertising))


## 5. Exploratory Data Analysis

### a. Univariate Analysis

names(advertising)

histogram.Age = hist(x=advertising$Age,
     main="Histogram on Age",
     col = "green",
     xlab = "overall Age")

histogram.Income = hist(x=advertising$`Area Income`,
                     main="Histogram on Area Income",
                     col = "green",
                     xlab = "overall Area Income")

histogram.Time = hist(x=advertising$`Daily Time Spent on Site`,
                     main="Histogram on Time Spent",
                     col = "green",
                     xlab = "overall Time Spent")

histogram.Internet_Usage  = hist(x=advertising$`Daily Internet Usage`,
                     main="Histogram on Daily Internet Usage",
                     col = "green",
                     xlab = "Daily Internet Usage")


### b. Bivariate Analysis

#Checking Correlation Between our Variables

#Import COrrelation Library

install.packages("corrplot")

numeric_df = advertising[, sapply(advertising, is.numeric)]

head(numeric_df)

corr_matrix <- cor(numeric_df)

head(round(corr_matrix,2))

library(corrplot)
corrplot(corr_matrix, method="circle")

names(advertising)

# Relationship between Age Vs Clicked on Ad

counts = table(advertising$Age, advertising$`Clicked on Ad`)
barplot(counts, main = "Clicks with respect to Age", xlab = "Clicks on Ads", col = c("black", "red"), legend = rownames(counts), beside = TRUE)
