%Name : Anand Sundaresan
%Problem1
clc;
close all;
clear all;
%Initalization
fi_value = 0.9;
q = [ 1 0 ; 0 0.0001];
 time_taken = 100;
 x = 1;
 P = eye(2);
 x_hat = [0 0]';
 x_hatarr = [];
 t = 1;
 
 while t <= 100
     x = fi_value*x +sqrt(q(1,1))*randn;
     y = x;
     
     F = [x_hat(2) x_hat(1) ; 0 1];
     P = F*P*F' + q;
     x_hat(1) = x_hat(2)*x_hat(1);
     x_hat(2) = x_hat(2);
     
     H = [1 0];
     K = P*H'*inv(H*P*H');
     x_hat = x_hat+K*(y-x_hat(1));
     P = (eye(2)-K*H)*P;
     x_hatarr = [x_hatarr x_hat];
     t = t + 1;
 end
 t = 1:100;
 figure;
 plot(t,fi_value*ones(100),'r',t,x_hatarr(2,:),'b');
 legend('Oiginal value','Estimated value');
 xlabel('step time input');
 ylabel('estimation');
 
 
     