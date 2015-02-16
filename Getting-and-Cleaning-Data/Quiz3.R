# Question 1
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./microdata.csv")
survey <- read.csv("microdata.csv")
agriculturalLogical <- survey$ACR == 3 & survey$AGS == 6
head(survey[which(agriculturalLogical), ], n = 3)

# Question 2
library(jpeg)
picUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(picUrl, destfile = "./jeff.jpg", mode = "wb") # define binary mode under windows for pic download
pic <- readJPEG("jeff.jpg", native = TRUE)
quantile(pic, probs = c(0.3, 0.8))

# Question 3
library(plyr)
# Download data
GDPUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
EDUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(GDPUrl, destfile = "./GDP.csv")
download.file(EDUrl, destfile = "./ED.csv")
# Read and Clean Data
GDP <- read.csv("GDP.csv")
GDP <- GDP[, c(1, 2, 4, 5)]
GDP <- rename(GDP, c("X" = "CountryCode", 
                       "Gross.domestic.product.2012" = "GDPRanking", 
                       "X.2" = "longName", 
                       "X.3" = "GDP"))
GDP$GDPRanking <- as.character(GDP$GDPRanking)
rank <- as.character(c(1:200))
GDP <- GDP[GDP$GDPRanking %in% rank, ]
GDP$GDPRanking <- as.numeric(GDP$GDPRanking)
ED <- read.csv("ED.csv") # Read ED Data
#Merge data and conduct analysis
mergeData <- merge(GDP, ED, by.x = "CountryCode", by.y = "CountryCode")
mergeData <- mergeData[order(mergeData$GDPRanking, decreasing = TRUE), ]
mergeData[13, ]$Long.Name

# Question 4
tapply(mergeData$GDPRanking, mergeData$Income.Group, mean)

# Question 5
mergeData$GDPGroup <- cut(mergeData$GDPRanking, 5)
table(mergeData$GDPGroup, mergeData$Income.Group)
