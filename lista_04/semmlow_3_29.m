close all; clear variables; clc;
fs = 1000;
N = 512;
hb = blackman(N)';
hb = blackman(N)';
figure('Position',[0 0 600 1600])

hnames = ["Rectangular",;
	"Blackman";
	"Hamming"];

count = 1;
for j = 1:3
	[x,t] = sig_noise([280,300],-10,N);
	hs = [ones(1,N);
		blackman(N)';
		hamming(N)'];
	    f = (0:N-1)*fs/N;
	for i = 1:3
		subplot(3,3,count)
		x1 = x.*hs(i,:);
		X = fft(x1);
		X = 2*abs(X(1:N/2))/N;
		plot(f(1:N/2),X)
		count = count + 1;
		ylabel('Power Spectrum')
		xlabel("Time (s)");
		grid()
		title(sprintf('%s',hnames(i)))
		xlim([0 f(N/2)])
	end


end

saveas(gcf,sprintf('%s.png',mfilename))
