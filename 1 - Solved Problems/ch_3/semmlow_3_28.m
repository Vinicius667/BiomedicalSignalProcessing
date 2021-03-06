close all; clear variables; clc;
fs = 1000; % Sampling frequency 
Ns = [64,512]; % Vector of data lenghts 
hnames = ["Rectangular",;  % Name of filters
	"Blackman";
	"Hamming"];
count = 1;
for N = Ns
	[x,t] = sig_noise([200,300],-4,N); % Signal with noise
	hs = [ones(1,N);   % Vector of filters
		blackman(N)';
		hamming(N)'];
	    f = (0:N-1)*fs/N; % Frequency vector
	for i = 1:3
		subplot(2,3,count)
		x1 = x.*hs(i,:); % Apply filter to signal
		X = fft(x1);  % FFT of filtered signal
		X = 2*abs(X(1:N/2))/N;  % Amplitude espectrum
% ---------------- Plotting settings ----------------------------
		plot(f(1:N/2),X)
		count = count + 1;
		ylabel('Power Spectrum')
		xlabel("Time (s)");
		grid()
		title(sprintf('%s - N = %d',hnames(i),N))
	end
end
saveas(gcf,sprintf('%s.png',mfilename))
% ---------------------------------------------------------------
