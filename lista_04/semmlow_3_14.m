close all; clear variables; clc;
N = 512;
fs = 1000;
f = (0:N-1)*fs/N;
t = (0:N-1)/fs;
x1 = sin(2*pi*200*t) + sin(2*pi*400*t);
x2 = sin(2*pi*200*t) + sin(2*pi*900*t);
X1 = fft(x1);
X2 = fft(x2);
X1_abs = 2*abs(X1)/N;
X2_abs = 2*abs(X2)/N;
hold on
plot(f(1:N/2),X1_abs(1:N/2),'DisplayName','200 Hz and 400 Hz sinusoids')
plot(f(1:N/2),X2_abs(1:N/2),'--','DisplayName','200 Hz and 900 Hz sinusoids')
legend('Orientation','vertical','Box','on','Location','southoutside')
title('Demonstration of aliasing effect')
ylabel('Magnitude Spectrum')
xlabel('Frequency (Hz)');
grid()
saveas(gcf,sprintf('%s.png',mfilename))
