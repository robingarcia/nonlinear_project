#==============================================================================
# Unregulated expression _u
# Negative autoregulation _n
# Positive autoregulation _p
#==============================================================================

pars <- list(alpha_a=0.375, alpha_b=0.5, alpha_o=5e-4, k=0.116, delta=5.78e-3, gamma=1.16e-3, K=1e4, n=2)

solveREG <- function(pars) {
  derivs <- function (t, state, pars) {
    with (as.list(c(state, pars)), {
      dMU <- alpha_b - delta*MU 
      dU <- k*MU - gamma*U # unregulated
      dMN <-  ((alpha_b/(1+(N/K)^n))+alpha_o) - delta*MN
      dN <- k*MN - gamma*N # negative autoregulation
      dMP <-  ((((alpha_a*(P/K)^n)/(1+(P/K)^n))+alpha_b)) - delta*MP
      dP <- k*MP - gamma*P# positive autoregulation
      return(list(c(dMU, dMN, dMP, dU, dN, dP)))
    })
  }
state <- c(MU = 0.5, MN = 0.5, MP = 0.5, U = 0, N = 0, P = 0)
tout  <- seq(0,12000)
# ode solves the model by integration...
return(as.data.frame(ode(y=state, times = tout, func = derivs, parms = pars)))
}
out <- solveREG(pars)

# Plot the results
plot(out$time, out$U, ylim = range(c(out$U, out$N, out$P)),
     xlab = "Time (min)", ylab = "Concentration (nM)", type = "l", lwd = 1)
lines(out$time, out$U, lty = 1, lwd = 2, col = "blue")
lines(out$time, out$N, lty = 1, lwd = 2, col = "red")
lines(out$time, out$P, lty = 1, lwd = 2, col = "black")
#lines(out$time, out$U + out$N)

legend("topright", c("Unregulated", "Negative autoregulation", "Positive autoregulation"),
       lty = c(1,1,1), lwd = c(2,2,2), col = c("blue","red","black"))

## Sensitivity analysis
SnsU <- sensFun(func = solveREG, parms = pars, sensvar = "U",varscale = 1)
head(SnsU)
plot(SnsU)
plot(SnsU, type = "b", pch = 15:19, col = 2:6, 
     main = "Sensitivity all vars")

summary(SnsBact)
plot(summary(SnsBact))
