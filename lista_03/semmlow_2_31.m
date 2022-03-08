close all; clear variables; clc;
load bandwidths.mat
figure(1);
[rxx,lags] = xcorr(x,'coeff');
subplot(2,1,1);
plot(lags,rxx,'DisplayName','Narrowband signal');
ylabel('Autocorrelation')
xlabel('Lags');
legend('Orientation','horizontal','Box','on','Location','southoutside')
axis([-30 30 -0.2 1.2]);
grid();
[rxy,lags] = xcorr(y,'coeff');
subplot(2,1,2);
plot(lags,rxy,'DisplayName','Broadband signal');
ylabel('Autocorrelation')
xlabel('Lags');
legend('Orientation','horizontal','Box','on','Location','southoutside')
axis([-30 30 -0.2 1.2]);
grid()
saveas(gcf,sprintf('%s.png',mfilename))
