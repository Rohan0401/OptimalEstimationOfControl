%Prob 13(a)


clc;
close all;
clear;
kf=100;
R=1;
x=1;
xh_1=2;
xh_2=xh_1;
P=1;
xh_1Arr=[];
xh_2Arr=[];
for k=1:kf
    y=sqrt(x)*(1+randn(R));
    xh_1=((k-1)*xh_1+y^2)/k;
    yh=sqrt(xh_2);
    H=1/2/yh;
    M=yh;
    K=P*H'*inv(H*P*H'+M*R*M');
    xh_2=xh_2+K*(y-yh);
    P=(1-K*H)*P;
    xh_1Arr=[xh_1Arr xh_1];
    xh_2Arr=[xh_2Arr xh_2];
end
figure;
k=1:kf;
plot(k,xh_1Arr,'b',k,xh_2Arr,'g-');
xlabel('time step');ylabel('Estimation');legend('Normal filter','Kalman filter');