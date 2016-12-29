
function num_precision1

d=load('Bm081610_1.dat');
 
 
 d=d(1:end,:);
 d(:,1)=1./d(:,1);
 
    
 figure(1)
 
 
 h=subplot(2,2,1);
 get (h,'position')
 %annotation('arrow',[0.5 0.5], [0.5 0.7])
 
 set(h,'fontsize',14,'FontName', 'Arial');
 err1=(d(:,4)-d(:,3))./2;
 g=errorbar(log10(d(:,1)),d(:,2),err1,'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylabel('\itD\rm_k');
 ylim([-0.0004 0.023]);
  xlim([-3.05 -1.9]);
  
 
 h=subplot(2,2,2);
 set(h,'fontsize',14,'FontName', 'Arial');
 err2=(d(:,7)-d(:,6))./2;
 g=errorbar(log10(d(:,1)),d(:,5),err2,'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([-0.0004 0.023]);
  xlim([-3.05 -1.9]);
 
 h=subplot(2,2,3);%This is D_k_l
 set(h,'fontsize',14,'FontName', 'Arial');
 err12=(d(:,13)-d(:,12))./2;
 g=errorbar(log10(d(:,1)),d(:,11),err12,'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylabel('\itD\rm_k_,_l');
 ylim([-0.0004 0.023]); 
 xlim([-3.05 -1.9]);
   
 h=subplot(2,2,4);
 set(h,'fontsize',14,'FontName', 'Arial');
 err23=(d(:,16)-d(:,15))./2;
 g=errorbar(log10(d(:,1)),d(:,14),err23,'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([-0.0004 0.023]);
 xlim([-3.05 -1.9]);
 
 figure(2)
 
  
 h=subplot(2,2,1); % this is D_k
 set(h,'fontsize',14,'FontName', 'Arial');
 err3=(d(:,10)-d(:,9))./2;
 g=errorbar(log10(d(:,1)),d(:,8),err3,'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([-0.0004 0.023]);
  xlim([-3.05 -1.9]);
 
 h=subplot(2,2,3); %this is D_k_l
 set(h,'fontsize',14,'FontName', 'Arial');
 err13=(d(:,19)-d(:,18))./2;
 g=errorbar(log10(d(:,1)),d(:,17),err13,'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([-0.0004 0.023]);
 xlim([-3.05 -1.9]);
 
 figure(3)
 
 
 h=subplot(2,2,3);

 sD12=d(:,2) + d(:,5);
 errsd12=err1+err2;
 
 set(h,'fontsize',14,'FontName', 'Arial');
 g=errorbar(log10(d(:,1)),sD12,errsd12,'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylabel('\itD\rm_k + \itD\rm_l');
  ylim([-0.0004 0.023]);
  xlim([-3.05 -1.9]);
  xlabel('log_1_0(1/\itR )');
    
 h=subplot(2,2,4);
 
 sD23=d(:,5) + d(:,8);
 errsd23=err2+err3;
 set(h,'fontsize',14,'FontName', 'Arial');
 g=errorbar(log10(d(:,1)),sD23,errsd23,'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([-0.0004 0.023]);
 xlim([-3.05 -1.9]);
 xlabel('log_1_0(1/\itR )');
 
 figure(4)
 
 h=subplot(2,2,4); %this is D_k + D_l
 
 sD13=d(:,2)+d(:,8);
 errsd13=err1+err3;
 set(h,'fontsize',14,'FontName', 'Arial');
 g=errorbar(log10(d(:,1)),sD13,errsd13,'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([-0.0004 0.023]);
 xlim([-3.05 -1.9]);
  xlabel('log_1_0(1/\itR )');