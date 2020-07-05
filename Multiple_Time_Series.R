# Fetch data
www <- "http://www.maths.adelaide.edu.au/andrew.metcalfe/Data/cbe.dat"
CBE <- read.table(www, header=T)

data("AirPassengers")
AP <- AirPassengers

CBE[1:4, ]

class(CBE)

Elec.ts <- ts(CBE[, 3], start=1958, freq=12)
Beer.ts <- ts(CBE[, 2], start=1958, freq=12)
Choc.ts <- ts(CBE[, 1], start=1958, freq=12)

plot(cbind(Elec.ts, Beer.ts, Choc.ts))

AP.elec <- ts.intersect(AP, Elec.ts)

start(AP.elec)
end(AP.elec)
AP.elec[1:3, ]

AP <- AP.elec[, 1]; Elec <- AP.elec[, 2]

par(mar = c(1, 1, 1, 1))
layout(1:2)
plot(AP, main = "", ylab="Air passengers / 1000's")
plot(Elec, main = "", ylab = "Electricity production / MkWh")

plot(as.vector(AP), as.vector(Elec),
     xlab = "Air passengers / 1000's",
     ylab = "Electricity production / MWh")
abline(reg = lm(Elec ~ AP))
cor(AP, Elec)
