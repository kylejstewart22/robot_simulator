function [eom] = eqsofmotion(R,N)
%Equations of Motion
%   Calculates the symbolic equations of motion for a robotic arm.

% Define symbolic variables
q = sym('q',[1 N]);
qd = sym('qd',[1 N]);
qdd = sym('qdd',[1 N]);
tau = sym('tau',[N 1]);
assume(q, 'real');
assume(qd, 'real');
assume(qdd, 'real');
assume(tau, 'real');

% Compute dynamics matrices
B = R.inertia(q);
C = R.coriolis(q,qd);
G = R.gravload(q);
F = R.friction(qd);

% Add dynamics matrices
E = simplify(B*qdd' + C*qd' + G' + F');

% Define equations of motion

for i = 1:N
    if i == 1
        eom = [char(E(i) == tau(i)) char(10) char(10)];
    else
        eom = [eom char(E(i) == tau(i)) char(10) char(10)]
    end
end

end

