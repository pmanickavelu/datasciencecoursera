best <- function(state, outcome) {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    outcome_keys <- c("heart attack" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "heart failure" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "pneumonia" = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
    if(!outcome %in% names(outcome_keys)){
        cat("Error in best(\"", state, "\", \"", outcome , "\") : invalid outcome")
    }
    state.hospital <- outcome_data[outcome_data$State == state,]
    state.hospital[[outcome_keys[outcome]]] <- as.numeric(state.hospital[[outcome_keys[outcome]]])
    state.hospital <- state.hospital[!is.na(state.hospital[[outcome_keys[outcome]]]), ]
    print(state.hospital[[outcome_keys[outcome]]])
    
    if(nrow(state.hospital) == 0){
        cat("Error in best(\"", state, "\", \"", outcome , "\") : invalid state")
    }
    
    
    state.hospital[which.min(state.hospital[[outcome_keys[outcome]]]),]$Hospital.Name
}


best("TX", "heart attack")
# best("TX", "heart failure")
# best("MD", "heart attack")
# best("MD", "pneumonia")
# best("BB", "heart attack")
# best("NY", "hert attack")

