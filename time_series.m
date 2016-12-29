function time_series

data=load('m102408_1.dat');


data=data(:,1);
dar=200;

data=sgolayfilt(data,2,21); % filter
[nr,nc]=size(data);  %  #rows , # columns
t=[0:nr-1]./dar; 
t=t';

d=data-mean(data);

fc=14;
figure(1)


curr=data(:,1)/1 ;% current (mA) =potential(V)/resistant (1kohms)
current=mean(curr)

g=subplot(2,2,1); 
set(g,'fontsize',fc,'FontName','Arial');
plot(t, curr,'k','linewidth',2);
xlabel('\itt \rm(s)','FontName','Arial');
ylabel('\iti \rm(mA)','FontName','Arial');
xlim([183 200]);ylim([0.1 0.45]);


h = hilbert(d); 
h=sgolayfilt(h,2,21);
h=h-0.05;

g=subplot(2,2,2); 
set(g,'fontsize',fc,'FontName','Arial');
plot(h(30000:45000),'-k','linewidth',0.000001);
dat(8)='-';
ylabel('\itH \rm(mA)','FontName','Arial')
xlabel('\iti - < \iti\rm > \rm(mA)','FontName','Arial')
xlim([-0.18 0.15]);ylim([-0.2 0.15]);


p(:,1)=unwrap(angle(h(100:end-100)));
t=(1:length(p(:,1)))/dar;
disp(dat)

T=[0:length(p)-1]'./dar;
Fr=polyfit(T,p,1);
Freq=Fr(1)./(2*pi)
Period=1/Freq;
Nperiod=round(Period*dar)

g=mod(Nperiod,2)
if g==0
Nperiod= Nperiod + 1
end

p=sgolayfilt(p,1,Nperiod);

g=subplot(2,2,3);
set(g,'fontsize',fc,'FontName','Arial');
plot(t(1:400:end),detrend(p(1:400:end)),'k','linewidth',0.3);
ylabel('\phi - 2\pi\omega\itt \rm(rad)','FontName','Arial')
xlabel('\itt \rm(s)','FontName','Arial')
xlim([0 1500]);ylim([-6 4]);

g=subplot(2,2,4);
set(g,'fontsize',fc,'FontName','Arial');
pd(p,dar,25);
xlim([0 60]);ylim([0 1]);
xlabel('\tau \rm(s)','fontsize',14,'FontName','Arial')
ylabel('\sigma^2 (rad^2)','fontsize',14,'FontName','Arial')
end



