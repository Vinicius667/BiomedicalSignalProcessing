close all
clear variables
clc
f = 4; %Frequency
N = 1000; %Number of points
Ts = 0.002; %Sample time
bits = [4 8 10 12]; %Bits ADC
t = (0:N-1) * Ts; %Time vector (Ts as sample time, N number of points)
signal_in = sin(2*pi*f*t); %Input of ADC
signal_out = zeros(4,N); %Initializing a matrix that contains the output signals from ADC
noise_signal = zeros(4,N); %Initializing a matrix that contains the noise signal
q = zeros(1,4); %Initializing a matrix that contains the quantization levels
theoretical = zeros(1,4); %Theoretical error
q_noise = zeros(1,4); %Experimental error (Var)

for ind=1:4
   signal_out(ind,:) = quantization(signal_in, bits(ind)); %Calculates the quantized signal
   noise_signal(ind,:) = signal_out(ind,:) - signal_in; %Calculates the error
   q(ind) = 1/(2^bits(ind) - 1); %calculates the quantization levels
   q_noise(ind) = var(noise_signal(ind,:)); %Calculates the experimental error
   theoretical(ind) = (q(ind)^2)/12; %Calculates the theoretical error
   disp(sprintf('%2d bits: Erro Teorico = %.5e | Erro Experimental = %.5e', bits(ind), theoretical(ind), q_noise(ind)));
end
