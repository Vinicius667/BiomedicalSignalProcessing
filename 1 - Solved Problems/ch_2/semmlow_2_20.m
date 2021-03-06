close all; clear variables; clc;
Ts = 0.01; % Sample interval
Tt = 3; % Total time
N = Tt/Ts; % Number of points
t = (0:N-1)*Ts; % Time vector
f = 1.5; % Frequency of both signals 
x = sin(2*pi*f*t); % Sine wave
y = cos(2*pi*f*t); % Cossine wave
rxy = sum(x.*y)/N; % Correlation
% --------- Log Command Window text to file --------------------------
filename = sprintf('%s.txt',mfilename);
if exist(filename, 'file') ; delete(filename); end
diary(filename)
rxy
diary off
