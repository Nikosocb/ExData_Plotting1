## the situation is similar to plot1.R, plot2.R

file <- "household_power_consumption.txt"
data <- read.table(
    file,
    header=TRUE,
    sep=";",
    stringsAsFactors=FALSE,
    dec="."
    )

dateSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(dateSubset$Date, dateSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##plot 3 separated variables
subMetering1 <- as.numeric(dateSubset$Sub_metering_1)
subMetering2 <- as.numeric(dateSubset$Sub_metering_2)
subMetering3 <- as.numeric(dateSubset$Sub_metering_3)

#again, turn the device on
png("plot3.png", width=480, height=480)

#set up the plot
plot(
    datetime,
    subMetering1,
    type="l",
    ylab="Energy Submetering",
    xlab=""
    )

##create the line format
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

## add a legend
legend(
    "topright",
    c("Sub_metering_1",
      "Sub_metering_2",
      "Sub_metering_3"),
    lty=1,
    lwd=2.5,
    col=c("black", "red", "blue")
    )
##turn the device off, and you're done
dev.off()