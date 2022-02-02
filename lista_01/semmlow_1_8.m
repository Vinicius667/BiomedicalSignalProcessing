close all
clear variables
clc

% Hard-coded values
%--------------------------------------------------------
num_freqs = 1000;
min_freq = 2;
max_freq = 40;
f = 10;
N = 1000;
Ts = 0.001;
q_bits = [4,8,10,12]; % Quantization levels
%--------------------------------------------------------

% Variables 
%--------------------------------------------------------
t = (0:N-1)*Ts; % Time array
freqs = linspace(min_freq,max_freq,num_freqs); % Frequency array
As = zeros(1,num_freqs); % Amplitude array of the non quantized signal

As_q = zeros(length(q_bits),num_freqs); % Amplitude array of the quantized signals
%--------------------------------------------------------


for freq_idx = 1:num_freqs
	f = freqs(freq_idx); 
	input = sin(2*pi*f*t);
	output = analog_filter2(input);
	As(1,freq_idx) = max(output);
end

legends = ["Sinal original"];
for bit_idx = 1:length(q_bits)
	bit = q_bits(bit_idx);
	As_q(bit_idx,:) = quantization(As,bit);	
	legends(end + 1) = sprintf('Quantização n = %d bits',bit);
end

A_db = 20*log10(As);
A_q_db = 20*log10(As_q);


plot(freqs,A_db);
hold on
plot(freqs,A_q_db')
grid on
ylabel('Amplitude (dB)')
xlabel('Frequency (Hz)');
legend(legends)

[dummy_var, index_3db] = min(abs(A_db-(-3)));
text(freqs(index_3db),A_db(index_3db),strcat(' \leftarrow',sprintf('(%0.1f Hz,%0.1f dB)',freqs(index_3db),A_db(index_3db))),'FontSize',12);


fig = figure();
Q_noise = 20*log10(abs(As_q-As));
plot(freqs,Q_noise');
legends(1) = [];
grid on
ylabel('Amplitude (dB)')
xlabel('Frequency (Hz)');
legend(legends)

