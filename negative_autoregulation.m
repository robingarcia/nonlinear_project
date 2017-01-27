%% Negative autoregulation
% Negative autoregulation (NAR) is one of the simplest network motifs in
% E.coli. In NAR a transcription factor (TF) represses its own
% transcription. 

%% Model class for NAR


% Definition of Parameters
%n = 1;
%K = 0.1;
%a = 1;
%b = 1;
%tspan = [0 5];
%X0=0;


% ODE NAR
%[t,X] = ode45(@(t,X) b*(1/(1+(X/K)^n))-a*X, tspan, X0);
%plot(t,X,'-o')
%title('Solution of negative autoregulation with ODE45');
%xlabel('Time t');
%ylabel('Solution X');

%% Three different models

%Definition of parameters
alpha_a = 0.375;
alpha_b = 0.5;          % Promotor strength
alpha_zero = 5e-4;
k = 0.116;              % Ribosome binding site (RBS)
delta = 5.78e-3;
gamma = 1.16e-3;
K = 1e4;
n = 2;
tspan = [0 800];
ma0=0;
mb0=0;
mc0=0;
%a0 = 0;
%b0 = 0;
%c0 = 0;

% Model class unregulated
[t,ma] = ode45(@(t,ma) alpha_b - (delta*ma), tspan, ma0);
%a0 = zeros(size(ma));
%[t,a] = ode45(@(t,a) k*ma - (gamma*a), tspan, a0);
%plot(t,ma,'-o')
%title('Solution of the unregulated model with ODE45');
%xlabel('Time t');
%ylabel('Solution X');

% Model class for negative autoregulation
[t,mb] = ode45(@(t,mb) ((alpha_b/(1+(mb/K)^n))+alpha_zero), tspan, mb0);
%plot(t,mb,'--')
%title('Solution of the unregulated model with ODE45');
%xlabel('Time t');
%ylabel('Solution X');

% Model class positive autoregulation
[t,mc] = ode45(@(t,mc) ((((alpha_a*(mc/K)^n)/(1+(mc/K)^n))+alpha_b)), tspan, mc0);
%plot(t,mc,'-o')
%title('Solution of the unregulated model with ODE45');
%xlabel('Time t');
%ylabel('Solution X');

% Plot them all
figure 
plot(t,ma,t,mb,'--',t,mc,':')
