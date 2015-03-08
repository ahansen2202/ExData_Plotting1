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

hist(data$Global_active_power, main = "Global Active Power", ylab = "Frequency", 
      xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, ylim = c(0, 
      1200), xlim = c(0, 6), xaxp = c(0, 6, 3))
