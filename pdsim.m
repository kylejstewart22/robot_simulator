function [heval,qplot,posval,t] = pdsim(Arm,Kp,Kd,qdintial,qintial,Od,Simt,N)

assignin('base','Arm', Arm)
assignin('base','Kp', Kp)
assignin('base','Kd', Kd)
assignin('base','qdintial',qdintial')
assignin('base','qintial',qintial')
assignin('base','Od',Od)
assignin('base','Simt',Simt)
assignin('base','N',N)

simulation = sim('PDControllerModifiedToWork',Simt)

t = get(simulation, 'tout');

qdata = get(simulation, 'qvalues');

qval = qdata.data;

posdata = get(simulation, 'endeffectorpos');

posval = posdata.data

hedata = get(simulation, 'hvalues');

heval = hedata.data;
qplot = squeeze(qval)
assignin('base','qplot',qplot)
assignin('base','PDtime',t)
Arm.plot(qplot')
end




