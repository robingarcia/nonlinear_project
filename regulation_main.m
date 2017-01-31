%% Negative autoregulation

tspan = [0 1200]; %timespan

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
[t, Y] = ode45(@func_negative, tspan, IC, [], delta, gamma, alpha_b, alpha_o, k, K, n); % negative
[t, Z] = ode45(@func_positive, tspan, IC, [], delta, gamma, alpha_b, alpha_a, k, K, n); % positive

%Fill up with zeros X
z = length(Y);  % Determine length 
[p, q] = size(X) % Determine size
old_X = X; % original vector
new_X = zeros(z,2);
new_X(1:p, 1:2) = old_X; % Overlap the original matrix in the new matrix

%Fill up with zeros Z
z = length(Y);  % Determine length 
[p, q] = size(Z); % Determine size
old_Z = Z; % original vector
new_Z = zeros(z,2);
new_Z(1:p, 1:2) = old_Z; % Overlap the original matrix in the new matrix

%Fill up with zeros t
z = length(Y);  % Determine length 
[p, q] = size(t); % Determine size
old_t = t; % original vector
new_t = zeros(z,1);
new_t(1:p) = old_t; % Overlap the original matrix in the new matrix

plot(new_t,new_X(:,2), Y(:,2),new_Z(:,2)); 
legend('mRNA','Protein A')
xlabel('Time')
ylabel('Protein A Concentration')
title('Negative Autoregulation')
