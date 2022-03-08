close all; clear variables; clc;
fs = 500; % Sample frequency
N = 1000; % Construct 2 seconds worth of data
t = (0:N-1)/fs; % Time vector 0 to 2s
delta = 0.1;
fn = 2;
h1 = ((delta)/sqrt(1 - delta^2))   *exp(-delta*2*pi*fn*t).*  sin(2*pi*fn*t*sqrt(1 - delta^2));

x = rand(1,N); % Uniformly distributed random array
y = conv(x,h);
subplot(2,1,1);
plot(t,h); % Plot impulse response
title("Impulse response")
xlabel('Time (s)');
ylabel('h(t)');
grid();
subplot(2,1,2);
plot(t,y(1:N)); % Plot impulse response
title("Random signal response")
xlabel('Time (s)');
ylabel('y(t)');
grid();
saveas(gcf,sprintf('%s.png',mfilename))
