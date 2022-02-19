close all; clear variables; clc;
x = load('data_c1.mat');
x = x.x;
xd = detrend(x);
t = 1:1000;


variance = zeros(2,4);
avg =  zeros(2,4);
for k = 1:4 % Segment signal into 4 segments
m = 250*(k-1) + 1; % Index of first segment sample
segment = x(m:m + 249); % Extract segment
avg(1,k) = mean(segment); % Evaluate segment mean
variance(1,k) = var(segment); % and segment variance
segment = xd(m:m + 249); % Extract segment
avg(2,k) = mean(segment); % Evaluate segment mean
variance(2,k) = var(segment); % and segment variance
end

hold on 
plot(t,x,'DisplayName','Nonstationary signal');
plot(t,xd,'DisplayName','Detrended signal');
ylabel('Amplitude')
xlabel('Samples');
legend('Orientation','horizontal','Box','on','Location','southoutside')
title('Detrend operator')
legend
