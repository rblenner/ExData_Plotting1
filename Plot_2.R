#reading in the data


#getwd()
#setwd(dir = "Project 1")
#dir()

energy <- read.csv2(file = "household_power_consumption.txt", header = TRUE, dec = ".", stringsAsFactor = FALSE, na.strings = "?",
                    colClasses = c("character", 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric','numeric','numeric'))

head(energy)
str(energy)

#2nd plot
#same basic structure of data into R as per 1st plot
energy <- read.csv2(file = "household_power_consumption.txt", header = TRUE, dec = ".", stringsAsFactor = FALSE, na.strings = "?",
                    colClasses = c("character", 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric','numeric','numeric'))
feb_energy <- subset(energy, energy$Date == "1/2/2007" | energy$Date == "2/2/2007") 
str(feb_energy)   #Date and time are characters at this stage
# make Date and Time = date and time
feb_energy$Date <- as.Date(feb_energy$Date, format = "%d/%m/%Y")
feb_energy$Time <- strptime(feb_energy$Time, format = "%H:%M:%S")
feb_energy[1:1440, "Time"] <- format(feb_energy[1:1440, "Time"], "2007-02-01 %H:%M:S:")
feb_energy[1441:2880, "Time"] <- format(feb_energy[1441:2880, "Time"], "2007-02-02 %H:%M:S:")
#then make 2 days from the above
str(feb_energy$Time)  #checking structure

dev.off()   #clearing prior plot
plot.new()
#creating blank plot with y-axis label
plot(feb_energy$Time, feb_energy$Global_active_power, type = "n",
     xlab = "",
     ylab = "Global active power (kilowatts)"
)
#plotting with lines 
lines(feb_energy$Time, feb_energy$Global_active_power)
dev.copy(png, file = "Plot2")
dev.off()    