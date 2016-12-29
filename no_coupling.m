function no_coupling

data=load('m050410_16_1.dat');
dar=200;

    
data=sgolayfilt(data,2,21); % filter
[nr,nc]=size(data);  %  #rows , # columns
t=[0:nr-1]./dar; 
t=t';

fc=14;

figure(1)

g=subplot(2,2,1:2);

set(g,'fontsize',fc,'FontName', 'Arial');

curr1=data(:,1)/1.3;curr2=data(:,2)/1.29;curr3=data(:,3)/1.26;

gc=plot(t, curr1,'--k',t, curr2,'r',t,curr3,'b');
set(gc(1),'linewidth',2);%dashed line
set(gc(2),'linewidth',3);% thick line
set(gc(3),'linewidth',1);% thin line
xlabel('\itt \rm(s)','FontName','Arial');
ylabel('\iti \rm(mA)','FontName','Arial');
xlim([185 200]);ylim([0.1 0.45]);
    
for k=1:3
    
d=data(:,k)-mean(data(:,k));
h = hilbert(d); 
h=sgolayfilt(h,2,21);

p(:,k)=unwrap(angle(h(100:end-100)));

end

avg_current=[mean(curr1) mean(curr2) mean(curr3)]
Current=mean(avg_current)


p(:,1)=sgolayfilt(p(:,1),1,171);
p(:,2)=sgolayfilt(p(:,2),1,171);
p(:,3)=sgolayfilt(p(:,3),1,169);
p21=(p(:,2)-p(:,1));
p23=(p(:,2)-p(:,3));
p31=(p(:,3)-p(:,1));

t=(1:length(p(:,1)))/dar;

g=subplot(2,2,3);
set(g,'fontsize',fc,'FontName','Arial');
gc=plot(t,p21,'k',t,p23,'r',t,p31,'b');
set(gc,'linewidth',0.3);
ylabel('\Delta\phi \rm(rad)','FontName','Arial')
xlabel('\itt \rm(s)','FontName','Arial')
xlim([0 600]);
ylim([-90 125]);


g=subplot(2,2,4);
set(g,'fontsize',fc,'FontName','Arial');
d_phase=detrend(p);
gc=plot(t(1:400:end),d_phase(1:400:end,1),'--k',t(1:400:end),d_phase(1:400:end,2),'r',t(1:400:end),d_phase(1:400:end,3),'b');
set(gc(1),'linewidth',1.5);% dashed line
set(gc(2),'linewidth',1.5);%thick
set(gc(3),'linewidth',0.3);%thin


ylabel('\phi - 2\pi\omega\itt \rm(rad)','FontName','Arial')
xlabel('\itt \rm(s)','FontName','Arial')
xlim([0 600]);ylim([-7 7]);

fout=strcat('slide',num2str(k),'.tiff');
print('-dtiff','-r600', fout)
end



