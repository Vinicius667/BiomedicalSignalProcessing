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
xlabel('Time (s)');
ylabel('h(t)');
hold on
plot(t,y(1:N),'DisplayName','Random inputresponse'); % Plot the random input
plot(t,yr(1:N),'DisplayName','Step response'); % Plot the step input
%title('');
xlabel('Time');
ylabel('Amplitude');
legend('Orientation','horizontal','Box','on','Location','southoutside')
legend();
grid();
saveas(gcf,sprintf('%s.png',mfilename))

