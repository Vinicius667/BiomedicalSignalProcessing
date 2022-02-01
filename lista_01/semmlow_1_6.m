close all
clear globals
clc
num_bits = [4,8,12,16];

TT = 1;
f = 4;
Ts = 0.002;
N = 1000;
t = (0:N-1)*Ts;
signal_in = sin(2*pi*f.*t); 
disp('Quantization Noise')
fprintf('|%s|%s|%s|\n',pad('Bits',15,'both'),pad('Emperical',15,'both'),pad('Theoretical',15,'both'));
for bits = num_bits
	signal_out = quantization(signal_in,bits);
	noise_signal = signal_out - signal_in; 
	q_noise = var(noise_signal); 
	q = 1/(2^bits - 1); 
	theoretical = (q^2)/12; 
	fprintf('|%s|%s|%s|\n',pad(string(bits),15,'both'),pad(string(q_noise),15,'both'),pad(string(theoretical),15,'both')); 
end
