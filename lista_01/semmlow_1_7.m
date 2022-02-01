close all
clear globals
clc
num_freqs = 1000;
freqs = linspace(2,50,num_freqs);
As = zeros(1,num_freqs);
f = 10;
N = 1000;
Ts = 0.001;
t = (0:N-1)*Ts;

for i = 1:num_freqs
	f = freqs(i);
	input = sin(2*pi*f*t);
	output = analog_filter2(input);
	As(1,i) = max(output);
end
A_db = 20*log10(As);
[diff_3db, index_3db] = min(abs(A_db-(-3)));
plot(freqs,A_db);
arrow = annotation("textarrow",'String',sprintf('(%0.0f Hz,%0.0f dB)',freqs(index_3db),A_db(index_3db)));
arrow.Parent = gca;
arrow.Position = [freqs(index_3db),A_db(index_3db)+3,0,-3] ;


