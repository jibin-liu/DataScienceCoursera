# Programmed by Jibin Liu
# R prgramming - Cousera

pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    # set working directory and empty data frame
    #setwd(paste(directory, "/", sep = ""))
    allData <- data.frame()
    
    # read data
    for (monitor in id) {
        fileName <- sprintf("%03d.csv", monitor)
        singleData <- read.csv(fileName)
        allData <- rbind(allData, singleData)
    }
    
    # calculate mean value
    round(mean(allData[[pollutant[1]]], na.rm = TRUE), 3)

}


complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    # set working directory and empty data frame
    # setwd(directory)
    allData <- data.frame()
    
    # read data and check complete cases
    for (monitor in id) {
        fileName <- sprintf("%03d.csv", monitor)
        good <- sum(complete.cases(read.csv(fileName)))
        allData <- rbind(allData, c(monitor, good))
    }
    
    #print data
    names(allData) <- c("id", "nobs")
    allData
    
}


corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    # set working directory and empty numeric vector
    #setwd(directory)
    allData <- numeric()
    id = 1:332
    
    # read data
    for (monitor in id) {
        fileName <- sprintf("%03d.csv", monitor)
        singleData <- read.csv(fileName)
        good <- complete.cases(singleData)
        #check threshold
        if (sum(good) > threshold) {
            #calculate coorelationship
            singleData <- singleData[good, ]
            singleCorr <- cor(singleData$nitrate, singleData$sulfate)
            allData <- c(allData, singleCorr)
        }
    }

    allData
    
}
