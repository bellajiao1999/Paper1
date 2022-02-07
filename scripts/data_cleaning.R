---
title: "data_cleaning"
output:
  pdf_document: default
  html_document: default
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

data cleaning
```{r cars}

library(httr)
library(readr)
raw_data <- read.csv("Death Registry Statistics Data.csv")

#Removing all the deaths that are outside city limits
data<-subset(raw_data, PLACE_OF_DEATH == "Toronto")
#Remove unwanted column
data1 <- data[ , ! names(data) %in% c("PLACE_OF_DEATH")]
#Remove the months and extract the Year from the column "Time_Period"
data1$Year <- substr(data1$TIME_PERIOD, 1, 4)

clean_data <- data1[ , ! names(data1) %in% c("TIME_PERIOD")]
print(clean_data)
```
