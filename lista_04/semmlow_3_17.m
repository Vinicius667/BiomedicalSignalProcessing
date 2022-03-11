close all; clear variables; clc;
load short.mat
fs = 1;
N = length(x);
N2 = 256;
Xmag = abs(fft(x));
x2 = [x zeros(1,N2-N)];
Xmag2 = abs(fft(x2));
f = (0:N-1)*fs/N;
f2 = (0:N2-1)*fs/N2;
hold on
plot(f,Xmag,'DisplayName','No padding');
plot(f2,Xmag2,'DisplayName','With padding');
%title('Interpolation of spectrum using padding')
ylabel('Magnitude Spectrum')
xlabel('Frequency (Hz)');
grid()
legend('Orientation','vertical','Box','on','Location','southoutside')
saveas(gcf,sprintf('%s.png',mfilename))
