function Fre=findfre1(data,dar,enum,row,erow,resis)



data1=data;


for k=1:enum
data = data1(1:end,k);

[nr,nc]=size(data);  %  #rows , # columns
t=(0:nr-1)./dar; t=t';

mcurr=mean(data);
total_mcurr(k,1)= mcurr/resis(k);
disp(['Mean current','  ', num2str(mcurr/resis(k)),' ','mA']);


difos=data-mcurr;
dHi=hilbert(difos);

dHi= dHi(row:end-erow);

figure(2)
subplot(2,2,k)
dhplt(:,k)=dHi;
 plot(dhplt(:,k))
 
phs=angle(dHi) ;   
Uphs(:,k)=unwrap(phs);
tm=t(row:end-erow);
tm=tm(1:length(Uphs));
p= polyfit(tm,Uphs(:,k),1) ;%p=ployfit(X,Y,N) --> P(1)*X^N + P(2)*X^(N-1) +...+ P(N)*X + P(N+1)
fit=polyval(p,tm);  

Frequency=p(1)/(2*pi); 
Fre(k,1)=Frequency;


end

disp(['Total current','=',num2str(sum(total_mcurr)),' ','mA'])

Freuency=Fre




 
 
 


