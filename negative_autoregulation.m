%% Negative autoregulation
% Negative autoregulation (NAR) is one of the simplest network motifs in
% E.coli. In NAR a transcription factor (TF) represses its own
% transcription. 

% Model class for NAR


% Parameters with IC
n = 1;
K = 0.1;
a = 1;
b = 1;

% ODE NAR
X = sym('X');
t = sym('t');
dX/dt = b*(1/(1+(X/K)^n))-a*X;
