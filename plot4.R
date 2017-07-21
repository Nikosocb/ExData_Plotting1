##the last step is simply the reproduction of the previous code, in a single pannel

file <- "household_power_consumption.txt"

data <- read.table(
    file,
    header=TRUE,
    sep=";",
    stringsAsFactors=FALSE,
    dec="."
    )

##our data subset
dateSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(dateSubset$Date, dateSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(dateSubset$Global_active_power)
GlobalReactivePower <- as.numeric(dateSubset$Global_reactive_power)
voltage <- as.numeric(dateSubset$Voltage)
subMetering1 <- as.numeric(dateSubset$Sub_metering_1)
subMetering2 <- as.numeric(dateSubset$Sub_metering_2)
subMetering3 <- as.numeric(dateSubset$Sub_metering_3)

##this time we separate the canvas in a 2x2 grid
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

##and again, plot like there's no tomorrow
plot(datetime,
     GlobalActivePower,
     type="l",
     xlab="",
     ylab="Global Active Power",
     cex=0.2
     )

plot(datetime,
     voltage, type="l",
     xlab="datetime",
     ylab="Voltage"
     )

plot(datetime,
     subMetering1,
     type="l",
     ylab="Energy Submetering",
     xlab=""
     )

lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime,
     GlobalReactivePower,
     type="l", xlab="datetime",
     ylab="Global_reactive_power"
     )

##done
dev.off()