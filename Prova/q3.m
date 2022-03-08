close all; clear variables; clc;

% Questao 3 a)
load hrv25.mat
figure(1)
hrv25 = hrv25'; 
Fs = 2.5; % Frequencia de amostragem
Ts = 1 / Fs; % Tempo de amostragem 
N = length(hrv25); % Amostras
t = (0:N-1)*Ts; % vetor de tempo
plot(t,hrv25);
axis([0 t(end) min(hrv25) max(hrv25)]); % Área de plotagem
title('Taxa de batimento cardíaco');
ylabel('BPM')
xlabel('Tempo (s)');
grid();


figure(2)
% Questao 3 b)
[cov,lags] = axcor(hrv25 - mean(hrv25)); % Cálculo da autocovariância 
plot(lags,cov);
lags = Ts*lags; % Convertendo de amostra para segundos
axis([lags(1) lags(end) min(cov) max(cov)]); % Área de plotagem
grid();
title('Autocovariância');
ylabel('Autocovariância')
xlabel('Lag (s)');
