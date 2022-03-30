function output = analog_filter1(input)
%
% Simulated analog filter used in Problem 1.3
%
[b,a] = butter(4,.02,'High');
[b1,a1] = butter(2,0.12);
input = filter(b1,a1,input);
output = filter(b,a,input);

