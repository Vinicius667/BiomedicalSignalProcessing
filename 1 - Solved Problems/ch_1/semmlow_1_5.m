close all
clear variables
clc

intervals = [0.05,0.01,0.001]; %vector of intervals 
num_plots = length(intervals); % number of plots
TT = 1; % total time
f = 2; % signal frequency
for idx = 1:num_plots 
	subplot(num_plots,1,idx);
	Ts = intervals(idx); % sample time
	t = 0:Ts:TT; % time vector
	x = sin(2*pi*f.*t);  
	plot(t,x); %line plot
	hold on
	plot(t,x,'.k'); %scatter plot
	xlabel('Time (sec)'); 
	ylabel(sprintf('x[k] - Ts = %s',string(Ts)));
	legend('Line graph','Scatter plot','Location','best')
end
sgtitle('2 Hz signal plotted with different sample times (Ts)')
saveas(gcf,'semmlow_1_5.png');
