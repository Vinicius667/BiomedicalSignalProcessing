close all; clear variables; clc;
load prob2_33_data.mat
Fs = 500;
Ts = 1/Fs;
N = length(x);
t = (0:N-1)*Ts;
f = 50;
x = x';
y = sin(2*pi*f*t);
[rxy,lags] = xcorr(x-mean(x),y,'coeff'); % Cross-covariance
plot(lags,rxy,'DisplayName','Cross-covariance');
ylabel('Cross-covariance')
xlabel('Lags');
legend('Orientation','horizontal','Box','on','Location','southoutside')
%axis([-30 30 -0.2 1.2]);
grid()
saveas(gcf,sprintf('%s.png',mfilename))
[A,idx] = sort(rxy,'descend');
B = lags(idx);
[C,idx] = sort(B(1:30));
D = A(idx);
stem(C,D)
