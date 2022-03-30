close all; clear variables; clc;

fs = 500; % Sampling frequency
Tt = 1; % Total time
N = Tt*fs; % Determine N
f1 = 1/Tt; % Fundamental frequency
t = (1:N)/fs; % Time vector
x = zeros(1,N); 
x(1:N/2) = t(1:N/2); 
x(N/2:end-1) = 0.5 - t(1:N/2); % Construct waveform
% Fourier decomposition
a0 = 2*mean(x); % Calculate a(0)

for m = 1:6
 f(m) = m*f1; % Sinusoidal frequencies
 a= (2/N)*sum(x.*cos(2*pi*f(m)*t)); % Cosine coeff
 b = (2/N)*sum(x.*sin(2*pi*f(m)*t)); % Sine coeff
 X_mag(m) = sqrt(a^2 + b^2); % Magnitude spectrum
 X_phase(m) = -atan2(b,a); % Phase spectrum
end
x6 = zeros(1,N); % Reconstruct waveform with 6 components
for m = 1:6
 x6 = x6 + X_mag(m)*cos(2*pi*f(m)*t + X_phase(m)); % Eq. 3.15
end
x6 = x6 + a0/2; % Add in DC term
plot(t,x6,'r','DisplayName','Reconstructed signal','Linewidth',2); hold on;
plot(t,x,'b--','DisplayName','Original signal','Linewidth',2); % Plot reconstructed and original waveform
legend('Orientation','horizontal','Box','on','Location','southoutside')
title('Reconstruction with 6 components')
saveas(gcf,sprintf('%s.png',mfilename))
