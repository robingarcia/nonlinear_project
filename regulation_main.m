%% Three types autoregulation
tspan = [0 12000]; %timespan

%IC = [initial m_A, initial A]
IC0 = [0; 0.5; 0; 0.5; 0; 0.5]; 

%The extra brackets allow you to add additional variables
%For ode45 the format is ode45(@function, timespan, initial conditions)
[t, ic] = ode45(@func_regulation, tspan, IC0,[]);

%Plot the results
figure(1)
plot(t,ic(:,2),'b', t, ic(:,4),'r', t, ic(:,6),'k'); 
legend('Unregulated','negative Autoregulation', 'positive Autoregulation')
xlabel('Time (min)')
ylabel('Protein Concentration (nM)')
title('Three different types of regulation')

figure(2)
plot(t,ic(:,1),'b:',t,ic(:,3),'r:',t,ic(:,5),'k:');
legend('Unregulated','negative Autoregulation', 'positive Autoregulation')
xlabel('Time (min)')
ylabel('mRNA Concentration (nM)')
title('Three different types of regulation')

%% Sensitivity Analysis

