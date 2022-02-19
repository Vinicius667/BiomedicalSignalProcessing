close all; clear variables; clc;
N = 1000; % Number of points
TT = 1;  % Total time
Ts = TT/N; % Sample interval
f = 1/0.5; % Signal frequency
t = (0:N-1)*Ts;  % Time vector
A = 1; % Signal amplitude
stw = A*sawtooth(2*pi*f*t ); % Sawtooth wave
stw_rms = sqrt(sum(stw.^2)/N); % RMS value of sawtooth wave
stw_std = std(stw); %Standard deviation of sawtooth wave
% ------------- Graph plotting --------------------------
hold on
plot(t,stw,'DisplayName','Sawtooth wave')
yline(stw_rms,'r--','DisplayName',sprintf('RMS = %.2f V',stw_rms))
yline(stw_std,'b--','DisplayName',sprintf('STD = %.2f V',stw_std))
ylabel('Amplitude (V)')
xlabel('Time (sec)');
ylim([-1.1*A,1.1*A])
legend('Orientation','horizontal','Box','on','Location','southoutside')
title('RMS value of a sawtooth wave')
legend
saveas(gcf,sprintf('%s.png',mfilename))
