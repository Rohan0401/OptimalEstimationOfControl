%Name : Anand Sundaresan
%Problem2
clc;
clear all;
close all;
simulation= 4;Q_c = 2;R_c = 1;x = 0;x_Hat = 0;P = 0;k = 1;j = 1;e = 1;
x_Arr = x;
x_Hat_Arr = x_Hat;
estimated_error = 0;
t = 0.1;
while t < 5
    
    x = exp(-0.2)*x+sqrt(Q_c*0.2)*randn;
    x_Array(j) = x;
    j = j+1;
    y = x+sqrt(R_c/0.2)*randn;
    K = P*inv(R_c);
    x_hat_dot = -x_Hat + (y - x_Hat);x_Hat = x_hat_dot*0.2;
    x_hat_Array(e) = x_Hat;
    e = e+1;p_dot = -P^2 - 2*P + 2;
    P = P + p_dot*0.2; p_array(k) = P;
    k = k+1;
    estimated_error = estimated_error + (x-x_Hat)^2;
    t = t + 0.2;
end

estimated_error = estimated_error/(20);
figure(1);
plot (p_array);
xlabel('time');ylabel('variance')
title('variance plot')
figure(2);
plot (x_Array,'r');
hold on
plot(x_hat_Array,'g');
legend('original value', 'estimated value');
xlabel('time')
ylabel('states')
hold off;