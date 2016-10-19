build_file_name <- function(file_number){
    file_name <- paste(as.character(file_number), ".csv", sep = "")
    while (nchar(file_name) < 7) {
        file_name <- paste("0", file_name, sep = "")
    }
    file_name
}

pollutantmean <- function(directory, pollutant, id = 1:332){
    pollutant_data <- c()
    for(i in id){
        file_name <- build_file_name(i)
        spec_data <- read.csv(paste(directory,"/", file_name, sep = ""))
        new_data <- spec_data[!is.na(spec_data[[pollutant]]),][[pollutant]]
        pollutant_data <- c(new_data, pollutant_data)
    }
    mean(pollutant_data)
}
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate")
pollutantmean("specdata", "sulfate", 34)

