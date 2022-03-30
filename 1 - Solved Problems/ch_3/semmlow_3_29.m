close all; clear variables; clc;
fs = 1000; % Sampling frequency 
N = 512; % Data lenght
hb = blackman(N)'; % Blackman-Harris filter
figure('Position',[0 0 600 1600])

hnames = ["Rectangular",; % Name of filters
	"Blackman";
	"Hamming"];
count = 1;
for j = 1:3
	[x,t] = sig_noise([280,300],-10,N); % Signal with noise
	hs = [ones(1,N);   % Vector of filters
		blackman(N)';
		hamming(N)'];
	    f = (0:N-1)*fs/N;   % Frequency vector
	for i = 1:3
		subplot(3,3,count)
		x1 = x.*hs(i,:); % Apply filter to signal
		X = fft(x1);   % FFT of filtered signal
		X = 2*abs(X(1:N/2))/N;   % Amplitude espectrum
% ---------------- Plotting settings ----------------------------
		plot(f(1:N/2),X)
		count = count + 1;
		ylabel('Power Spectrum')
		xlabel("Frequency (Hz)");
		grid()
		title(sprintf('%s',hnames(i)))
		xlim([0 f(N/2)])
	end
end
saveas(gcf,sprintf('%s.png',mfilename))
% ---------------------------------------------------------------
