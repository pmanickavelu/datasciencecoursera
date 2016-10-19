build_file_name <- function(file_number){
    file_name <- paste(as.character(file_number), ".csv", sep = "")
    while (nchar(file_name) < 7) {
        file_name <- paste("0", file_name, sep = "")
    }
    file_name
}

process_specdata <- function(directory,i){
    file_name <- build_file_name(i)
    spec_data <- read.csv(paste(directory,"/", file_name, sep = ""))
    c(id = i, nobs = nrow(spec_data[complete.cases(spec_data$sulfate, spec_data$nitrate),]))
}

complete <- function(directory, id = 1:332){
    complete_data <- data.frame(id = integer() , nobs = integer())
    for(i in id){
        complete_data <- rbind(complete_data, process_specdata(directory,i))
    }
    names(complete_data) <- c("id", "nobs")
    complete_data
}

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

