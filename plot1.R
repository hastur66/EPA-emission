library("data.table")
path <- getwd()

SCC <- data.table::as.data.table(x = readRDS(file = "~/Documents/Coursera/R - Data Science - Johns Hopkins/Assignments/Course 4 project/exdata_data_NEI_data/Source_Classification_Code.rds"))
NEI <- data.table::as.data.table(x = readRDS(file = "~/Documents/Coursera/R - Data Science - Johns Hopkins/Assignments/Course 4 project/exdata_data_NEI_data/summarySCC_PM25.rds"))

NEI[, Emissions := lapply(.SD, as.numeric), .SDcols = c("Emissions")] 

totalNEI <- NEI[, lapply(.SD, sum, na.rm = TRUE), .SDcols = c("Emissions"), by = year]

barplot(totalNEI[, Emissions]
        , names = totalNEI[, year]
        , xlab = "Years", ylab = "Emissions"
        , main = "Emissions over the Years")
