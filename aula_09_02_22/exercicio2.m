clear variables; close all; clc;

Fs = 1024; % sample frequency
Ts = 1/Fs; % sample time 
Tt = 1; % total time 
N = Fs*Tt; % number of samples 
w_nums = [3,16,32]; % Number os Walsh functions
num_iter = length(w_nums); % Number of iterations

for idx = (1:num_iter)
	w_num = w_nums(idx); % Number Walsh functions in the current iteration 
	subplot(num_iter,1,idx);  
	w_power2  = 2^nextpow2(w_num); % Find the next power of 2 
	repeat = Fs/w_power2; % Calculate how many times each element of the Walsh matrix will be repeated 
	aux_matrix = walshmatrix(w_power2);  % auxiliary matrix
	ws = repelem(aux_matrix(1:w_num,:),1,repeat); % Walsh matrix
	x = (0:N-1)*Ts; % time frequency
	fx = [x(1:N/2),0.8*ones(1,N/2)]; % original function 
	cks = sum((fx.*ws)')./sum((ws.^2)'); % coefficients 
	fx_w =  sum(cks' .* ws,1); % function approximation
	hold on
	plot(x,fx,'DisplayName','f(x) original');
	plot(x,fx_w,'DisplayName','f(x) approximation');
	xlabel('Time (s)');
	ylabel('Amplitude');
	title(sprintf('%d Walsh functions',w_num));
	grid;
	legend('Location','southeast');
	ylim([0,1]);
end
sgtitle('Function approximation using Walsh functions');
