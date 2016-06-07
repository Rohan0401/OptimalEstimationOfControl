clc;
clear;
close all;

lambda = logspace(-3,3,100);

alpha = -((((lambda.^2) + (8.*lambda) - ((lambda +4).*(sqrt(lambda.^2+8.*lambda)))))./8);

 beta = ((lambda.^2 + 4.*lambda - ((lambda).*sqrt(lambda.^2+8.*lambda))))./4;

figure
 semilogx( alpha, lambda,'color',[1 0 0])
 ylim([0,1]);
 
 xlabel('lambda(in log)');
 ylabel('Alpha');

 figure(2)
 semilogx( beta, lambda,'color',[0 0 1])
 ylim([0,2]);

 xlabel('lambda(in log)');
 ylabel('Beta');



