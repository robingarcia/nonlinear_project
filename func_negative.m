function output = func_negative(tspan, IC, delta, gamma, alpha_b, alpha_o, K, k, n)

m_A = IC(1); % Initial state of m_A
A   = IC(2); % Initial state of A

dm_Adt  = ((alpha_b/(1+(A/K)^n))+alpha_o) - delta*m_A;     %Diff EQ for m_A (mRNA for Protein A)
dAdt    = k*m_A - gamma*A;         %Diff EQ for A (Protein A)

%Make sure your output is in columns
output = [dm_Adt; dAdt]; 
end 
