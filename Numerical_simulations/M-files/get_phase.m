function phased=get_phase(dat,dar,enum,row,erow,div)

sdir=dat(1:7);
Data=strcat(sdir,'\',dat);

data1=load(Data);

n=1;
for k=1:enum
    
data=data1(:,k);
d=data-mean(data);

h=hilbert(d);


fc=14;

figure(k)

g=subplot(2,2,1); 
set(g,'fontsize',fc,'FontName','Arial');
plot(h(row:end-erow),'-k','linewidth',0.5);

datt=strcat(sdir,'\',dat(8:end));
title([datt ' ' 'Electrode' num2str(k)])
ylabel('d\itH \rm/d\itt \rm(mA/s)','FontName','Arial')
xlabel('d\iti \rm/d\itt \rm(mA/s)','FontName','Arial')
grid


p=unwrap(angle(h(row:end-erow)));
t=(1:length(p))/dar;
disp(dat)

g=subplot(2,2,2);
set(g,'fontsize',fc,'FontName','Arial');


plot(t,p,'k','linewidth',2);
ylabel('\phi (rad)','FontName','Arial');
xlabel('\itt \rm(s)','FontName','Arial');
%title('Phase Vs Time');
xlim([0 t(end)])

%finding frequency
T=[0:length(p)-1]'./dar;
Fr=polyfit(T,p,1);
Freq=Fr(1)./(2*pi)
Period=1/Freq;
Nperiod=round(Period*dar)

g=mod(Nperiod,2);
if g==0
Nperiod= Nperiod + 1;
end

p=sgolayfilt(p,1,Nperiod);

g=subplot(2,2,3);


set(g,'fontsize',fc,'FontName','Arial');
plot(t,detrend(p),'k','linewidth',0.5);
ylabel('\phi - \omega\itt \rm(rad)','FontName','Arial')
xlabel('\itt \rm(s)','FontName','Arial')
xlim([0 t(end)])
%title('Detrended Phase')

g=subplot(2,2,4);
set(g,'fontsize',fc,'FontName','Arial');
phased(1,n:n+2)=pd(p,dar,div);
n=n+3;
%xlim([0 2500])

%fout=strcat(dat,'_pd_',num2str(k),'.tiff');
%print('-dtiff','-r300', fout)
%close
end

end




