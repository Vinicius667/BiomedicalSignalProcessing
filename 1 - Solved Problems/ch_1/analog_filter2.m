function output = analog_filter2(input)
%
% Simulated analog filter used in Problem 1.4
%
[b,a] = butter(4,0.05);
output = filter(b,a,input);

