source('get_data.R')

build_plot2 <- function () {
    data <- get_data()
    plot(data$dateTime, data$Global_active_power, type = 'l',
         ylab = 'Global Active Power (kilowatts)', xlab = '')
    dev.copy(png, 'plot2.png')
    dev.off()
}