close all; clear variables; clc;
N = 10000; % Number of points
data = zeros(1,N); % Data set
for i = 1:N
	data(1,i) = mean(rand(1,4)); % Evaluate segment mean
end
histogram(data,50); % Plot histogram
saveas(gcf,sprintf('%s.png',mfilename))
