close all; clear variables; clc;
x = load('data_c1.mat').x; % Signal
xd = detrend(x); % Detrended signal
t = 1:1000; % Time vector
variance = zeros(2,4); % Variance vector
avg =  zeros(2,4); % Avarage vector
for k = 1:4 % Segment signal into 4 segments
m = 250*(k-1) + 1; % Index of first segment sample
segment = x(m:m + 249); % Extract segment of original signal
avg(1,k) = mean(segment); % Evaluate segment mean of original signal
variance(1,k) = var(segment); % and segment variance of original signal
segment = xd(m:m + 249); % Extract segment of detrended signal
avg(2,k) = mean(segment); % Evaluate segment mean of detrended signal
variance(2,k) = var(segment); % and segment variance of detrended signal
end
% ------------- Graph plotting --------------------------
hold on 
plot(t,x,'DisplayName','Nonstationary signal');
plot(t,xd,'DisplayName','Detrended signal');
ylabel('Amplitude')
xlabel('Samples');
legend('Orientation','horizontal','Box','on','Location','southoutside')
title('Detrend operator')
legend
saveas(gcf,sprintf('%s.png',mfilename))
% --------- Log Command Window text to file --------------------------
filename = sprintf('%s.txt',mfilename);
if exist(filename, 'file') ; delete(filename); end
diary(filename)
avg
variance
diary off
