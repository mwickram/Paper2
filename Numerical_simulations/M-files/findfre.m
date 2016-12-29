function Fre=findfre(dat,dar,enum,row,erow,resis)

sdir=dat(1:7);
Data=strcat(sdir,'\',dat);
data1=load(Data);

for k=1:enum
data = data1(1:end,k);

[nr,nc]=size(data);  %  #rows , # columns
t=(0:nr-1)./dar; t=t';

mcurr=mean(data);
total_mcurr(k,1)= mcurr/resis(k);
disp(['Mean current','  ', num2str(mcurr/resis(k)),' ','mA']);


difos=data-mcurr;
dHi=hilbert(difos);

Uphs(:,k)=unwrap(angle(dHi(row:end-erow)));

tm=t(row:end-erow);

p= polyfit(tm,Uphs(:,k),1) ;%p=ployfit(X,Y,N) --> P(1)*X^N + P(2)*X^(N-1) +...+ P(N)*X + P(N+1)
fit=polyval(p,tm);  

Frequency=p(1)/(2*pi); 
Fre(k,1)=Frequency;


end

disp(['Total current','=',num2str(sum(total_mcurr)),' ','mA'])

Freuency=Fre

 
 
 
 


