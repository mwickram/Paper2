
function [psd]=phase_difference

enum=3;
dar=200;
dat='m050410_16';
sdir=dat(1:7);
data1=load('m050410_16.dat');
length(data1)
tstart=1300;
nlength=600;
nstartdata=tstart*dar;
nend=nstartdata+nlength*dar;
data1=data1(nstartdata:nend,:);
data1=sgolayfilt(data1,2,21);



for k=1:enum % enum= Number of electrodes
data=data1(1:end,k);
d=data-mean(data);

h=hilbert(d);%for simple Oscillations and phase coherent chaos
h=sgolayfilt(h,2,21);
h = h -0.05 + 0*(i);

unp=unwrap(angle(h(100:end-100)));

T=[0:length(unp)-1]'./dar;
Fr=polyfit(T,unp,1);
Freq=Fr(1)./(2*pi);
Period=1/Freq;
Nperiod=round(Period*dar)
g=mod(Nperiod,2);

if g==0
Nperiod=Nperiod+1;
end

p(:,k)=sgolayfilt(unp,1,Nperiod);

end

t=[1:length(p(:,1))]/dar;


switch enum

    case 2
        pdd=p(:,1)-p(:,2);
        ind_l=[{'1,2'}];
     
    case 3
         pdd1=p(:,1)-p(:,2);pdd2=p(:,2)-p(:,3);pdd3=p(:,1)-p(:,3);
         pdd=[pdd1 pdd2 pdd3];
         ind_l={'1,2', '2,3','3,1'};
         
end


n=1;    

for f=1:enum
    

p1=detrend(pdd(:,f));
np=length(p1);
ml=floor(np/10);
NTAU=[200:1:ml];
l=length(NTAU);

for k=1:l
D(k)=pd_std(p1,NTAU(k));
end

D=D(1:end);
NTAU= NTAU(1:end);

subplot(2,2,1)
plot(t,abs(pdd(:,f)))
xlabel('t (s)');ylabel('|\Delta\phi_l_,_m|')
datt=strcat('m050410\_16.dat');
tl1=title([datt ind_l(f)]); 
set(tl1,'fontsize',12);
xlim([0 t(end)])

subplot(2,2,2)

plot(t,p1);
ylabel('\phi_l_m - \Omegat(rad)')
xlabel('t (s)')
title('Detrended Phase')
xlim([0 t(end)])


polf=polyfit(NTAU/dar,D,1);
fitpd=polyval(polf,NTAU/dar);
disp(['D_from_phase_differece',' ',num2str(polf(1)/2)])
psd1=polf(1)/2;

X=NTAU'/dar;
X=[X,ones(length(X),1)];
[Npolf,Epolf]=regress(D',X);
disp('confidence interval of D_k_l')
disp('Lower  Upper')
Epolf=Epolf(1,:)./2
disp('Range of confidence interval')
diff(Epolf)

subplot(2,2,3)

g=plot(NTAU/dar,D,NTAU/dar,fitpd,'r');

set(g(2), 'linewidth',2)
title(['D=1/2\times d(\sigma^2)/dt','=',  num2str(polf(1)/2)]);
xlabel('t (s)')
ylabel('\sigma^2 (rad^2)')
xlim([0 NTAU(end)/dar])

psd(1,n:n+2)=[psd1 Epolf];
n=n+3;

fout=strcat(dat,'_lm_',num2str(f),'.tiff');
print('-dtiff','-r300', fout)
close
end
psd=psd;

end



