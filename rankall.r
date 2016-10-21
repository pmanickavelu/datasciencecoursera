source("rankhospital.r")
rankall <- function(outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    outcome_states <- levels(factor(outcome_data$State))
    for (outcome_state in outcome_states) {
        rankhospital(outcome_state, outcome, num)
    }
}