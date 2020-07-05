# Load the data
data("AirPassengers")
AP <- AirPassengers

# Show the class
print(class(AP))

# Show specific values
start(AP); end(AP); frequency(AP);

# Summary
summary(AP)

# Plot the data
plot(AP, ylab="Passengers (1000's)")

# Aggregating to remove seasonal variations
dev.off()
par(mar = c(1, 1, 1, 1))
layout(1:2)
plot(aggregate(AP))
boxplot(AP ~ cycle(AP))
