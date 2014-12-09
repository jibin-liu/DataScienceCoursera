# Jibin Liu
# Data Science - R programming in Nov. 2014
# Questions 11 - 20 with Air Quality datasets

# what are the column names of the dataset?
airQuality <- read.csv("hw1_data.csv")
names(airQuality)

# Extract the first 2 rows of the data frame and print them to the console. What does the output look like?
airQuality[c(1, 2), ]

# How many observations (i.e. rows) are in this data frame?
nrow(airQuality)

# Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
tail(airQuality)

# What is the value of Ozone in the 47th row?
airQuality[47, ]

# How many missing values are in the Ozone column of this data frame?
ozoneBad <- is.na(airQuality$Ozone)
length(ozoneBad[ozoneBad == TRUE])

# What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
mean(airQuality[!ozoneBad, ]$Ozone)
  # Or can also use
  # mean(airQuality$Ozone, na.rm = TRUE)

# Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
mean(airQuality[(airQuality$Ozone > 31) & (airQuality$Temp > 90), ]$Solar.R, na.rm = TRUE)

# What is the mean of "Temp" when "Month" is equal to 6?
mean(airQuality[airQuality$Month == 6, ]$Temp)

# What was the maximum ozone value in the month of May (i.e. Month = 5)?
max(airQuality[airQuality$Month == 5, ]$Ozone, na.rm = TRUE)
