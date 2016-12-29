function [phase_diffusion]=pd(p,dar,div)


p=detrend(p);
np=length(p);
ml=floor(np/div);
NTAU=[200:1:ml];
l=length(NTAU);

for k=1:l
D(k)=pd_std(p,NTAU(k));
end


D=D(1:end);
NTAU= NTAU(1:end);


polf=polyfit(NTAU/dar,D,1);
X=NTAU'/dar;
X=[X,ones(length(X),1)];
[Npolf,Epolf]=regress(D',X);
%Npolf is equal to polf
slope=polf(1);
phased=polf(1)/2;
disp(['Phase Diffusion Coefficient',' ',num2str(phased)])
Epolf=Epolf(1,:)./2; %'Lower and  Upper 95% confidance limits
error_r=diff(Epolf);
disp(['Error',' ', num2str(error_r/2),'    ',num2str(100*error_r/(2*phased)), ' ','%'])
fitpd=polyval(polf,NTAU/dar);
h=plot(NTAU/dar,D,'k',NTAU/dar,fitpd,'r');
set(h(2), 'linewidth',2);
title(['D=1/2\times d(\sigma^2)/dt','=',  num2str(phased)]);%, ' ','at',' ', num2str(tem),'^0C'])

phase_diffusion=[phased  Epolf];

end

