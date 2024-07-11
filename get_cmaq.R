
packages <- c("RPostgreSQL",         
              "dplyr",
              "lubridate")        
invisible(lapply(packages, library, character.only = TRUE))

# function to get daily CMAQ result from DB and save as CSV
getCMAQ <- function(time = today()) {

    # query1 is data of 16 district from "city table"
    query1 <- paste0("
        SELECT datadate, citycode, pm25_1h, predictiontime 
        FROM public.t_cmaq_d4_c_hour 
        WHERE citycode IN ('110101', '110102', '110105', '110106', '110107', 
                            '110108', '110109', '110111', '110112', '110113',
                            '110114', '110115', '110116', '110117', '110118',
                            '110119')
        AND predictiontime = '", format(time - 1, "%Y-%m-%d"), " 20:00:00'")
    # query2 is data of YiZhuang from "station table"
    query2 <- paste0("
        SELECT datadate, stationcode, pm25_1h, predictiontime 
        FROM public.t_cmaq_d4_hour 
        WHERE stationcode = '110115110'
        AND predictiontime = '", format(time - 1, "%Y-%m-%d"), " 20:00:00'")
    
    source("postgresql_3clear.R")
    on.exit(dbDisconnect(connec))

    data1 <- RPostgreSQL::dbGetQuery(conn = connec, statement = query1)
    data2 <- RPostgreSQL::dbGetQuery(conn = connec, statement = query2)

    # Do nothing if now cmaq result for that day 
    if  (nrow(data1) == 0 | nrow(data2) == 0) {
        return()
    }
    
    # combine Yizhuan (no 110120 data in city table)
    data2 <- rename(data2, citycode = stationcode)
    data2$citycode <- "110120"
    data <- bind_rows(data1, data2)
    
    data$timespan <- hour(hours(data$datadate - data$predictiontime))
    data <- subset(data, timespan <= 72)
    data <- arrange(data, citycode, datadate)

    filename <- paste0("~/cmaq1h/cmaq", format(time, "%Y%m%d"), ".csv")
    write.table(data,
                file = filename,
                row.names = FALSE,
                col.names = TRUE,
                sep = ",", 
                quote = FALSE)


}

getCMAQ()

# date <- ymd("2021-11-01")
# while (date <= today()) {
#     getCMAQ(time = date)
#     date <- date + 1
# }

