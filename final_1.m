
%Name : Rohan Singh Rajput
%Take Home Final Exam
%Problem No. 1


clc;close all;clear;
%Initalization
Phi_Value = 0.9;
Q_Matrix = [ 1 0 ; 0 0.0001];
 time_taken = 100;
 x = 1;
 P_Matrix = eye(2);
 x_Hat = [0 0]';
 x_Hat_Arr = [];
 t = 1;
 
 while t <= 100
     x = Phi_Value*x +sqrt(Q_Matrix(1,1))*randn;
     y = x;
     
     F = [x_Hat(2) x_Hat(1) ; 0 1];
     P_Matrix = F*P_Matrix*F' + Q_Matrix;
     x_Hat(1) = x_Hat(2)*x_Hat(1);
     x_Hat(2) = x_Hat(2);
     
     H = [1 0];
     K = P_Matrix*H'*inv(H*P_Matrix*H');
     x_Hat = x_Hat+K*(y-x_Hat(1));
     P_Matrix = (eye(2)-K*H)*P_Matrix;
     
     x_Hat_Arr = [x_Hat_Arr x_Hat];
     t = t + 1;
 end
 
 t = 1:100;
 
 figure;
 plot(t,Phi_Value*ones(100),'r-',t,x_Hat_Arr(2,:),'b');
 legend('true','estimated');
 xlabel('Time Steps');
 ylabel('Estimation');
 title('Problem No 1')
 
     