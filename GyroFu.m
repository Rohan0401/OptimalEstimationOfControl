% Question 8.13
%Rohan Singh Rajput
clc;clear;close all;
SSFlag = true ; 
A = [ 0 1 ; 0 0 ];C = [ 1 0];q = 2;Q = [ 0 0 ; 0 q];
R = 3;dt = 0.01;tf = 10;

x = [0;0];
xhat = x;
P = [ 1 0 ; 0 1];

xErr = x;

xhatErr = xhat;
k = 1;
PErr(:,:,k) = P;

Pss = [ sqrt(2*R^(3/2)*q^(1/2)) sqrt(R*q) ; sqrt(R*q) sqrt(2*R^(1/2)*q^(3/2))];

Kss = Pss*C'*inv(R);

[v,d]  = eig([q*dt 0 ; 0 R/dt]);

for t = dt : dt : tf + dt/10
    noise = v *sqrt(d)*rand(2,1);
    
    xdot = A*x + sqrt(Q*dt)*randn(size(x));
    xdot = A*x + noise(1);
    
    x = x + xdot*dt;
    y = C*x + sqrt(R/dt)*randn;
    y = C*x + noise(2);
    
    if SSFlag
        K = Kss;
        Pdot = A*P + P*A' - P*C'*inv(R)*C*P + Q;
    end
    
    xhatdot = A*xhat +  K*(y - C*xhat);
    xhat = xhat + xhatdot*dt;
    P = P + Pdot*dt;
    xErr = [xErr x];
    xhatErr = [xhatErr xhat];
    
    k = k+1;
    
    PErr(:,:,k) = P;
end

t = 0:dt:tf + dt/10;
plot(t,xErr(1,:),'r',t,xhatErr(1,:),'b');
xlabel('time');grid on;legend('orginal', 'estimated');

figure;
plot( t,squeeze(PErr(1,1,:)),'k',t,squeeze(PErr(2,2,:)),'r',t,squeeze(PErr(1,2,:)),'b');
xlabel('time');grid on;legend('P(1,1)','P(2,2)', 'P(1,2)');

