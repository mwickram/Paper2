 function [zigma]=phase_diff(dat,dar,enum,cor,corl)

 
sdir=dat(1:7);
Data=strcat(sdir,'\',dat);
data1=load(Data);

for k=1:enum % enum= Number of electrodes
data=data1(1:end,k);

d=data-mean(data);

h=hilbert(d);

p(:,k)=unwrap(angle(h(cor:end-corl)));

end


t=(1:length(p(:,1)))/dar;
pdd=p(:,1)-p(:,2);
disp(['Phase Difference','  ', num2str(mean(pdd))])


A=subplot(3,2,1);
plot(t,pdd);

ylabel('Phase difference, rad');
xlabel('t, s'); 
title([dat(1:7),'\_', dat(9:13) '  '  'E1-E2' ])
xlim([0 t(end)])

B=subplot(3,2,2);

pdd2=mod(pdd,2*pi);
nbox=[0:0.1:2*pi];
[ny,nx]=hist(pdd2,nbox);
pr=ny/length(pdd2);
bar(nx,pr);
ind=find(pr==0);

pr(ind)=[];
S=-sum(pr.*log(pr));
Smax=log(length(nbox));

sigma1_2=1-S/Smax% Extent of Sycronization


xlabel('mod(\Delta\oslash,2\pi)');
ylabel('Probability');
title(['\sigma'  '  '   '='  '  '  num2str(sigma1_2)]) ;


zigma=sigma1_2;

if enum==3

pdd1=p(:,3)-p(:,2);

B=subplot(3,2,3);
plot(t,pdd1)

ylabel('Phase difference, rad');
xlabel('t, s');
title('E2-E3');
xlim([0 t(end)])
%get(B,'position')
%set(B,'position',[0.5762 0.2687 0.3389 0.437]);
%ylabel('\phi, (rad)');
%xlabel('t, s');
%axes2 = axes('Parent',figure1,'Position',[0.5762 0.2687 0.3389 0.437]);


subplot(3,2,4);
pdd3=mod(pdd1,2*pi);
nbox=[0:0.1:2*pi];
[ny,nx]=hist(pdd3,nbox);
pr1=ny/length(pdd3);
bar(nx,pr1);
ind1=find(pr1==0);
pr1(ind1)=[];
S1=-sum(pr1.*log(pr1));
Smax1=log(length(nbox));

sigma2_3=1-S1/Smax1

xlabel('mod(\Delta\oslash,2\pi)')
ylabel('Probability')
title(['\sigma'  '  '  '='  '  '  num2str(sigma2_3)]) 


pdd4=p(:,3)-p(:,1);

subplot(3,2,5)
plot(t,pdd4)
ylabel('Phase difference, rad');

xlabel('t, s');
title('E3-E1');
xlim([0 t(end)])

subplot(3,2,6)
pdd5=mod(pdd4,2*pi);
nbox=[0:0.1:2*pi];
[ny,nx]=hist(pdd5,nbox);
pr2=ny/length(pdd5);
bar(nx,pr2);
ind2=find(pr2==0);
pr2(ind2)=[];
S2=-sum(pr2.*log(pr2));
Smax2=log(length(nbox));

sigma1_3=1-S2/Smax2

xlabel('mod(\Delta\oslash,2\pi)')
ylabel('Probability')
title(['\sigma'  '  '  '='  '  '  num2str(sigma1_3)]) 

fout=strcat(dat,'_sigma','.tiff');
print('-dtiff','-r300', fout)

close
zigma=[sigma1_2 sigma2_3 sigma1_3];

end




