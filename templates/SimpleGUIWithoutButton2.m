%% Simple GUI
function SimpleGUIWithoutButton2()
close all

% Make a large figure.
figure('position',[0 0 700 500], 'name', 'SimpleGUI', 'NumberTitle', 'off');

% Make subplot to hold plot.
h = subplot('position',[0.1 0.3 0.8 0.6]);

% Just some descriptive text.
uicontrol('Style', 'text', 'String', 'Parameter Value',...
'Position', [150 50 90 30]);

% A slider for varying the parameter.
uicontrol('Style', 'slider', 'Min',0,'Max', 10,...
'Position', [250 50 200 30],'Callback', @PlotGUI);

%% Called by SimpleGUI to do the plotting
% hObject is the slider and eventdata is unused.
function PlotGUI(hObject,eventdata)

% Gets the value of the parameter from the slider.
Param = get(hObject,'Value');

% Puts the value of the parameter on the GUI.
uicontrol('Style', 'text', 'String', num2str(Param),...
'Position', [460 55 60 20]);

% Plots the Graph.
x=linspace(0,10,1000);
K = Param;
[t,X] = ode45(@(t,X) b*(1/(1+(X/K)^n))-a*X, tspan, X0);
plot(t,X,'-o')
title('Solution of negative autoregulation with ODE45');
xlabel('Time t');
ylabel('Solution X');
