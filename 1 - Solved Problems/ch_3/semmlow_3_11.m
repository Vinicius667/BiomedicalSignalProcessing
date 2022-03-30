close all; clear variables; clc;
load pulses.mat
% Corrigir espectro
Tt = 1; % Total time
f1 = 1/Tt; % fundamental frequency
fs = 500;  % Sampling frequency
N = length(x1);  % Data length
f = (0:N-1)*f1;  % Frequency vector
t = (0:N-1)/fs;  % Time vector

% ---------------- Plotting settings ----------------------------
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
% ---------------------------------------------------------------
figure(2)
subplot(2,1,1)
hold on;
xs = [x1;x2;x3];  % Signals vector
for i = 1:3
	Xs(i,:) = 2*fft(xs(i,:))/N; %  FFTs of the 3 signals
	X_mags(i,:) = abs(Xs(i,:)); % % Magnitude spectra of the 3 signals  
	Phase(i,:) = 180*unwrap(angle(Xs(i,:)))/pi; % Phase spectra of the 3 signals  
	plot(f(1:N/2),X_mags(i,(1:N/2)),'DisplayName',sprintf('x%d',i)) % Plot magnitude spectrum
end
% ---------------- Plotting settings ----------------------------
legend()
title('Magnitude spectrum')
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid();
subplot(2,1,2)
hold on
for i = 1:3
	plot(f(1:N/2),Phase(i,1:N/2),'DisplayName',sprintf('x%d',i)) % Plot phase spectrum
end
title('Phase Spectrum')
xlabel('Frequency (Hz)');
ylabel('Angle (deg)');
legend()
grid();
saveas(gcf,'semmlow_3_11_2.png');
% ---------------------------------------------------------------
