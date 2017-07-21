
##Open here the data file...
file <- "household_power_consumption.txt"

##And read it to a new variable, data
data <- read.table(
    file ,
    header=TRUE ,
    sep=";" ,
    stringsAsFactors=FALSE,
    dec="."
)

## create a subset of the data with respect to the needed dates (1/2/2007 - 2/2/2007) 
dateSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") , ]

## now that our (sub)dataset is ready, we just need to plot it

##the variable we want to plot in the X axis is the global active power
GlobalActivePower <- as.numeric(dateSubset$Global_active_power)

## engage the ploting device, to save the output as a .png with the required dimensions
png("plot1.png", width=480, height=480)

## and plot
hist(
    GlobalActivePower,
    main="Global Active Power",
    xlab="Global Active Power (kilowatts)",
    col="red")

##after all is said and done, turn the device off
dev.off()