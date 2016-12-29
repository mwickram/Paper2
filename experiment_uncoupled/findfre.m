function Fre=findfre

resis=[1000 1000 1000];
enum=3;
dar=200;
dat='m050410';
sdir=dat(1:7);

data1=load('m050410_16.dat');
length(data1)
tstart=1300;
nlength=600;
nstartdata=tstart*dar;
nend=nstartdata+nlength*dar;
data1=data1(nstartdata:nend,:);
length(data1);
data1=sgolayfilt(data1,2,21);


for k=1:enum
data = data1(1:end,k);

[nr,nc]=size(data);  %  #rows , # columns
t=(0:nr-1)./dar; t=t';

mcurr=mean(data);
total_mcurr(k,1)= mcurr/resis(k);
disp(['Mean current','  ', num2str(mcurr/resis(k)),' ','mA']);%resis should be in Kohms


difos=data-mcurr;
h=hilbert(difos);
h = h - 0.05 + 0*(i);
h=sgolayfilt(h,2,21);

Uphs(:,k)=unwrap(angle(h(100:end-100)));

nuphs=length(Uphs(:,1));
tm=[0:nuphs-1]./dar;
tm=tm';


p= polyfit(tm,Uphs(:,k),1) ;%p=ployfit(X,Y,N) --> P(1)*X^N + P(2)*X^(N-1) +...+ P(N)*X + P(N+1)
fit=polyval(p,tm);  

Frequency=p(1)/(2*pi); 
Fre(k,1)=Frequency;


end

disp(['Total current','=',num2str(sum(total_mcurr)),' ','mA'])

Freuency=Fre

 
 
 
 


