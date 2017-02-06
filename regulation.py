#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Feb  3 16:26:31 2017

@author: robin
"""

'''
Implementation of three types of regulation 
1) unregulated
2) negative autoregulation
3) positive autoregulation

This also includes a sensitivity analysis
'''

#from scipy.integrate import ode
#import scipy.integrate as integrate
#import matplotlib.pyplot as plt
#import numpy as np

import numpy as np
from scipy import integrate
from matplotlib.pylab import *
 
def negauto(t, x):
    
    alpha_a = 0.375
    alpha_b = 0.5
    alpha_o = 5e-4
    k       = 0.116
    delta   = 5.78e-3
    gamma   = 1.16e-3
    K       = 1e4
    n       = 2
    
'''
dudt = unregulated 
dndt = negative autoregulation
dpdt = positive autoregulation
'''


    
    # Assign some variables for convenience of notation
    x0 = x[0]
    
    # Output from ODE function must be a COLUMN vector, with n rows
    n = len(x)      # 1: implies its a single ODE
    dxdt = np.zeros((n,1))
    dxdt[0] = b*(1/(1+(x/K)**n))-a*x 
    return dxdt
    
    # The ``driver`` that will integrate the ODE(s):
if __name__ == '__main__':
    
    # Start by specifying the integrator:
    # use ``vode`` with "backward differentiation formula"
    r = integrate.ode(negauto).set_integrator('vode', method='bdf')
    
    # Set the time range
    t_start = 0.0
    t_final = 5.0
    delta_t = 0.1
    
    # Number of time steps: 1 extra for initial condition
    num_steps = np.floor((t_final - t_start)/delta_t) + 1
    
    # Set initial condition(s): for integrating variable and time!
    x0_t_zero = 0
    r.set_initial_value([x0_t_zero], t_start)
    
    # Additional Python step: create vectors to store trajectories
    t = np.zeros((num_steps, 1))
    x0 = np.zeros((num_steps, 1))
    t[0] = t_start
    x0[0] = x0_t_zero
    
    # Integrate the ODE(s) across each delta_t timestep
    k = 1
    while r.successful() and k < num_steps:
        r.integrate(r.t + delta_t)
 
        # Store the results to plot later
        t[k] = r.t
        x0[k] = r.y[0]
        k += 1
 
    # All done!  Plot the trajectories:
    plot(t, x0)
    grid('on')
    xlabel('Time t')
    ylabel('Solution X')
    title('Solution of negative autoregulation')
