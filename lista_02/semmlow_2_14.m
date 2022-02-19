close all; clear variables; clc;

N = 10000;
data = zeros(1,N);
for i = 1:N
	data(1,i) = mean(rand(1,4));
end


histogram(data,50);
