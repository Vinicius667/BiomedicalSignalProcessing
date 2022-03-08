close all; clear variables; clc;
Fs = 500; % Sample frequency
Tt = 5; % Total time
N = Tt*Fs; % Number of samples
t = (0:N-1)/Fs; % Time vector 
tau = 1; % Time constant
h = exp(-t./tau); % Impulse response
x = rand(1,N); % Uniformly distributed random array
xr = ones(1,N);
y = conv(x,h); % Output (convolution)
yr = conv(xr,h); % Get output (convolution)
subplot(1,2,1);
plot(t,h); % Plot impulse response
title('Impulse response');
xlabel('Time (s)');
ylabel('h(t)');
grid();
subplot(1,2,2);
plot(t,y(1:N),t,yr(1:N)); % Plot the random input
title('Random input response');
xlabel('Time (s)');
ylabel('y(t)');
grid();
saveas(gcf,sprintf('%s.png',mfilename))

