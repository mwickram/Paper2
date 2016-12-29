function Y=koper(t,X)

global V;
global R;
global Rc;
global cd   ; % different oscillator cause by this;

d=0.11913;

E=X(1:3:end);
u=X(2:3:end);
w=X(3:3:end);


Coupling(1)=E(2)-E(1);
Coupling(2)=E(1)-E(2)+E(3)-E(2);
Coupling(3)=E(2)-E(3);



for k=1:3

[rate]=koper_rate(E(k));


curr = (V-E(k))/R;      
  
Y((k-1)*3+1)=1/cd(k)*(curr-120*rate*u(k) + 1/Rc*Coupling(k));

Y((k-1)*3+2)=-1.25*sqrt(d)*rate*u(k) + 2*d*(w(k)-u(k));

Y((k-1)*3+3)= 1.6*d*(2-3*w(k)+u(k));

end


Y=Y';
