function [time, q,qd,qdd] = simdyn(Arm,t,q0,qd0,T)
% Dynamics Simulation
%   Plots the position, velocity, and accelerations of the joints

% Dynamics Simulations
[time,q,qd] = Arm.fdyn(t,@torqfun,q0,qd0,T)

for i = 1:length(q')
    Torque(i,:) = T;
end
qdd = Arm.accel(q,qd,Torque);

% Torque function
function tau=torqfun(robot,t,q,qd,T)
    tau=T;
end

end

