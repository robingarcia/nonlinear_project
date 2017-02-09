#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Feb  3 16:47:06 2017

@author: robin
"""

'''
This is an example file for S-timator

'''

from stimator import read_model
#%matplotlib inline
model_description = """

title A two-reaction chemical system

r1: A -> B, rate = k1 * A
r2: B -> C, rate = k2 * B - k3 * C

k1 = 0.1
k2 = 2
k3 = 1

init: (A = 1)

"""

m = read_model(model_description)

print(m)

m.solve(tf=50.0).plot()