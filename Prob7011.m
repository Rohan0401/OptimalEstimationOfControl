%Problem 7.11


clc;
close all;
clear;
lamda=logspace(-3,3,100);
alpha=-1/8* (lamda.^2+8*lamda-(lamda+4).*sqrt(lamda.^2+8*lamda));
beta=1/4*(lamda.^2+4*lamda-lamda.*sqrt(lamda.^2+8*lamda));
semilogx(lamda,alpha,lamda,beta,'r');
xlabel('lamda'); grid on;
legend('Alpha','Beta')