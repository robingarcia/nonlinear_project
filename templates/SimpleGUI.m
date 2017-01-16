%% Simple GUI
function SimpleGUI()
close all

global Slider; %Define this to be global so subfunction can see slider

% Make a large figure.
figure('position',[0 0 700 500], 'name', 'SimpleGUI', 'NumberTitle', 'off');

% Make subplot to hold plot.
h = subplot('position',[0.1 0.3 0.8 0.6]);

% Just some descriptive text.
uicontrol('Style', 'text', 'String', 'Parameter Value',...
'Position', [150 50 90 30]);

% A slider for varying the parameter.
Slider = uicontrol('Style', 'slider', 'Min',0,'Max', 10,...
'Position', [250 50 200 30]);

% A button to run the sims.
Button = uicontrol('Style', 'pushbutton', 'String', 'Run',...
'Position', [530 50 100 30],'Callback', @PlotGUI);

%% Called by SimpeGUI to do the plotting
% hObject is the button and eventdata is unused.
function PlotGUI(hObject,eventdata)
global Slider;% Slider is a handle to the slider.

% Gets the value of the parameter from the slider.
Param = get(Slider,'Value');

% Puts the value of the parameter on the GUI.
uicontrol('Style', 'text', 'String', num2str(Param),...
'Position', [460 55 60 20]);

% Plots the Graph.
x=linspace(0,10,1000);
k = Param;
y = sin(k*x);
plot(x,y);
