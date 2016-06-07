%Name: Anand Sundaresan
%Problem3
clc;
close all ; 
clear all;
steps = 0.1;
F = [-1.3333 2 ; -1 0];G = [0.6666 ;1 ];
Qc = G*1*G';
m = [1;2];
P = [1 0 ; 0 2];
m_Array = m;
p_array(:,:,1) = P;
k = 2;
t = 0.1
while t < 5
    u =0;
    m_dot = F*m + G*u;
    m = m + m_dot*steps;
    P_dot = F*P+P*F'+Qc;
    P = P + P_dot*steps;
    m_Array = [m_Array m];
    p_array(:,:,k) = P;
    k = k+1;
    t = t + 0.1
end
time = linspace(0,5,51);
figure(1);
plot ( time, m_Array(1,:),'b.',time,m_Array(2,:),'r--');
xlabel('time');
ylabel('mean');
legend('first element','second element')
figure(2)
plot(time,squeeze(p_array(1,1,:)),'r:',time,squeeze(p_array(1,2,:)),'k-',time, squeeze(p_array(2,2,:)),'b-');
xlabel('time');
ylabel('covariance');
legend('P11 Element','P12 Element','P22 Element')