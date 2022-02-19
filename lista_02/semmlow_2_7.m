close all; clear variables; clc;

N = 1000;
TT = 0.25;
Ts = TT/N;
f = 1/TT;
t = (0:N-1)*Ts;
A = 1;
stw = A*sawtooth(2*pi*f*t );
stw_rms = sqrt(sum(stw.^2)/N);
stw_std = std(stw);

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
