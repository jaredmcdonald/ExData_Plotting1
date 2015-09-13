## libraries
if (!'dplyr' %in% installed.packages()) {
    message('installing dplyr')
    install.packages('dplyr')
}
library(dplyr)
if (!'lubridate' %in% installed.packages()) {
    message('installing lubridate')
    install.packages('lubridate')
}
library(lubridate)

DATA_URI <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
FILENAME <- 'household_power_consumption.txt'
DATES <- c('1/2/2007', '2/2/2007')
DATA <- NULL

## download and unzip data
get_data <- function () {
    if (!file.exists(FILENAME)) {
        temp <- tempfile()
        download.file(DATA_URI, temp)
        unzip(temp)
        unlink(temp)        
    }
    if (is.null(DATA)) {
        DATA <<- read.table(FILENAME, sep = ';', header = TRUE, na.strings = '?') %>%
            filter(Date %in% DATES) %>%
            mutate(dateTime = dmy_hms(paste(Date, Time)))
    }
    DATA
}