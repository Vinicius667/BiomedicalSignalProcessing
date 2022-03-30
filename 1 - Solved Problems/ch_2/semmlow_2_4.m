close all; clear variables; clc;
N = 500; % Number of points
TT = 0.2; % Total time
Ts = TT/N; % Sample interval
t = (0:N-1)*Ts; % Time vector
A = 1; % Signal amplitude
sqw = A*square(2*pi*(1/TT)*t); % Square wave
sqw_rms = sqrt(sum(sqw.^2)/N); % RMS value of square wave
% ------------- Graph plotting --------------------------
hold on
plot(t,sqw,'DisplayName','Square wave')
yline(sqw_rms,'r--','DisplayName',sprintf('RMS = %.1f V',sqw_rms))
ylabel('Amplitude (V)')
xlabel('Time (sec)');
ylim([-1.1*A,1.1*A])
legend('Orientation','horizontal','Box','on','Location','southoutside')
title('RMS value of a square wave')
legend
saveas(gcf,sprintf('%s.png',mfilename))

