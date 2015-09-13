source('get_data.R')

# build and save plot1.png
build_plot1 <- function () {
    data <- get_data()    
    hist(data$Global_active_power, col = 'red',
         xlab = 'Global Active Power (kilowatts)',
         main = 'Global Active Power')
    dev.copy(png, 'plot1.png')
    dev.off()
}