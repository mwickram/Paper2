function comparison=drtion(dat,dar,enum,cor,corl)

 
sdir=dat(1:7);
Data=strcat(sdir,'\',dat);
data1=load(Data);



for k=1:enum % enum= Number of electrodes
    
data=data1(1:end,k);
d=data-mean(data);

h=hilbert(d);
p(:,k)=unwrap(angle(h(cor:end-corl)));

end

t=[1:length(p(:,1))]/dar;

pdd(:,1)=p(:,1)-p(:,2);
pdd(:,2)=p(:,2)-p(:,3);
pdd(:,3)=p(:,1)-p(:,3);

mean_pdd=mean(pdd);

 for k=1:3

 mpdd(:,k)= mean(exp(i*(pdd(:,k))));
 
 end
 
conj_mpdd =conj(mpdd);
synMatr= [1 mpdd(1) mpdd(3); conj_mpdd(1) 1 mpdd(2); conj_mpdd(3) conj_mpdd(2) 1]; 
inv_syM=inv(synMatr);

ppsyn(:,1)=abs(inv_syM(1,2))/(sqrt(inv_syM(1,1)*inv_syM(2,2))); %partial Phase syncronization index |Rz| of E1 and E2
ppsyn(:,2)=abs(inv_syM(2,3))/(sqrt(inv_syM(2,2)*inv_syM(3,3)));
ppsyn(:,3)=abs(inv_syM(1,3))/(sqrt(inv_syM(1,1)*inv_syM(3,3)));


comparison = [abs(mpdd) ppsyn];% abd(mpdd) is the bivariant phase syncronization index |R|

disp(['|R|','  ' num2str(abs(mpdd))]);
disp(['Rz','   ' num2str(ppsyn)]);










