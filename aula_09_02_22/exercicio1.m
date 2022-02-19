clear variables; close all; clc;
Fs = 1000; % sample frequency
Ts = 1/Fs; % sample time 
Tt = 1; % total time 
N = Fs*Tt; % number of samples 
o = ones(1,N); % vector of ones
w0  = o; % Walsh function 0
teste = w0;
w1 = [1*o(1:N/2),-1*o(1:N/2)]; % Walsh function 1
w2 = [1*o(1:N/4),-1*o(1:N/4),-1*o(1:N/4),1*o(1:N/4)]; % Walsh function 2
x = (0:N-1)*Ts; % time frequency
fx = [x(1:N/2),0.8*o(1:N/2)]; % original function 
ck1 = sum(fx.*w0)/(sum(w0.^2)); %coefficient 1
ck2 = sum(fx.*w1)/(sum(w1.^2)); %coefficient 2
ck3 = sum(fx.*w2)/(sum(w2.^2)); %coefficient 3
hold on
fx_w = ck1.*w0 + ck2.*w1 + ck3.*w2; % function approximation
plot(x,fx,'DisplayName','f(x) original');
plot(x,fx_w,'DisplayName','f(x) approximation');
xlabel('Time (s)');
ylabel('Amplitude');
title('Function approximation using 3 Walsh functions');
grid;
legend('Location','southeast');
sp1 = sum(w0.*w1)/N  %#ok<*NOPTS> %correlation between first and second Walsh functions
sp2 = sum(w1.*w2)/N %correlation between second and third Walsh functions
sp3 = sum(w2.*w0)/N  %correlation between first and third Walsh functions
len1 = sum(w0.*w0)/N  % Length of first Walsh function
len2 = sum(w1.*w1)/N  % Length of second Walsh function
len3 = sum(w2.*w2)/N  % Length of third Walsh function
