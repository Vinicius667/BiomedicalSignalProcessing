close all; clear variables; clc;
load pulses.mat
Tt = 1;
f1 = 1/Tt;
fs = 500;
N = length(x1);
f = (0:N-1)*f1;
t = (0:N-1)/fs;
figure(1)
hold on
plot(t,x1,'DisplayName','x1');
plot(t,x2,'DisplayName','x2');
plot(t,x3,'DisplayName','x3');
legend('Orientation','horizontal','Box','on','Location','southoutside')
xlabel('Time (s)');
ylabel('Amplitude');
grid()
axis([0 t(end) 1.2*min(x1) 1.2*max(x1)]);
title('Signals')
saveas(gcf,'semmlow_3_11_1.png');


figure(2)
xs = [x1;x2;x3];
Xs = 2*fft(xs)/N;
X_mags = abs(Xs);
Phase = 180*unwrap(angle(Xs))/pi;
subplot(2,1,1)
hold on;
for i = 1:3
	plot(f(1:N/2),X_mags(i,(1:N/2)),'DisplayName',sprintf('x%d',i))
	
end
legend()
title('Magnitude spectrum')
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid();
subplot(2,1,2)
hold on
for i = 1:3
	plot(f(1:N/2),Phase(i,1:N/2),'DisplayName',sprintf('x%d',i))
end
title('Phase Spectrum')
xlabel('Frequency (Hz)');
ylabel('Angle (deg)');
legend()
grid();
saveas(gcf,'semmlow_3_11_2.png');
