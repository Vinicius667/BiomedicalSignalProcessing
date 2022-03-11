close all; clear variables; clc;
fs = 1000;
N = 64;
f1 = 200;
f2 = 300;
[x t] = sig_noise([f1,f2],-3,N);
Xb = fft(x.*blackman(N)');
Xr = fft(x);
Xb_mag = 2*abs(Xb(1:N/2)/N);
Xr_mag = 2*abs(Xr(1:N/2)/N);
f = (0:N-1)*fs/N;
subplot(2,1,1)
hold on
plot(f(1:N/2),Xb_mag,'DisplayName','Blackman-Harris');
plot(f(1:N/2),Xr_mag,'DisplayName','Rectangular');
legend('Orientation','horizontal','Box','on','Location','southoutside')
ylabel('Magnitude Spectrum')
xlabel('Frequency (Hz)');
grid()
subplot(2,1,2)
scale_factor = N/sum(blackman(N));
hold on
Xb = fft(scale_factor*x.*blackman(N)');
Xr = fft(x);
Xb_mag = 2*abs(Xb(1:N/2)/N);
Xr_mag = 2*abs(Xr(1:N/2)/N);
plot(f(1:N/2),Xb_mag,'DisplayName','Blackman-Harris');
plot(f(1:N/2),Xr_mag,'DisplayName','Rectangular');
legend('Orientation','horizontal','Box','on','Location','southoutside')
ylabel('Magnitude Spectrum')
xlabel('Frequency (Hz)');
grid()
saveas(gcf,sprintf('%s.png',mfilename))
