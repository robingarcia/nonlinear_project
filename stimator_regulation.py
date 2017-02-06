#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Feb  3 16:58:04 2017

@author: robin
"""

from stimator import read_model, solve
#%matplotlib inline
regulation = """

title Negative and positive Autoregulation

r1:DNA_u ->  mRNA_u,    rate= b - d * mRNA_u
r2:mRNA_u -> Protein_u, rate= k * mRNA_u - g*Protein_u
r3:DNA_n -> mRNA_n,     rate= (b/(1+(Protein_p/K)**n)+o) - d*mRNA_n
r4:mRNA_n -> Protein_n, rate= k * mRNA_n - g*Protein_n
r5:DNA_p -> mRNA_p,     rate=((((a*(Protein_p/K)**n)/(1+(Protein_p/K)**n))+b))-d*mRNA_p
r6:mRNA_p -> Protein_p, rate= k * mRNA_p - g*Protein_p

#Parameters and initial state
    a = 0.375
    b = 0.5
    o = 5e-4
    k = 0.116
    d = 5.78e-3
    g = 1.16e-3
    K = 1e4
    n = 2   
    
init: (mRNA_u = 0, mRNA_n = 0, mRNA_p = 0, DNA_u = 0.5, DNA_p = 0.5, DNA_n = 0.5)

# filter what you want to plot
!! Protein_p Protein_u Protein_n  

"""

m = read_model(regulation)

print ('========= model ========================================')
print (regulation)
print ('--------------------------------------------------------')

print(m)

s=m.solve(tf=400000.0)
print (s.last)
s.plot(show=True)