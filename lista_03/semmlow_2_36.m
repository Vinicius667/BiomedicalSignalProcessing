clear variables; clc ; close all;
N = 512;
x = randn(1,N); % Generate random Gaussian noise
h = [1/3 1/3 1/3];
y = conv(x,h,'same');
[rxx,lagsx] = xcorr(x,'coeff');
[rxy,lagsy] = xcorr(y,'coeff');
subplot(2,1,1)
plot(lagsx,rxx);
title('$r_{yy}$','Interpreter','latex', 'Fontsize', 18)
grid()
ylabel('Autocorrelation')
xlabel('Lags');
axis([-20 20 -0.2 1.2]);
subplot(2,1,2)
plot(lagsy,rxy);
axis([-20 20 -0.2 1.2]);
grid()
title('$r_{yy}$','Interpreter','latex', 'Fontsize', 18)
ylabel('Autocorrelation')
xlabel('Lags');
