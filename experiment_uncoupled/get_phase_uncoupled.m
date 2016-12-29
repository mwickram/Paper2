function phased=get_phase_uncoupled

enum=3;
dar=200;
dat='m050410';

data1=load('m050410_16.dat');
tstart=1300;
nlength=600;
nstartdata=tstart*dar;
nend=nstartdata+nlength*dar;
data1=data1(nstartdata:nend,:);
length(data1);
data1=sgolayfilt(data1,2,21);

n=1;
for k=1:enum
    
data=data1(:,k);
d=data-mean(data);

h=hilbert(d);
h=sgolayfilt(h,2,21);
h=h-0.05+0*(i);

fc=14;

figure(k)

g=subplot(2,2,1); 
set(g,'fontsize',fc,'FontName','Arial');
plot(h(100:end-100),'-k','linewidth',0.5);

dat=strcat('m050410\_16.dat');
title([dat ' ' 'Electrode' num2str(k)])
ylabel('d\itH \rm/d\itt \rm(mA/s)','FontName','Arial')
xlabel('d\iti \rm/d\itt \rm(mA/s)','FontName','Arial')
grid


p=unwrap(angle(h(100:end-100)));
t=(1:length(p))/dar;
disp('m050410_16')

T=[0:length(p)-1]'./dar;
Fr=polyfit(T,p,1);
Freq=Fr(1)./(2*pi)
Period=1/Freq;
Nperiod=round(Period*dar);

g=mod(Nperiod,2);
if g==0
Nperiod= Nperiod + 1
end

p=sgolayfilt(p,1,Nperiod);

g=subplot(2,2,2);
set(g,'fontsize',fc,'FontName','Arial');
plot(t,p,'k','linewidth',2);
ylabel('\phi (rad)','FontName','Arial');
xlabel('\itt \rm(s)','FontName','Arial');
%title('Phase Vs Time');
xlim([0 t(end)])

g=subplot(2,2,3);
set(g,'fontsize',fc,'FontName','Arial');
plot(t,detrend(p),'k','linewidth',0.5);
ylabel('\phi - \omega\itt \rm(rad)','FontName','Arial')
xlabel('\itt \rm(s)','FontName','Arial')
xlim([0 t(end)])
%title('Detrended Phase')

g=subplot(2,2,4);
set(g,'fontsize',fc,'FontName','Arial');
phased(1,n:n+2)=pd(p,dar,10);
n=n+3;
%xlim([0 2500])


fout=strcat('m050410_16','_pd_',num2str(k),'.tiff');
print('-dtiff','-r300', fout)
close
end


end




