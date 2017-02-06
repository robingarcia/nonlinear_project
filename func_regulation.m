function output = func_regulation(t, IC, delta, gamma, alpha_b,alpha_a,alpha_o,K,n, k)
%Parameters
alpha_a = 0.375;
alpha_b = 0.5;      % Promotor strength
alpha_o = 5e-4;
k       = 0.116;    % RBS strength
delta = 5.78e-3;    % Degradation rate
gamma = 1.16e-3;    % Degradation rate
K = 1e4;
n = 2;

% Unregulated
dICdt(1,:)  = alpha_b - (delta*IC(1));% Dynamics for mRNA     
dICdt(2,:)  = k*IC(1) - (gamma*IC(2));% Dynamics for Protein         

% negative Autoregulated
dICdt(3,:)  = ((alpha_b/(1+(IC(4)/K).^n))+alpha_o) - (delta*IC(3));% Dynamics for mRNA     
dICdt(4,:)    = k*IC(3) - (gamma*IC(4));% Dynamics for Protein         

% positive Autoregulated
dICdt(5,:)  = ((((alpha_a*(IC(6)/K).^n)/(1+(IC(6)/K).^n))+alpha_b)) - (delta*IC(5));% Dynamics for mRNA    
dICdt(6,:)    = k*IC(5) - (gamma*IC(6));% Dynamics for Protein  

%Make sure your output is in columns 
output = [dICdt]; 
end 
