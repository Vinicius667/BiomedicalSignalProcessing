close all; clear variables; clc;

% Example 3.1 Use Fourier series analysis to generate the magnitude and
% phase plots of the ECG signal.
%
fs = 50; % Sample frequency
load eeg_data; % Get data (vector eeg)
N = length(eeg); % Get N
Tt = N/fs; % Calculate total time
f1 = 1/Tt; % Calculate fundamental frequency
t = (1:N)/fs; % Time vector for plotting
for m = 1:N
 f(m) = m*f1; % Sinusoidal frequencies
 a = sum(eeg.*cos(2*pi*f(m)*t)); % Cosine coeff., Eq. 3.3
 b = sum(eeg.*sin(2*pi*f(m)*t)); % Sine coeff., Eq. 3.4
 X_mag(m) = sqrt(a^2 + b^2); % Magnitude spectrum Eq. 3.6
 X_phase(m) = -atan2(b,a); % Phase spectrum, Eq. 3.7
end
X_phase = unwrap(X_phase); % Compensates for shifts > pi
X_phase = X_phase*360/(2*pi); % Convert phase to deg.
subplot(2,1,1);  
plot(f,X_mag,'k'); % Plot magnitude spectrum
xlabel('Time (s)')
ylabel('EEG')
subplot(2,1,2);
plot(f,X_phase,'k'); % Plot phase spectrum
xlabel('Frequency (Hz)')
ylabel('Magnitude Spectrum')
saveas(gcf,sprintf('%s.png',mfilename))
