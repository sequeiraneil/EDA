#       read the dataset
monsterdata <- read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)


#       format the dates
monsterdata$Date <- as.Date(monsterdata$Date, "%d/%m/%Y")

#       select the data required
data <- monsterdata[monsterdata$Date >= "2007-02-01" & monsterdata$Date <= "2007-02-02",]

#       Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


#       Create plot 3
with (data, { 
        plot(Sub_metering_1~Datetime, type="l",
                ylab = "Global Active Power (kilowatts)", xlab = "")
        lines(Sub_metering_2~Datetime, col = "Red")
        lines(Sub_metering_3~Datetime, col = 'Blue')
        }
)


legend("topright", col = c("black", "red", "blue"), lty =1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#       Save to file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()