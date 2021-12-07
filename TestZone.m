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
a = [2;2;2;2;2;2];
alpha = [0;0;0;0;0;0];
d = [0;0;0;0;0;0];
theta = [0;0;0;0;0;0];
m = [1;1;1;1;1;1];
I = [1,  0,  0, 0,   1,   0, 0,   0,   1];
% I(4:6,1:3) = I(1:3,1:3);
% I(7:9,1:3) = I(1:3,1:3);
% I(10:12,1:3) = I(1:3,1:3);
% I(13:15,1:3) = I(1:3,1:3);
% I(16:18,1:3) = I(1:3,1:3);
I = [I;I;I;I;I;I];
r = [1 0 0];
r = [r;r;r;r;r;r]
G = [1;0;1;0;1;1];
Jm = [0;0;0;0;0;0];
Fv = [0;1;0;1;0;0];

Arm = dhfunc(descriptor,d,a,alpha,theta,m,I,r,G,Jm, Fv);
Arm.gravity = [0 0 9.810];


%Above need to be done

%Below can be added
freq = 10;
damp = 10;

% kp = freq^2;
% kd = 2*damp*freq;
kp = 1;
kd = 1;
Kp = eye(6)*kp;
Kd = eye(6)*kd;
%dqIntial = [0,0,0];
qdintial = [0,0,0,0,0,0];
%qIntial = [0,0,0];
qintial = [0,0,0,0,0,0];
Od = [1 0 0 1; 0 1 0 2; 0 0 1 3; 0 0 0 1];
Simt = 10;
N = length(qintial)

[heval, qval, posval,t] = pdsim(Arm,Kp,Kd,qdintial,qintial,Od,Simt,N)

qplot = squeeze(qval)

Arm.plot(qplot')