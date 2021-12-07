function Arm = dhfunc(descriptor,d,a,alpha,theta,m,I,r,G,Jm,fv)

for i = 1:length(a)
    if (strcmp(descriptor(i),"Revolute"))
        LinkList(i) = Revolute('d', d(i), 'a', a(i), 'alpha', alpha(i));
    end
    if (strcmp(descriptor(i),"Prismatic"))
        LinkList(i) = Prismatic('theta', theta(i), 'a', a(i), 'alpha', alpha(i));
    end 
    LinkList(i).m = m(i);
    LinkList(i).I = [I(i,1:3); I(i,4:6); I(i,7:9)];
    LinkList(i).r = r(i,1:3);
    LinkList(i).G = G(i);
    LinkList(i).Jm = Jm(i);
    LInkList(i).B = fv(i);
end


Arm = SerialLink(LinkList, 'name', 'Arm'); 
Arm.teach()

end
%Make all the things have mass and moments of inertia