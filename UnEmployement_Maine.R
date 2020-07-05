# Fetch data
www <- "http://www.maths.adelaide.edu.au/andrew.metcalfe/Data/Maine.dat"
Maine.month <- read.table(www, header=T)

# Attach data
attach(Maine.month)
class(Maine.month)

# Convert to time series
Maine.month.ts <- ts(unemploy, start = c(1996, 1), freq = 12)

# Mean annual rate
Maine.annual.ts <- aggregate(Maine.month.ts) / 12

# Plot both
par(mar = c(1, 1, 1, 1))
layout(1:2)
plot(Maine.month.ts, ylab="unemployed (%)")
plot(Maine.annual.ts, ylab="unemployed (%)")

# Respective figures
Maine.Feb <- window(Maine.month.ts, start = c(1996, 2), freq=T)
Maine.Aug <- window(Maine.month.ts, start = c(1996, 8), freq=T)
Feb.ratio <- mean(Maine.Feb) / mean(Maine.month.ts)
Aug.ratio <- mean(Maine.Aug) / mean(Maine.month.ts)

print(Feb.ratio)
print(Aug.ratio)



# US monthly unemployement rate
# Fetch data
www <- "http://www.maths.adelaide.edu.au/andrew.metcalfe/Data/USunemp.dat"
US.month <- read.table(www, header=T)
attach(US.month)

US.month.ts <- ts(USun, start = c(1996, 1), end = c(2006, 10), freq=12)
plot(US.month.ts, ylab="unemployed (%)")
