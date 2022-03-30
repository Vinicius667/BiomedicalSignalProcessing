close all; clear variables; clc;
load('correl1.mat') % load x and y signals
N = length(x); % Number of points
rxy_p = sum((x-mean(x)).*(y-mean(y))) / ((N-1)*sqrt(var(x)*var(y))); % Pearson correlation
% --------- Log Command Window text to file --------------------------
filename = sprintf('%s.txt',mfilename);
if exist(filename, 'file') ; delete(filename); end
diary(filename)
rxy_p
diary off
