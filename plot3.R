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
# Convert date Formant & concanate columns (Date + Time)
hpc_data$Date <- as.Date(hpc_data$Date, format = "%d/%m/%Y")
hpc_data$DateTime <- as.POSIXct(paste(hpc_data$Date, hpc_data$Time))

# Define image properties
png("plot3.png", width=480, height= 480)
#hist(as.numeric(data$Global_active_power))
# Generate plot

plot(hpc_data$DateTime, as.numeric(hpc_data$Sub_metering_1), type="l", 
     lwd=1, ylab="Energy Submetering", xlab="DateTime",col="black" )
lines(hpc_data$DateTime, as.numeric(hpc_data$Sub_metering_2), type="l", col="red")
lines(hpc_data$DateTime, as.numeric(hpc_data$Sub_metering_3), type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, 
       col=c("black", "red", "blue"))

# Close file writing
dev.off()
