%Question number 7.10
clc;
clear;
close all;
Q=1;Qv=1;v=0;x_not=0;x=x_not;xhatw_not=0;xhat_w=xhatw_not;xhatc=[xhatw_not;0];Pw=(-7+sqrt(65))/2;Kw=Pw/Qv;
F=[1/2 0;0 1/2];
H=[1 1];
P_Minus=dare(F',H',[Q 0; 0 Qv],0);
Kc=P_Minus*H'*inv(H*P_Minus*H');
Err_White=[];Err_Color=[];xhat_White=[];xhat_Color=[];x_Value=[];
kf=2000;
for k=1:kf
    w=randn;
    x=x/2+sqrt(Q)*w;
    v=v/2+sqrt(Qv)*randn;
    y=x+v;
    xhat_w=xhat_w/2+Kw*(y-xhat_w/2);
    xhatc=F*xhatc;
    xhatc=xhatc+Kc*(y-H*xhatc);
    Err_White=[Err_White x-xhat_w]; Err_Color=[Err_Color x-xhatc(1)];xhat_White=[xhat_White xhat_w];xhat_Color=[xhat_Color xhatc];
    x_Value=[x_Value x];
end
Err2wAve=norm(Err_White,2)^2/length(Err_White);
disp(['While noise :',num2str(Err2wAve)]);
Err2cAve=norm(Err_Color,2)^2/length(Err_Color);
disp(['Color Noise :',num2str(Err2cAve)]);
Ee2w=(1-Kw)^2*Q+Kw^2*4*Qv/3;
Ee2w=Ee2w+Kw*(1-Kw)*2*Kw*Qv/3;
Ee2w=Ee2w/(1-(1-Kw)^2/4);
disp(['White Filter :',num2str(Ee2w)]);
Pcplus=P_Minus-Kc*H*P_Minus;
disp(['Color Filter :',num2str(Pcplus(1,1))]);
k=1:kf;
plot(k,x_Value,'k',k,xhat_White,'b',k,xhat_Color,'g');
legend('original','white noise','colored noise');
figure;
plot(k,Err_White,'k',k,Err_Color,'b')
legend('white noise','colored noise');