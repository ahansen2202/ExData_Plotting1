alldata <- read.csv("./R/household_power_consumption.txt", header = T, sep = ';', 
                    na.strings = "?", nrows = 2075259, check.names = F, 
                    stringsAsFactors = F, comment.char = "", quote = '\"')
alldata$Date <- as.Date(alldata$Date, format = "%d/%m/%Y")

## just two days
data <- subset(alldata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(alldata)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
