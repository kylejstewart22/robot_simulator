clear
clc

% descriptor = ["Revolute";"Revolute";"Revolute"];
% d = [0; 0; 0];
% a = [4; 3; 2];
% alpha = [0; 0; 0];
% theta = [0; 0; 0];
% m = [5; 5; 5];
% I =[0.027885975200000,  -0.000188219930000,  -0.00030096398000, -0.000188219930000,   0.020787492980000,   0.002076757620000, -0.000300963980000,   0.002076757620000,   0.011752094190000];
% I = [I; I; I];
% r = [.5, 0, 0; .5, 0, 0; .5, 0, 0];
% G = [1; 1; 1];
% Jm = [0; 0; 0];
% Fc = [0; 0; 0];
% Fv = [0; 0; 0];
descriptor = ["Revolute";"Revolute";"Revolute";"Revolute";"Revolute";"Revolute"];
a = [0;1;0;0;0;1];
alpha = [pi/2;0;pi/2;pi/2;-pi/2;0];
d = [2;0;0;2;0;0];
theta = [0;0;0;0;0;0];
m = [5;5;5;5;5;5];
I = [0.027885975200000,  -0.000188219930000,  -0.00030096398000, -0.000188219930000,   0.020787492980000,   0.002076757620000, -0.000300963980000,   0.002076757620000,   0.011752094190000];

I = [I;I;I;I;I;I];
r = [-0.01168    0.13118   0.0046];
%r = [r;r;r]
r = [r;r;r;r;r;r]
G = [1;1;1;1;1;1];
Jm = [0;0;0;0;0;0];
Fv = [0;0;0;0;0;0];

Arm = dhfunc(descriptor,d,a,alpha,theta,m,I,r,G,Jm, Fv);
Arm.gravity = [0 0 1];

ksingle = 0.5;

freq = 10;
damp = 2;

kp = freq^2;
kd = 2*damp*freq;
% kp = 1;
% kd = .1;
md = .1;
% dqIntial = [0,0,0];
% qIntial = [0,0,0];
dqIntial = [0,0,0,0,0,0];
qIntial = [1,0,1,0,1,0];
ddq = [0,0,0,0,0,0];
heIntial = [0;0;0;0;0;0];
Kp = eye(6)*kp;
Kd = eye(6)*kd;
Md = eye(6)*md;
% Kp = eye(6)*kp;
% Kd = eye(6)*kd;
od = [4; 1; 5];
Rd = [0.9364 -0.2667 -0.2281; 0.1622 -0.2476 0.9552  ;-0.3112 -0.9314 -0.1886];    

% od = [2;3;0];
% Rd = [1 0 0; 0 1 0; 0 0 1];

dod = [0; 0; 0];
wd = [0; 0; 0];
ddod = [0; 0; 0];
dwd = [0; 0; 0];
simt = 2;


[heval,qval,posval,t] = impsim(Arm,Kp,Kd,Md,ksingle,dqIntial,qIntial,heIntial,od,Rd,dod,wd,ddod,dwd,simt)


qplot = squeeze(qval);
Arm.plot(qplot')

