# Read the table into the memory with specified rows

name <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 1)
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", skip = 66636, nrows = 2880)
names(df) <- names(name)
x <- dmy_hms(paste(df$Date, df$Time))
df <- data.frame(x, df[,3:9])
names(df)[1] <- "Date & Time"



# 4th Plot

png("plot4.png", width = 480, height = 480)

par(mfcol = c(2,2))

plot(df$`Date & Time`, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(df$`Date & Time`, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(df$`Date & Time`, df$Sub_metering_2, col = 'red')
lines(df$`Date & Time`, df$Sub_metering_3, col = 'blue')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c('black', "red", "blue"), lty = 1)

plot(df$`Date & Time`, df$Voltage, type = "l", xlab = "dateTime", ylab = "Voltage")

plot(df$`Date & Time`, df$Global_reactive_power, type = "l", xlab = "dateTime", ylab = "Global_reactive_power")

dev.off()
