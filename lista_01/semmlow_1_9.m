close all
clear variables
clc

% Hard-coded values
%--------------------------------------------------------
TT = 1;
f1 = 5;
N = 1000;
Ts2 = 1/9;
%--------------------------------------------------------

% Variables 
%--------------------------------------------------------
Ts1 = TT/N;
t1 = (0:N-1)*Ts1;
t2 = (0:Ts2:TT);
x1 = sin(2*pi*f1*t1);
f2 = abs(f1 - 1/Ts2);
%--------------------------------------------------------
plot(t1,x1,'DisplayName',sprintf('%d Hz signal - Fs = %.1f Hz',f1,Ts1^-1));
hold on

x2 = sin(2*pi*f1*t2);
plot(t2,x2,"*g",'DisplayName',sprintf('%d Hz signal - Fs = %.1f Hz',f1,Ts2^-1));

x3 = sin(2*pi*f2*t1+pi);
plot(t1,x3,'DisplayName',sprintf('%d Hz signal - Fs = %.1f Hz',f2,Ts1^-1));

legend('Orientation','horizontal','Box','on','Location','southoutside')
grid on
ylabel('Amplitude (Arbitrary unit)')
xlabel('Time (sec)');
