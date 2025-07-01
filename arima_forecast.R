install.packages("forecast")
install.packages("tseries")

library(forecast)
library(tseries)

ts_data <- AirPassengers

plot(ts_data)
str(ts_data)
summary(ts_data)

adf.test(ts_data)

ts_log <- log(ts_data)
ts_diff <- diff(ts_log)
plot(ts_diff)
adf.test(ts_diff)

fit <- auto.arima(ts_log)
fit

forecasted <- forecast(fit, h=12)
plot(forecasted)

exp_forecast <- exp(forecasted$mean)
exp_forecast

write.csv(data.frame(Forecast=exp_forecast), "forecast_output.csv", row.names=FALSE)
