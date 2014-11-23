## Programmed by Jibin Liu
## R programming - Coursera
## Week 4 - programming assignment 3

## This function finds the best hospital in a state.
## state - the 2-character abbreviated name of a state.
## outcome - an outcome name ("heart attack", "heart failure", or "pneumonia").

best <- function(state, outcome) {
    ## Read outcome data
    df <- read.csv("outcome-of-care-measures.csv",
                            colClasses = "character")
    stateList <- df$State
    outcomeList <- c("heart attack", "heart failure", "pneumonia")
    
    ## Check that state and outcome are valid
    if (!(state %in% stateList)) {
        stop("invalid state")
    } else if (!(outcome %in% outcomeList)) {
        stop("invalid outcome")
    }
    
    if (outcome == "heart attack") {
        column <- 11
    } else if (outcome == "heart failure") {
        column <- 17
    } else if (outcome == "pneumonia") {
        column <- 23
    }
    
    ## Clean data
    hospital <- split(df, df$State)[[state]]
    hospital[, column] <- as.numeric(hospital[, column])
    hospital <- hospital[!is.na(hospital[, column]), ]
    
    ## Sort data
    hospital <- hospital[order(hospital[, column], hospital$Hospital.Name), ]
    
    ## Return hospital name in that state with lowest 30-day death rate
    hospital[1, ]$Hospital.Name
}



## This function finds the name of the hospital that has the specific ranking.
## state - the 2-character abbreviated name of a state.
## outcome - an outcome name ("heart attack", "heart failure", or "pneumonia").
## num - the ranking of a hospital in that state for that outcome, can be numeric
##       number or "best"/"worst".

rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    df <- read.csv("outcome-of-care-measures.csv",
                   colClasses = "character")
    stateList <- df$State
    outcomeList <- c("heart attack", "heart failure", "pneumonia")
    
    ## Check that state and outcome are valid
    if (!(state %in% stateList)) {
        stop("invalid state")
    } else if (!(outcome %in% outcomeList)) {
        stop("invalid outcome")
    }
    
    if (outcome == "heart attack") {
        column <- 11
    } else if (outcome == "heart failure") {
        column <- 17
    } else if (outcome == "pneumonia") {
        column <- 23
    }
    
    ## clean data
    hospital <- split(df, df$State)[[state]]
    hospital[, column] <- as.numeric(hospital[, column])
    hospital <- hospital[!is.na(hospital[, column]), ]
    
    ## sort data
    hospital <- hospital[order(hospital[, column], hospital$Hospital.Name), ]
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    if (num == "best") {
        hospital[1, ]$Hospital.Name
    } else if (num == "worst") {
        hospital[nrow(hospital), ]$Hospital.Name
    } else {
        hospital[num, ]$Hospital.Name
    }
}


## This function finds the hospital in each state that has the specific ranking.
## outcome - an outcome name ("heart attack", "heart failure", or "pneumonia").
## num - the ranking of a hospital in that state for that outcome, can be numeric
##       number or "best"/"worst".

rankall <- function(outcome, num = "best") {
    ## Read outcome data
    df <- read.csv("outcome-of-care-measures.csv",
                   colClasses = "character")
    outcomeList <- c("heart attack", "heart failure", "pneumonia")
    rankList <- data.frame()
    
    ## Check that outcome is valid
    if (!(outcome %in% outcomeList)) {
        stop("invalid outcome!")
    }
    
    if (outcome == "heart attack") {
        column <- 11
    } else if (outcome == "heart failure") {
        column <- 17
    } else if (outcome == "pneumonia") {
        column <- 23
    }
    
    ## clean data
    df[, column] <- as.numeric(df[, column])
    df <- df[!is.na(df[, column]), ]
    
    ## For each state, find the hospital of the given rank
    list <- split(df, df$State)
    for (state in list) {
        rank <- state[order(state[, column], state$Hospital.Name), ]
        if (num == "best") {
            rankList <- rbind(rankList, rank[1, ])
        } else if (num == "worst") {
            rankList <- rbind(rankList, rank[nrow(rank), ])
        } else {
            rankList <- rbind(rankList, rank[num, ])
        }
    }
    
    
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    rankList <- rankList[, c("Hospital.Name", "State")]
    names(rankList) <- c("hospital", "state")
    rankList
    
}
