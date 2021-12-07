% Dynamics Simulation
%   Plots the position, velocity, and accelerations of the joints

clear
clc
descriptor = ["Revolute";"Revolute";"Revolute"];
d = [0; 0; 0];
a = [1; 1; 1];
alpha = [0; 0; 0];
theta = [0; 0; 0];
m = [5; 5; 5];
I =[0.027885975200000,  -0.000188219930000,  -0.00030096398000, -0.000188219930000,   0.020787492980000,   0.002076757620000, -0.000300963980000,   0.002076757620000,   0.011752094190000];
I = [I; I; I];
r = [.5, 0, 0; .5, 0, 0; .5, 0, 0];
G = [10; 10; 10];
Jm = [1; 1; 1];
fv = [1; 1; 1];

Arm = dhfunc(descriptor,d,a,alpha,theta,m,I,r,G,Jm,fv);
t = 1;

% Dynamics Simulation
%   Plots the position, velocity, and accelerations of the joints
q0 = [0, 0, 0];
qd0 = [0, 0, 0];
T = [0, 0, 0];
% Dynamics Simulations
[time,q,qd] = Arm.fdyn(t,@torqfun,q0,qd0,T);

% Plotting variables
figure(1)
fig1 = figure(1);
plot(time,q)
title('Joint Position vs. Time')
xlabel('Time [sec]')
ylabel('Joint Angles [deg]')

figure(2)
fig2 = figure(2);
plot(time,qd)
title('Joint Velocities vs. Time')
xlabel('Time [sec]')
ylabel('Joint Velocities [rad/s]')

% Find qdd
for i = 1:length(q)
    Torque(i,:) = T;
end
qdd = Arm.accel(q,qd,Torque);

figure(3)
fig3 = figure(3);
plot(time,qdd)
title('Joint Accelerations vs. Time')
xlabel('Time [sec]')
ylabel('Joint Accelerations [rad/s]')

% Torque function
function tau=torqfun(robot,t,q,qd,T)
    tau=T;
end

