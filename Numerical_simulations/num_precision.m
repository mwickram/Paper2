
function num_precision

d=load('Am081610_1.dat');
 
 
 d=d(6:end-4,:);
 d(:,1)=1./d(:,1);
 
    
 figure(1)
 
 
 h=subplot(2,2,1);
 get (h,'position')
 %annotation('arrow',[0.5 0.5], [0.5 0.7])
 
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),d(:,11),'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylabel('\itD\rm_k');
 ylim([0 0.025]);
  xlim([-3.05 -1.9]);
  
 
 h=subplot(2,2,2);
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),d(:,12),'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([0 0.025]);
  xlim([-3.05 -1.9]);
 
 h=subplot(2,2,3);%This is D_k_l
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),d(:,14),'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylabel('\itD\rm_k_,_l');
 ylim([0 0.025]); 
 xlim([-3.05 -1.9]);
   
 h=subplot(2,2,4);
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),d(:,15),'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([0 0.025]);
 xlim([-3.05 -1.9]);
 
 figure(2)
 
  
 h=subplot(2,2,1); % this is D_k
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),d(:,13),'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([0 0.025]);
  xlim([-3.05 -1.9]);
 
 h=subplot(2,2,3); %this is D_k_l
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),d(:,16),'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([0 0.025]);
 xlim([-3.05 -1.9]);
 
 figure(3)
 
 
 h=subplot(2,2,3);

 sD12=d(:,11) + d(:,12);
 
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),sD12,'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylabel('\itD\rm_k + \itD\rm_l');
  ylim([0 0.025]);
  xlim([-3.05 -1.9]);
  xlabel('log_1_0(1/\itR )');
    
 h=subplot(2,2,4);
 
 sD23=d(:,12) + d(:,13);
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),sD23,'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([0 0.025]);
 xlim([-3.05 -1.9]);
 xlabel('log_1_0(1/\itR )');
 
 figure(4)
 
 h=subplot(2,2,4); %this is D_k + D_l
 
 sD13=d(:,11)+d(:,13);
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),sD13,'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([0 0.025]);
 xlim([-3.05 -1.9]);
  xlabel('log_1_0(1/\itR )');