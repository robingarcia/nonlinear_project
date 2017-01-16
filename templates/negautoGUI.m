%% Negative autoregulation with sliders
function negautoGUI()
close all

global Slider; %Define this to be global so subfunction can see slider

% Make a large figure.
figure('position',[0 0 700 500], 'name', 'SimpleGUI', 'NumberTitle', 'off');

% Make subplot to hold plot.
h = subplot('position',[0.1 0.3 0.8 0.6]);

% Just some descriptive text.
uicontrol('Style', 'text', 'String', 'Parameter Value n:',...
'Position', [150 50 90 30]);

% A slider for varying the parameter.
Slider = uicontrol('Style', 'slider', 'Min',0,'Max', 10,...
'Position', [250 50 200 30]);

% Just some descriptive text.
uicontrol('Style', 'text', 'String', 'Parameter Value K:',...
'Position', [150 30 90 30]);

% Just some descriptive text.
uicontrol('Style', 'text', 'String', 'Parameter Value a:',...
'Position', [150 70 90 30]);

% Just some descriptive text.
uicontrol('Style', 'text', 'String', 'Parameter Value b:',...
'Position', [150 90 90 30]);

% A button to run the sims.
Button = uicontrol('Style', 'pushbutton', 'String', 'Run',...
'Position', [530 50 100 30],'Callback', @PlotGUI);
