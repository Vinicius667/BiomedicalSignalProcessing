clear variables; clc ; close all;
load Hr_med; % Load meditation HR data
Ts = t_med(2) - t_med(1); % Calculates sample period
[cov_pre,lags_pre] = axcor(hr_med - mean(hr_med)); % Auto-covariance
% ------------- Graph plotting --------------------------
hold on
plot(lags_pre*Ts,cov_pre,'k'); hold on; 
axis([-30 30 -0.2 1.2]);
ylabel('$r_{xy}$','Interpreter','latex', 'Fontsize', 18)
xlabel('Lags (sec)');
title('Normal autocovariance')
grid
saveas(gcf,sprintf('%s.png',mfilename))
