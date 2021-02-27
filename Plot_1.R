#reading in the data


#getwd()
#setwd(dir = "Project 1")
#dir()
energy <- read.csv2(file = "household_power_consumption.txt", header = TRUE, dec = ".", stringsAsFactor = FALSE, na.strings = "?",
                    colClasses = c("character", 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric','numeric','numeric'))

head(energy)
str(energy)
# all time/date variables are initially characters; cos I couldn't load them as date / time


#1st histogram
#picking 1st two days of feb
plot.new()
feb_energy <- subset(energy, energy$Date == "1/2/2007" | energy$Date == "2/2/2007")  
str(feb_energy)                         #just checking the data
range(feb_energy$Global_active_power)   #just checking the data 

hist(feb_energy$Global_active_power, main = "Global Active Power",
     xlab = "Global active power (kilowatts)",
     col = "red"
)
#write to png file
dev.copy(png, file = "Plot1")
dev.off()
#unsure why there are some points > 6, but not in the example output; though they are there in the raw data. 

