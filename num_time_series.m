function num_time_series


data=load('m042210_1.dat');

data=data(:,1);
dar=100;

[nr,nc]=size(data);  %  #rows , # columns
t=[0:nr-1]./dar; 
t=t';

fc=14;
figure(1)

g=subplot(2,2,1)
set(g,'fontsize',14,'FontName', 'Arial');

curr=data(:,1)/(1000*0.02); ;% analogus current (mA) =potential(V)/resistant (1kohms)

plot(t, curr,'k','linewidth',2);
xlabel('\itt','FontName','Arial');
ylabel('\ite','FontName','Arial');
xlim([183 250]);
ylim([1.77 1.83]);
    
d=data-mean(data);
h = hilbert(d); 


g=subplot(2,2,2); 
set(g,'fontsize',fc,'FontName','Arial');
plot(h(30000:90000),'-k','linewidth',0.000001);
dat(8)='-';
ylabel('\itH','FontName','Arial')
xlabel('\ite - <\ite>','FontName','Arial')
xlim([-0.6 0.35]);ylim([-0.8 0.2]);


p(:,1)=unwrap(angle(h(1000:end-1000)));
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
ylabel('\phi - 2\pi\omega\itt','FontName','Arial')
xlabel('\itt','FontName','Arial')
xlim([0 6000]);ylim([-1 1]);

g=subplot(2,2,4);
set(g,'fontsize',fc,'FontName','Arial');
pd(p,dar,20);
xlim([0 300]);ylim([0.05 0.25]);
xlabel('\tau','fontsize',14,'FontName','Arial')
ylabel('\sigma^2','fontsize',14,'FontName','Arial')

end



