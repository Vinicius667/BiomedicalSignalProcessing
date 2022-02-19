close all; clear variables; clc;

N = 500;
TT = 0.2;
Ts = TT/N;
t = (0:N-1)*Ts;
A = 1;
sqw = A*square(2*pi*(1/TT)*t);

sqw_rms = sqrt(sum(sqw.^2)/N);

hold on
plot(t,sqw,'DisplayName','Square wave')
yline(sqw_rms,'r--','DisplayName',sprintf('RMS = %.1f V',sqw_rms))
ylabel('Amplitude (V)')
xlabel('Time (sec)');
ylim([-1.1*A,1.1*A])
legend('Orientation','horizontal','Box','on','Location','southoutside')
title('RMS value of a square wave')
legend
