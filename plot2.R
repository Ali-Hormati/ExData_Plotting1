plot2<- function(){
        
        ## reading the database
        data <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
        
        FullTimeDate <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
        data <- cbind(data, FullTimeDate)
        
        data$Global_active_power <- as.numeric(data$Global_active_power)
        data$Date <- as.Date(data$Date, format="%d/%m/%Y")
        
        
        ## subset data
        subsetdata <- subset(data, Date == "2007-02-02" | Date =="2007-02-01")
        
        ## plot
        png("plot2.png", width=480, height=480)
        with(subsetdata, plot(FullTimeDate, Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)"))
        dev.off()
}