% Questao 1 a)
close all; clear variables; clc;
Ts = 1; %hora
K = 1;  % dosagem
N = 24; % amostras
xn = K*ones(1,N); 
ns = (0:N-1); % vetor de amostras
pn = xn .* (5*K*(1-0.6*((0.5).^ns) - (0.25*(0.2.^ns))));

subplot(3,1,1);
plot(ns,pn);
grid();
title('Resposta ao degrau');
ylabel('p[n]')
xlabel('Amostras (n)');

% Questao 1 b)
subplot(3,1,2);
hn  = gradient(pn);
plot(ns,hn);
title('Resposta ao impulso');
ylabel('h[n]')
xlabel('Amostras (n)');
grid();


% Questao 1 c)
subplot(3,1,3);
K = 4; % dosagem
xn = K .* repmat([1,0,0,0],1,6); % doses a cada 4 horas
y = conv(xn,hn); % convolução para obter resposta
plot(ns,y(1:N));
grid();
title('Resposta ao trem de pulsos');
ylabel('y[n]')
xlabel('Amostras (n)');

