close all; clear variables; clc;
figure(1)
% Questao 1 a)
N = 200;
Tt = 2;
Ts = Tt/N; % tempo de amostragem
t  = (0:N-1)*Ts; % vetor de tempo
%Bases
x0 = 1*t -1;
x1 = sawtooth(2*pi*1*t);
x2 = sawtooth(2*pi*2*t);
x3 = sawtooth(2*pi*4*t);

% Funcao y
y = zeros(1,N);
y(1:25) = 16*t(1:25) - 2;
y(26:50) = 2*ones(1,25);
y(51:100) = 8*t(1:50) -2;
y(101:200) = 2*t(1:100) -2;

%Plotar funcoes
grid()
subplot(3,2,1);
plot(t,x0,'LineWidth',2);
title('x0');
subplot(3,2,2);
plot(t,x1,'LineWidth',2);
title('x1');
subplot(3,2,3);
plot(t,x2,'LineWidth',2);
title('x2');
subplot(3,2,4);
plot(t,x3,'LineWidth',2);
title('x3');
subplot(3,2,[5,6]);
plot(t,y,'LineWidth',2);
title('y');

% Questao 1 b)
%Calcular coeficientes
a1 = sum(y.*x0)/(sum(x0.^2));
a2 = sum(y.*x1)/(sum(x1.^2));
a3 = sum(y.*x2)/(sum(x2.^2));
a4 = sum(y.*x3)/(sum(x3.^2));

% calcula função estimada
yest = a1.*x0 + a2.*x1 + a3.*x2 + a4.*x3;

figure(2)
%Questão 1 c)
hold on
plot(t,yest,'LineWidth',2,'DisplayName','yest(t)');
plot(t,y,'LineWidth',2,'DisplayName','y(t)');
grid();
legend('Orientation','horizontal','Box','on','Location','southoutside')
