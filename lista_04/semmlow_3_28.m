close all; clear variables; clc;
fs = 1000;
Ns = [64,512];
hnames = ["Rectangular",;
	"Blackman";
	"Hamming"];

count = 1;
for N = Ns
	[x,t] = sig_noise([200,300],-4,N);
	hs = [ones(1,N);
		blackman(N)';
		hamming(N)'];
	    f = (0:N-1)*fs/N;
	for i = 1:3
		subplot(2,3,count)
		x1 = x.*hs(i,:);
		X = fft(x1);
		X = 2*abs(X(1:N/2))/N;
		plot(f(1:N/2),X)
		count = count + 1;
		ylabel('Power Spectrum')
		xlabel("Time (s)");
		grid()
		title(sprintf('%s - N = %d',hnames(i),N))
	end


end

saveas(gcf,sprintf('%s.png',mfilename))
