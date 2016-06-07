
%Name : Rohan Singh Rajput
%Take Home Final Exam
%Problem No. 2

clc;clear;close all;


simulation= 4;Q_c = 2;R_c = 1;x = 0;x_Hat = 0;P = 0;k = 1;j = 1;e = 1;
x_Arr = x;
x_Hat_Arr = x_Hat;
Est_Err = 0;

% for t =0.2:0.2:simulation+0.2/10
t = 0.1;
while t < 5
    
    x = exp(-0.2)*x+sqrt(Q_c*0.2)*randn;
    x_Array(j) = x;
    j = j+1;
    y = x+sqrt(R_c/0.2)*randn;
    
    K = P*inv(R_c);
    x_hat_dot = -x_Hat + (y - x_Hat);
    x_Hat = x_hat_dot*0.2;
    x_hat_Array(e) = x_Hat;
    e = e+1;
    P_dot = -P^2 - 2*P + 2;
    P = P + P_dot*0.2;
    P_Array(k) = P;
    k = k+1;
    Est_Err = Est_Err + (x-x_Hat)^2;
    t = t + 0.2;
end

Est_Err = Est_Err/(4/0.2);
figure;
plot (P_Array);
xlabel('time');
ylabel('Co-variance')
title('Co-Variance Plot')
figure(2);
plot (x_Array,'r');
hold on
plot(x_hat_Array,'g');
legend('Original', 'Estimated');
xlabel('time')
ylabel('States')
title('Problem No. 2');
hold off;