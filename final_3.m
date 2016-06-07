%Name : Rohan Singh Rajput
%Take Home Final Exam
%Problem No. 3


clc;close all ; clear;


steps = 0.1;
F = [-1.3333 2 ; -1 0];
G = [0.6666 ;1 ];
Q_c = G*1*G';

m = [1;2];
P = [1 0 ; 0 2];

m_Array = m;
P_Array(:,:,1) = P;

k = 2;
t = 0.1
% for t = step_size:step_size:simulation+step_size/10
while t < 5
    u =0;
    m_dot = F*m + G*u;
    m = m + m_dot*steps;
    P_dot = F*P+P*F'+Q_c;
    P = P + P_dot*steps;
    m_Array = [m_Array m];
    P_Array(:,:,k) = P;
    k = k+1;
    t = t + 0.1
end


time = linspace(0,5,51);

figure;


plot ( time, m_Array(1,:),'b.',time,m_Array(2,:),'r--');
xlabel('time');
ylabel('Mean value');
title('Problem 3')
legend('Frist Element','Second Element')


figure(2)
plot(time,squeeze(P_Array(1,1,:)),'r:',time,squeeze(P_Array(1,2,:)),'k-',time, squeeze(P_Array(2,2,:)),'b-');
xlabel('time');
ylabel('Co-variance value');
legend('P11 Element','P12 Element','P22 Element')