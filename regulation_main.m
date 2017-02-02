%% Three types autoregulation

tspan = [0 12000]; %timespan

%IC = [initial m_A, initial A]
IC0 = [0; 0.5; 0; 0.5; 0; 0.5]; 


%Parameters
%alpha_a = 0.375;
%alpha_b = 0.5;      % Promotor strength
%alpha_o = 5e-4;
%k       = 0.116;    % RBS strength
%delta = 5.78e-3;    % Degradation rate
%gamma = 1.16e-3;    % Degradation rate
%K = 1e4;
%n = 2;

%The extra brackets allow you to add additional variables
%For ode45 the format is ode45(@function, timespan, initial conditions)
%[t, ic] = ode45(@func_unregulated, tspan, IC0,[], delta, gamma, alpha_b, alpha_a,alpha_o, k, K,n);% unregulated
[t, ic] = ode45(@func_unregulated, tspan, IC0,[]);


figure(1)
plot(t,ic(:,2),'b', t, ic(:,4),'r', t, ic(:,6),'k'); 
legend('Unregulated','negative Autoregulation', 'positive Autoregulation')
xlabel('Time (min)')
ylabel('Protein Concentration (nM)')
title('Three different types of regulation')
