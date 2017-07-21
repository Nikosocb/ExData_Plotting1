##Open here the data file...
file <- "household_power_consumption.txt"

##And read it to a new variable, data
data <- read.table(
    file,
    header=TRUE,
    sep=";",
    stringsAsFactors=FALSE,
    dec=".")

## create a subset of the data with respect to the needed dates (1/2/2007 - 2/2/2007) 
dateSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## now we need to make a 2D hist. In order to do that, we make two new variables:
datetime <- strptime(
    paste(dateSubset$Date, dateSubset$Time, sep=" "),
    "%d/%m/%Y %H:%M:%S"
    ) 
GlobalActivePower <- as.numeric(dateSubset$Global_active_power)

## the plotting material is set, the rest is just plotting commands
png("plot2.png", width=480, height=480)

plot(
    datetime,
    GlobalActivePower,
    type="l",
    xlab="",
    ylab="Global Active Power (kilowatts)"
    )
## and turn the device off
dev.off()