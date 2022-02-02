close all
clear variables
clc

intervals = [0.05,0.01,0.001];
num_plots = length(intervals);
TT = 1;
f = 2;
for idx = 1:num_plots
	subplot(num_plots,1,idx);
	Ts = intervals(idx);
	t = 0:Ts:TT;
	x = sin(2*pi*f.*t); 
	plot(t,x);
	hold on
	plot(t,x,'.k');
	xlabel('Time (sec)'); 
	ylabel(sprintf('x[k] - Ts = %s',string(Ts)));
	legend('Line graph','Scatter plot','Location','best')
end
sgtitle('2 Hz signal plotted with different sample times (Ts)')
saveas(gcf,'semmlow_1_5.png');
