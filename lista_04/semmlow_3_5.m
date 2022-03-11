close all; clear variables; clc;
fs = 1024;
N = 1024;
t = (0:N-1)/fs;
Tt = N/fs;
fsig = 2;
x =  0.5*sawtooth(2*pi*fsig*t);
X = 2*fft(x)/N;
Phase = unwrap(angle(X));
X_mag = abs(X);
f1 = 1/Tt;
f = (0:N-1)*f1;
c = 100;
xr = zeros(1,N);
xr = xr + X_mag(1)/2;
for m = 2:c
	xr = xr + X_mag(m)*cos(2*pi*f(m)*t + Phase(m));
end

hold on
plot(t,x,'k','DisplayName','Original signal');
plot(t,xr,'b','DisplayName','Reconstructed signal');
ylabel('x(t)')
xlabel('Time (s)');

legend('Orientation','horizontal','Box','on','Location','southoutside')
title('Reconstruction of signal using 24 components')
grid()
saveas(gcf,sprintf('%s.png',mfilename));
