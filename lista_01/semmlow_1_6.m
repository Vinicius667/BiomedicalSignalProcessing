close all
clear variables
clc
f = 4; %Frequency
N = 1000; %Number of points
Ts = 0.002; %Sample Time
bits = [4 8 12 16]; %Number of bits ADC
t = (0:N-1) * Ts; %Vector of time (Starts at 0s, ends at 1s)
signal_out = zeros(4,N); %Initializing a matrix that contains the output signals from ADC
error_signal = zeros(4,N); %Initializing a matrix that contains the error signals
q = zeros(1,4); %Initializing a vector that contains the quantization levels
max_min_errors = zeros(4,2); %Initalizing a matrix that contains the max and min values of the error signal

original_signal = sin(2*pi*f*t); %Sine wave

for ind=1:4
   signal_out(ind,:) = quantization(original_signal, bits(ind)); %Quantized signal
   error_signal(ind,:) = original_signal - signal_out(ind,:); %Calculates the error 
   q(ind) = 1/(2^bits(ind) - 1); %Calculates the quantization levels
   max_min_errors(ind,:) = [max(error_signal(ind,:)) min(error_signal(ind,:))]; %Calculates the max and min of the error signal 
   fprintf('%2d bits: Erro Máximo = %.7f | Erro Mínimo = %.7f | q = %.7f\n', bits(ind), max_min_errors(ind,1), max_min_errors(ind,2), q(ind)); %Displays the obatined results
end
