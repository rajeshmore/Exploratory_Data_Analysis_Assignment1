setwd("~/Documents/Coursera/Exploratory Data Analysis/week1")
# Read House hold Power consumption data 
hpc <- read.csv("household_power_consumption.txt",header=TRUE,sep=";")
# head(hpc)
# summary(hpc)
# Extract data only for 2 days
hpc_data <- subset(hpc, (hpc$Date == "1/2/2007" | hpc$Date== "2/2/2007")) 
# head(hpc)
# Remove data frame for remining data to free up memory
rm (hpc)
# Define image properties
png("plot1.png", width=480, height= 480)
#hist(as.numeric(data$Global_active_power))
# Generate histogram
hist(as.numeric(hpc_data$Global_active_power), col= "red", xlab= "Global Active Power (kilowatts)", 
     ylab= "Frequency", main= "Global Active Power")
# Close file writing
dev.off()