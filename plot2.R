#       read the dataset
monsterdata <- read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)


#       format the dates
monsterdata$Date <- as.Date(monsterdata$Date, "%d/%m/%Y")

#       select the data required
data <- monsterdata[monsterdata$Date >= "2007-02-01" & monsterdata$Date <= "2007-02-02",]

#       Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


#       Create plot 2
plot(data$Global_active_power~data$Datetime, type = "1",ylab = "Global Active Power (kilowatts)")


#       Save to file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()