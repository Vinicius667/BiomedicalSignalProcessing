close all; clear variables; clc;
N = 512;
fs = 200;
x = randn(1,N); % Generate random Gaussian noise
h = [1/3 1/3 1/3];
y = conv(x,h,'full');
t = (0:N-1);
hold on
f = (0:N-1)*fs/N;
X = fft(x);
X_mag = 2*abs(X(1:N/2))/N;
Y = fft(y);
Y_mag = 2*abs(Y(1:N/2))/N;
subplot(2,1,1)
hold on;
plot(f(1:N/2),X_mag,'DisplayName','Unfiltered signal');
plot(f(1:N/2),Y_mag,'DisplayName','Filtered signal');
legend('Orientation','horizontal','Box','on','Location','southoutside')
ylabel('Magnitude Spectrum')
xlabel('Frequency (Hz)');
grid()
subplot(2,1,2)
Psx = abs(X.^2)/length(x);
Psy = abs(Y.^2)/length(y);
hold on;
plot(f(1:N/2),Psx(1:N/2),'DisplayName','Unfiltered signal');
plot(f(1:N/2),Psy(1:N/2),'DisplayName','Filtered signal');
legend('Orientation','horizontal','Box','on','Location','southoutside')
ylabel('Power Spectrum')
xlabel('Frequency (Hz)');
grid()
saveas(gcf,sprintf('%s.png',mfilename))
