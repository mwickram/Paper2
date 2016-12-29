
function precision

 d=load('Am010809_1.dat');
 
 d=d(3:end,:);
 d(:,1)=1./d(:,1);
 
 
 figure(1)
 
 
 h=subplot(2,2,1);
 
 set(h,'fontsize',14,'FontName', 'Arial');
 err1=(d(:,4)-d(:,3))/2;
 g=errorbar(log10(d(:,1)),d(:,2),err1,'k-o'); %D1
 set(g,'linewidth',2,'markerfacecolor','k');
 ylabel('\itD\rm_k (rad^2/s)');
 ylim([-0.003 0.17]);
 xlim([-3.1 -0.3]);
 
 h=subplot(2,2,2);
 err2=(d(:,7)-d(:,6))/2;
 set(h,'fontsize',14,'FontName', 'Arial');
 g=errorbar(log10(d(:,1)),d(:,5),err2,'k-o');%D2
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([-0.003 0.17]);
  xlim([-3.1 -0.3]);
 
 h=subplot(2,2,3);  % this is D_k,_l
 err12=(d(:,13)-d(:,12))/2;
 set(h,'fontsize',14,'FontName', 'Arial');
 g=errorbar(log10(d(:,1)),d(:,11),err12,'k-o'); %D12
 set(g,'linewidth',2,'markerfacecolor','k');
 ylabel('\itD\rm_k_,_l (rad^2/s)');
 ylim([-0.003 0.17]); 
  xlim([-3.1 -0.3]);
  
 h=subplot(2,2,4); % this is D_k,_l
 err23=(d(:,16)-d(:,15))/2;
 set(h,'fontsize',14,'FontName', 'Arial');
 g=errorbar(log10(d(:,1)),d(:,14),err23,'k-o');%D23
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([-0.003 0.17]);
  xlim([-3.1 -0.3]);
 
 figure(2)
 
  
 h=subplot(2,2,1)  ;   %this is D_k plot
 err3=(d(:,10)-d(:,9))/2;
 set(h,'fontsize',14,'FontName', 'Arial');
 g=errorbar(log10(d(:,1)),d(:,8),err3,'k-o');%D3
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([-0.003 0.17]);
 xlim([-3.1 -0.3]);
 
 h=subplot(2,2,3); % This is D_k_,_l plot
 err13=(d(:,19)-d(:,18))/2;
 set(h,'fontsize',14,'FontName', 'Arial');
 g=errorbar(log10(d(:,1)),d(:,17),err13,'k-o');%D13
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([-0.003 0.17]);
  xlim([-3.1 -0.3]);
 
 figure(3)
 
 
 h=subplot(2,2,3); % this is D_k + D_l
 
 
 sD12=d(:,2) + d(:,5);
 err_sd12=err1+err2;
 set(h,'fontsize',14,'FontName', 'Arial');
 g=errorbar(log10(d(:,1)),sD12,err_sd12,'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylabel('\itD\rm_k + \itD\rm_l (rad^2/s)');
 ylim([-0.003 0.17]);
  xlim([-3.1 -0.3]);
  xlabel('log_1_0(1/\itR )');
    
 h=subplot(2,2,4); % this is D_k + D_l
 
 sD23=d(:,5)+ d(:,8);
 err_sd23=err2+err3;
 set(h,'fontsize',14,'FontName', 'Arial');
 g=errorbar(log10(d(:,1)),sD23,err_sd23,'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
ylim([-0.003 0.17]);
  xlim([-3.1 -0.3]);
 xlabel('log_1_0(1/\itR )');
 
 figure(4)
 
 h=subplot(2,2,4);  %this is D_k + D_l
 
 sD13=d(:,2)+d(:,8);
 err_sd13=err1+err3;
 set(h,'fontsize',14,'FontName', 'Arial');
 g=errorbar(log10(d(:,1)),sD13,err_sd13,'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([-0.003 0.17]);
 xlim([-3.1 -0.3]);
  xlabel('log_1_0(1/\itR )');