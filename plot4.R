source('get_data.R')

build_plot4 <- function () {
    DATA <- get_data()
    par(mfrow = c(2, 2))
    
    plot(DATA$dateTime, DATA$Global_active_power, xlab = '',
         ylab = 'Global Active Power', type = 'l')
    
    plot(DATA$dateTime, DATA$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
    
    plot(DATA$dateTime, DATA$Sub_metering_1, type = 'l', xlab = '',
         ylab = 'Energy sub metering')
    lines(DATA$dateTime, DATA$Sub_metering_2, col = 'red')
    lines(DATA$dateTime, DATA$Sub_metering_3, col = 'blue')
    legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
           lty = c(1,1,1), col = c('black', 'red', 'blue'), bty = 'n', cex = 0.75)
    
    plot(DATA$dateTime, DATA$Global_reactive_power, xlab = 'datetime',
         ylab = 'Global_reactive_power', type = 'l')
    
    dev.copy(png, 'plot4.png')
    dev.off()
}