# Theta is the vector of candidate values for the parameter theta
# nThetaVals is the number of candidate theta values
nThetaVals <- 63

# Now make shte vector of theta values:
Theta <- seq(from = 1/(nThetaVals+1), to = nThetaVals/(nThetaVals+1), 
            by = 1/(nThetaVals+1))
Theta

# pTheta is the vector of prior probabilities on the theta values
pTheta <- pmin(Theta, 1-Theta) # Makes a triangular belief distribution
pTheta <- pTheta/sum(pTheta) # Makes sure that beliefs sum to 1

# Specify the data. 
Data <- c(rep(1, 3), rep(0, 9))
nHeads <- sum(Data)
nTails <- length(Data) - nHeads

# Compute the likelihood of the data for each value of theta:
pDataGivenTheta = Theta^nHeads * (1-Theta)^nTails

# Compute the posterior:
pData = sum(pDataGivenTheta * pTheta)
pThetaGivenData = pDataGivenTheta * pTheta/pData # Bayes rule!

# Plot the prior: 
plot(Theta, pTheta, type = 'h', lwd = 3, main = "Prior", 
     xlim = c(0, 1), xlab = bquote(theta), 
     ylim = c(0, 1.1*max(pThetaGivenData)), ylab = bquote(p(theta)),
     cex.axis=1.2 , cex.lab=1.5 , cex.main=1.5)

# Plot the likelihood:
plot(Theta, pDataGivenTheta, type="h" , lwd=3, main="Likelihood",
     xlim=c(0,1), xlab=bquote(theta),
     ylim=c(0,1.1*max(pDataGivenTheta)), ylab=bquote(paste("p(D|",theta,")")),
     cex.axis=1.2 , cex.lab=1.5 , cex.main=1.5)
text( .55 , .85*max(pDataGivenTheta) , cex=2.0 ,
      bquote( "D=" * .(nHeads) * "H," * .(nTails) * "T" ) , adj=c(0,.5) )

# Plot the posterior:
plot(Theta, pThetaGivenData, type="h", lwd=3, main="Posterior" ,
      xlim=c(0,1) , xlab=bquote(theta),
      ylim=c(0,1.1*max(pThetaGivenData)), ylab=bquote(paste("p(",theta,"|D)")),
      cex.axis=1.2 , cex.lab=1.5 , cex.main=1.5)
text( .55 , .85*max(pThetaGivenData) , cex=2.0 ,
      bquote( "p(D)=" * .(signif(pData,3)) ) , adj=c(0,.5) )

