setwd("~/Documents/Coursera/Exploratory Data Analysis/week1")
# Read House hold Power consumption data 
  hpc <- read.csv("household_power_consumption.txt",header=TRUE,sep=";")
# head(hpc)
# summary(hpc)
# Extract data only for 2 days
  hpc_data<- subset(hpc, (hpc$Date == "1/2/2007" | hpc$Date== "2/2/2007")) 
# head(hpc)
# Remove data frame for remining data to free up memory
 rm (hpc)
  
# Convert date Formant & concanate columns (Date + Time)
 hpc_data$Date <- as.Date(hpc_data$Date, format = "%d/%m/%Y")
 hpc_data$DateTime <- as.POSIXct(paste(hpc_data$Date, hpc_data$Time))
# Define image properties
png("plot2.png", width=480, height= 480)
# Generate Plot
plot(hpc_data$DateTime, as.numeric(hpc_data$Global_active_power), 
      type= "l", lwd=1,   ylab= "Global Active Power (kilowatts)", xlab="DateTime")
 # axis(2, yaxp=c(1, 0, 8) )
# Close file writing
dev.off()

