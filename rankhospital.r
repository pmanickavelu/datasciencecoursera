rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    outcome_keys <- c("heart attack" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "heart failure" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "pneumonia" = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
    if(!outcome %in% names(outcome_keys)){
        cat("Error in best(\"", state, "\", \"", outcome , "\") : invalid outcome")
    }
    state.hospital <- outcome_data[outcome_data$State == state,]
    state.hospital[[outcome_keys[outcome]]] <- as.numeric(state.hospital[[outcome_keys[outcome]]])

    if(nrow(state.hospital) == 0){
        cat("Error in best(\"", state, "\", \"", outcome , "\") : invalid state")
    }
    
    
   ranked.hospitals <- state.hospital[order(state.hospital[[outcome_keys[outcome]]], state.hospital$Hospital.Name,na.last = TRUE),]$Hospital.Name
   if(is.numeric(num)){
       return(ranked.hospitals[num])
   }else if(num == "best"){
       return(ranked.hospitals[1])
   }else if(num == "worst"){
       return(ranked.hospitals[length(ranked.hospitals)])
   }
}


rankhospital("TX", "heart failure", "best")
rankhospital("TX", "heart failure", "worst")
rankhospital("TX", "heart failure", 4)
rankhospital("TX", "heart failure", 1000)
rankhospital("TX", "heart failure", 100)
# best("TX", "heart failure")
# best("MD", "heart attack")
# best("MD", "pneumonia")
# best("BB", "heart attack")
# best("NY", "hert attack")

