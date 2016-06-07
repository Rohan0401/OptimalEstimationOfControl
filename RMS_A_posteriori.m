clc;
clear;
close all;

F = 0.5; H = 1; Q = 1; R = 1; P0 = linspace(1,.5,1000);
Pk_plus = zeros(1,length(P0));
for i = 1:length(P0)
Pk_plus(i) = inv( inv(F*P0(i)*F + Q) + H*R*H  ); 
end
 Pss =0.511;
% plot(Pk_plus);
hold on
plot(Pss);
hold off;
grid on ;