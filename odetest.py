#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jan 16 09:44:01 2017

@author: robin
"""

import scipy.integrate as integrate
import matplotlib.pyplot as plt
import numpy as np

pi = np.pi
sqrt = np.sqrt
cos = np.cos
sin = np.sin

def deriv_z(z, phi):
    u, udot = z
    return [udot, -u + sqrt(u)]

phi = np.linspace(0, 7.0*pi, 2000)
zinit = [1.49907, 0]
z = integrate.odeint(deriv_z, zinit, phi)
u, udot = z.T
# plt.plot(phi, u)
fig, ax = plt.subplots()
ax.plot(1/u*cos(phi), 1/u*sin(phi))
ax.set_aspect('equal')
plt.grid(True)
plt.show()