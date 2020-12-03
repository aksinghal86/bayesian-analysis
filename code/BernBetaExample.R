source('code/BernBeta.R')
source('code/DBDA2E-utilities.R')

# Specify the prior:
t = 0.75             # Specify the prior MODE.
n = 25               # Specify the effective prior sample size.
a = t*(n-2) + 1      # Convert to beta shape parameter a.
b = (1-t)*(n-2) + 1  # Convert to beta shape parameter b.

Prior = c(a,b)       # Specify Prior as vector with the two shape parameters.

# Specify the data:
N = 20                         # The total number of flips.
z = 17                         # The number of heads.
Data = c(rep(0,N-z),rep(1,z))  # Convert N and z into vector of 0's and 1's.

posterior = BernBeta( priorBetaAB=Prior, Data=Data , plotType="Bars" , 
                      showCentTend="Mode" , showHDI=TRUE , showpD=FALSE )

#### Exercise 6.1
post <- BernBeta(priorBetaAB=c(4,4), Data=c(1), plotType='Bars', showCentTend="Mode", showHDI = TRUE)
# Second flip = heads
post <- BernBeta(priorBetaAB=post, Data=c(1), plotType='Bars', showCentTend="Mode", showHDI = TRUE)
# Third flip = tails
post <- BernBeta(priorBetaAB=post, Data = c(0), plotType='Bars', showCentTend="Mode", showHDI = TRUE)

post <- BernBeta(priorBetaAB=c(4,4), Data=c(0), plotType='Bars', showCentTend="Mode", showHDI = TRUE)
# Second flip = heads
post <- BernBeta(priorBetaAB=post, Data=c(1), plotType='Bars', showCentTend="Mode", showHDI = TRUE)
# Third flip = tails
post <- BernBeta(priorBetaAB = post, Data = c(1), plotType='Bars', showCentTend="Mode", showHDI = TRUE)


#### Exercise 6.2
N <- 100
z <- 58
Data <- c(rep(1, z), rep(0, N-z))
post <- BernBeta(priorBetaAB = c(1, 1), Data = Data, plotType='Bars', showCentTend="Mode", showHDI = TRUE)

N <- 100
z <- 57
Data <- c(rep(1, z), rep(0, N-z))
post <- BernBeta(priorBetaAB = post, Data = Data, plotType='Bars', showCentTend="Mode", showHDI = TRUE)


#### Exercise 6.3
N <- 50
z <- 40
Data <- c(rep(1, z), rep(0, N-z))
post <- BernBeta(priorBetaAB = c(1, 1), Data = Data, plotType='Bars', showCentTend="Mode", showHDI = TRUE)

N <- 50
z <- 15
Data <- c(rep(1, z), rep(0, N-z))
post <- BernBeta(priorBetaAB = c(1, 1), Data = Data, plotType='Bars', showCentTend="Mode", showHDI = TRUE)


#### Exercise 6.4
post <- BernBeta(priorBetaAB = c(0.01, 0.01), Data = c(rep(1, 4), 0), plotType='Bars', showCentTend="Mode", showHDI = TRUE)

#### Exercise 6.5
# (A)
post <- BernBeta(priorBetaAB = c(500, 500), Data = c(rep(1, 9), 0), plotType='Bars', showCentTend="Mode", showHDI = TRUE)

# (B)
post <- BernBeta(priorBetaAB = c(0.01, 0.01), Data = c(rep(1, 9), 0), plotType='Bars', showCentTend="Mean", showHDI = TRUE)
