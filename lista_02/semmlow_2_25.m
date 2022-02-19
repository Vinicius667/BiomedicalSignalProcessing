close all; clear variables; clc;
Ts = 0.002; % Sample interval
N = 500; % Number of points
t = (0:N-1)*Ts; % Time vector
A = 1; % Signal amplitude
f = 1; % Frequency of both signals 
cw = A*cos(2*pi*f*t); % Sine wave
sqw = A*square(2*pi*f*t); % Cossine wave
rxy_p = sum((cw-mean(cw)).*(sqw-mean(sqw))) / ((N-1)*sqrt(var(cw)*var(sqw))); % Pearson correlation
% ------------- Graph plotting --------------------------
hold on
plot(t,sqw,'DisplayName','Square wave')
plot(t,cw,'DisplayName','Cossine wave')
ylabel('Amplitude (V)')
xlabel('Time (sec)');
ylim([-1.1*A,1.1*A])
legend('Orientation','horizontal','Box','on','Location','southoutside')
title('RMS value of a square wave')
legend
saveas(gcf,sprintf('%s.png',mfilename))
% --------- Log Command Window text to file --------------------------
filename = sprintf('%s.txt',mfilename);
if exist(filename, 'file') ; delete(filename); end
diary(filename)
rxy_p
diary off
