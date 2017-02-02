%% Unregulated
tspan = [0 10000]; %timespan

%IC = [initial m_A, initial A]
IC = [0 0] ; 

%Parameters
alpha_a = 0.375;
alpha_b = 0.5;
alpha_o = 5e-4;
k       = 0.116;
delta = 5.78e-3;    % Degradation rate
gamma = 1.16e-3;    % Degradation rate
K = 1e4;
n = 2;

%The extra brackets allow you to add additional variables
%For ode45 the format is ode45(@function, timespan, initial conditions)
[t, X] = ode45(@func_unregulated, tspan, IC, [], delta, gamma, alpha_b, k);             % unregulated



plot(t,X(:,1)); 
xlabel('Time')
ylabel('Protein A Concentration')
title('Unregulated')
