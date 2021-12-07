function [heval,qval,posval,t] = impsim(Arm,Kp,Kd,Md,ksingle,dqIntial,ddqIntial,qIntial,heIntial,od,Rd,dod,wd,ddod,dwd,simt)

assignin('base','Arm', Arm)
assignin('base','Kp', Kp)
assignin('base','Kd', Kd)
assignin('base','Md', Md)
assignin('base','ksingle',ksingle)
assignin('base','dqIntial',dqIntial')
assignin('base','ddq',ddqIntial')
assignin('base','qIntial',qIntial')
assignin('base','heIntial',heIntial')
assignin('base','od',od')
assignin('base','dod',dod')
assignin('base','ddod',ddod')
assignin('base','Rd',Rd)
assignin('base','wd',wd')
assignin('base','dwd',dwd')

simulation = sim('MAE547Project_part5ModifiedToWorkWithSingularity',simt)

t = get(simulation, 'tout');

qdata = get(simulation, 'qvalues');

qval = qdata.data;

posdata = get(simulation, 'endeffectorpos');

posval = posdata.data;

hedata = get(simulation, 'hvalues');

heval = hedata.data;
qplot = squeeze(qval)
Arm.plot(qplot')
end