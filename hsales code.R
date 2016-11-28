library(fpp) #fpp package must be installed first

# Plot the time series. Can you identify seasonal fluctuations and/or a trend? 
hsales2 <- ts(hsales,start=c(1973,1),frequency=12)
plot(hsales2)
#
# Use a classical decomposition to calculate the trend-cycle and seasonal indices. 
## Do the results support the graphical interpretation from part (a)?
fitd <- decompose(hsales)
plot(fitd)
#

# Compute and plot the seasonally adjusted data.
hsalesadj <- seasadj(fitd)
plot(hsalesadj)
#
# Change one observation to be an outlier (e.g., add 500 to one observation), and recomputethe seasonally adjusted data. What is the effect of the outlier?
# Does it make any difference if the outlier is near the end rather than in the middle of the time series?
hsales3 <- ts(c(hsales[1:54],hsales[55]+200,hsales[56:275]),start=c(1973,1),frequency=12)
plot(hsales3)

fitd <- decompose(hsales3)
plot(fitd)
#
# Compute and plot the seasonally adjusted data.
hsalesadj <- seasadj(fitd)
plot(hsalesadj)

# Now use STL to decompose the original series.
# Do the results support the graphical interpretation from part (a)?
fit <- stl(hsales, s.window=5)
plot(fit)

