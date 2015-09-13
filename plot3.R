source('get_data.R')

build_plot3 <- function () {
    DATA <- get_data()
    plot(DATA$dateTime, DATA$Sub_metering_1, type = 'l', xlab = '',
         ylab = 'Energy sub metering')
    lines(DATA$dateTime, DATA$Sub_metering_2, col = 'red')
    lines(DATA$dateTime, DATA$Sub_metering_3, col = 'blue')
    legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
           lty = c(1,1,1), col = c('black', 'red', 'blue'))
    dev.copy(png, 'plot3.png')
    dev.off()
}