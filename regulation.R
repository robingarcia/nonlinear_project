# This is an implementation of a regulation model
library(deSolve)

#==============================================================================
# Unregulated expression _u
# Negative autoregulation _n
# Positive autoregulation _p
#==============================================================================
REGmod <- function(t, x , parms) {
  with(as.list(c(parms, x)), {
    dMU <- alpha_b - delta*MU 
    dU <- k*MU - gamma*U # unregulated
    dMN <-  ((alpha_b/(1+(N/K)^n))+alpha_o) - delta*MN
    dN <- k*MN - gamma*N # negative autoregulation
    dMP <-  ((((alpha_a*(P/K)^n)/(1+(P/K)^n))+alpha_b)) - delta*MP
    dP <- k*MP - gamma*P# positive autoregulation   
    res <- c(dMU, dMN, dMP, dU, dN, dP)
    list(res)
  })

}

## The parameters
parms <- c(alpha_a=0.375, alpha_b=0.5, alpha_o=5e-4, k=0.116, delta=5.78e-3, gamma=1.16e-3, K=1e4, n=2)
## Vector of timesteps
times <- seq(0, 12000)

## Start values for steady state
xstart <-c(MU = 0.5, MN = 0.5, MP = 0.5, U = 0, N = 0, P = 0)

## Solve model
out <- ode(y=xstart, times=times, func = REGmod, parms = parms)

summary(out)
## Default plot method
plot(out)

## User specified plotting

