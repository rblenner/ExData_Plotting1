#reading in the data


#getwd()
#setwd(dir = "Project 1")
#dir()

energy <- read.csv2(file = "household_power_consumption.txt", header = TRUE, dec = ".", stringsAsFactor = FALSE, na.strings = "?",
                    colClasses = c("character", 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric','numeric','numeric'))

head(energy)
str(energy)

#3rd plot
#same basic structure of data into R as per 1st two plots
energy <- read.csv2(file = "household_power_consumption.txt", header = TRUE, dec = ".", stringsAsFactor = FALSE, na.strings = "?",
                    colClasses = c("character", 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric','numeric','numeric'))
feb_energy <- subset(energy, energy$Date == "1/2/2007" | energy$Date == "2/2/2007") 
str(feb_energy)   #Date and time are characters at this stage
# make Date and Time = date and time for two separate days
feb_energy$Date <- as.Date(feb_energy$Date, format = "%d/%m/%Y")
feb_energy$Time <- strptime(feb_energy$Time, format = "%H:%M:%S")
feb_energy[1:1440, "Time"] <- format(feb_energy[1:1440, "Time"], "2007-02-01 %H:%M:S:")
feb_energy[1441:2880, "Time"] <- format(feb_energy[1441:2880, "Time"], "2007-02-02 %H:%M:S:")

dev.off()
plot.new()
#make empty plot, then add each submeter one at a time
plot(feb_energy$Time, feb_energy$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(feb_energy$Time, feb_energy$Sub_metering_1)
lines(feb_energy$Time, feb_energy$Sub_metering_2, col = "red")
lines(feb_energy$Time, feb_energy$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#write to png file
dev.copy(png, file = "Plot3")
dev.off()