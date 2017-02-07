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

## Sensitivity analysis unregulated
SnsU <- sensFun(func = solveREG, parms = pars, sensvar = "U",varscale = 1)
head(SnsU)
plot(SnsU)
plot(SnsU,type = "b",  pch = 0:7, col = 2:9, 
     main = "Sensitivity all vars (Unregulated)")
summary(SnsU)
plot(summary(SnsU))

## Sensitivity analysis negative autoregulation
SnsN <- sensFun(func = solveREG, parms = pars, sensvar = "N",varscale = 1)
head(SnsN)
plot(SnsN)
plot(SnsN, type = "b", pch = 0:7, col = 2:9, 
     main = "Sensitivity all vars (Negative autoregulation)")
summary(SnsN)
plot(summary(SnsN))

## Sensitivity analysis positive autoregulation
SnsP <- sensFun(func = solveREG, parms = pars, sensvar = "P",varscale = 1)
head(SnsP)
plot(SnsP)
plot(SnsP, type = "b", pch = 0:7, col = 2:9, 
     main = "Sensitivity all vars (Positive autoregulation)")
summary(SnsP)
plot(summary(SnsP))

## Compare the sensitivities open- and closed loop
time = c(out$time)
x1 = time[c(10000)]
x2 = time[c(10100)]
output_u = c(out$U)
y1u = output_u[c(10000)]
y2u = output_u[c(10100)]
slope_u = (y2u-y1u)/(x2-x1)

output_n = c(out$N)
y1n = output_n[c(10000)]
y2n = output_n[c(10100)]
slope_n = (y2n-y1n)/(x2-x1)

output_p = c(out$P)
y1p = output_p[c(10000)]
y2p = output_p[c(10100)]
slope_p = (y2p-y1p)/(x2-x1)

for (y2u-y2n){
  # Define min to max vector for alpha_b
  # Define min to max vector for k
}
