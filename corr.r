source("complete.r")
build_specdata <- function(directory,id){
    joint_spec_data <- c()
    for(i in id){
        file_name <- build_file_name(i)
        spec_data <- read.csv(paste(directory,"/", file_name, sep = ""))
        spec_data <- spec_data[complete.cases(spec_data$sulfate, spec_data$nitrate),]
        joint_spec_data <- append(joint_spec_data, c(cor(spec_data[[2]],spec_data[[3]])))
    }
    joint_spec_data
    
}
corr <- function(directory, threshold = 0){
    complete_data <- complete(directory, 1:332)
    complete_threshold_data <- complete_data[complete_data$nobs > threshold,]$id
    build_specdata(directory, complete_threshold_data)
}

cr <- corr("specdata", 150)
