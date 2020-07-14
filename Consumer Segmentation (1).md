# Consumer Segmentation Using R

# Background Information

A Kenyan entrepreneur has created an online cryptography course and would want
to advertise it on her blog. She currently targets audiences originating from 
various countries. In the past, she ran ads to advertise a related course on the
same blog and collected data in the process. She would now like to employ your 
services as a Data Science Consultant to help her identify which individuals are
most likely to click on her ads. 

## Business Underdstanding
### Business Objective

The main goal is to gather insifghts from the data on who is more likely to click on the new online course advertisment.

### Business Success Criteria

Our data mining success will be measured on narrowing to the characteristics of individuals who are more likely to click on the course advertisment.

## Data Understanding

The data used for this data mining project was sourced from;[http://bit.ly/IPAdvertisingData]

The dataset contains 10 rows with 1000 records.

Our assumption is the data collected is accurate and is a true reflection of the population.

## Data Preparation

We will load data to R enviroment ready for analysis. The below steps would bve followed;
1. Identification of outliers
2. Identification of duplicates
3. Identification of Null values

If found all will be dealt with accordingly.


## 1. Defining the Question

### a. Specifying the Question

A Kenyan entrepreneur has created an online cryptography course and would want
to advertise it on her blog. She currently targets audiences originating from 
various countries. In the past, she ran ads to advertise a related course on the
same blog and collected data in the process. She would now like to employ your 
services as a Data Science Consultant to help her identify which individuals are
most likely to click on her ads. 

### b. Defining the metric of success

Successfully perform consumer segmentation

### c. Understanding the Context

As a data Scientist we have been tasked to understand the type of individuals
who are more likely to subscribe to our clients services based on data shared.

### d. Recording the Experimental Design

1. Univariate Analysis
2. Bivariate analysis

### e. Data Relevance

The data provided is relevant to answering the research question.

## 2. Reading the Data
```{r}
library(readr)

advertising <- read_csv("C:/Users/color/Downloads/advertising.csv")
```
## 3. Checking the Data
```{r}
head(advertising)

tail(advertising)
```
## 4. Tidying the Dataset
```{r}
summary(advertising)

names(advertising)

colSums(is.na(advertising))

is.double(advertising)

colSums(is.double(advertising))

# Our dataset had neither null nor duplicate values hence no action taken.
```



## 5. Exploratory Data Analysis

### a. Univariate Analysis
```{r}
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
```
#### From our histogram it was noted there was no significant outliers and therfore all the data was retained to maintain the integrity of the data.

### b. Bivariate Analysis

#Checking Correlation Between our Variables

#Import Correlation Library
```{r}
install.packages("corrplot")

numeric_df = advertising[, sapply(advertising, is.numeric)]

head(numeric_df)
```
# Computing correlation matrix
```{r}
corr_matrix <- cor(numeric_df)

head(round(corr_matrix,2))
```
# Visualizing the correlation matrix
```{r}
library(corrplot)
corrplot(corr_matrix, method="circle")

names(advertising)
```
# Relationship between Age Vs Clicked on Ad
```{r}
counts = table(advertising$Age, advertising$`Clicked on Ad`)
barplot(counts, main = "Clicks with respect to Age", xlab = "Clicks on Ads", col = c("black", "red"), legend = rownames(counts), beside = TRUE)
```
# Relationship between Sex Vs Clicked on Ad
```{r}
counts = table(advertising$Male, advertising$`Clicked on Ad`)
barplot(counts, main = "Clicks with respect to Sex", xlab = "Clicks on Ads", col = c("blue", "green"), legend = rownames(counts), beside = TRUE)
```

## Conclusion

From our analysis we were able to not that our data was clean and had no duplicates. It is therefore safe to conclude that indviduals aged between 30-40 years of age are more likely to click on ads majority being females.

## Recommendation

For the next course advertisment it would be great to focus on individuals aged 20-30 more to increase there u