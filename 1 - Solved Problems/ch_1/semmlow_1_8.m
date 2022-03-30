close all
clear variables
clc


TT = 1; % total time
f1 = 5; % signal frequency 1
f2 = 2; % signal frequency 2
N = 1000; % number of samples
Ts1 = TT/N; % sample time 1
Ts2 = 1/7; % sample time 2

t1 = (0:N-1)*Ts1; % time vector  with a sample time of Ts1
t2 = (0:Ts2:TT); % time vector  with a sample time of Ts2
x1 = sin(2*pi*f1*t1); % signal 1 sampled at t1  points
plot(t1,x1,'DisplayName',sprintf('%d Hz signal - Fs = %.1f Hz',f1,Ts1^-1));
hold on

x2 = sin(2*pi*f1*t2); % signal 2 sampled at t2  points
plot(t2,x2,"*g",'DisplayName',sprintf('%d Hz signal - Fs = %.1f Hz',f1,Ts2^-1));

x3 = sin(2*pi*f2*t1+pi); % signal 3 sampled at t1  points
plot(t1,x3,'DisplayName',sprintf('%d Hz signal - Fs = %.1f Hz',f2,Ts1^-1));

legend('Orientation','horizontal','Box','on','Location','southoutside')
grid on
ylabel('Amplitude (Arbitrary unit)')
xlabel('Time (sec)');
title('Aliasing Effect');
