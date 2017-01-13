%% Negative autoregulation
% Negative autoregulation (NAR) is one of the simplest network motifs in
% E.coli. In NAR a transcription factor (TF) represses its own
% transcription. 

% Model class for NAR


% Definition of Parameters
n = 1;
K = 0.1;
a = 1;
b = 1;
tspan = [0 3];
X0=0;


% ODE NAR
[t,X] = ode45(@(t,X) b*(1/(1+(X/K)^n))-a*X, tspan, X0);
plot(t,X,'-o')
title('Solution of negative autoregulation with ODE45');
xlabel('Time t');
ylabel('Solution X');
