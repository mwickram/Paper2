function num_direction

 d=load('Am081610_1.dat');
 
 d=d(6:end-4,:);
 d(:,1)=1./d(:,1);
 
 
 figure(1)
 
 
 h=subplot(2,2,1);
 
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),d(:,5),'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 line([-0.3,-3.1],[0.5, 0.5],'linewidth',2,'linestyle','--','color','k')
 ylabel('\rho');
 ylim([0 0.85]);
 xlim([-3.05 -1.9]);
 
 h=subplot(2,2,2);
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),d(:,6),'k-o');
 line([-0.3,-3.1],[0.5, 0.5],'linewidth',2,'linestyle','--','color','k')
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([0 0.85]);
 xlim([-3.05 -1.9]);
 
 h=subplot(2,2,3);
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),d(:,8),'k-o');
 line([-0.3,-3.1],[0.5, 0.5],'linewidth',2,'linestyle','--','color','k')
 set(g,'linewidth',2,'markerfacecolor','k');
 ylabel('\rho^z');
 xlabel('log_1_0(1/\itR )');
 ylim([0 0.85]);
 xlim([-3.05 -1.9]);
 
  
 h=subplot(2,2,4);
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),d(:,9),'k-o');
 line([-0.3,-3.1],[0.5, 0.5],'linewidth',2,'linestyle','--','color','k')
 set(g,'linewidth',2,'markerfacecolor','k');
 xlabel('log_1_0(1/\itR )');
 ylim([0 0.85]);
 xlim([-3.05 -1.9]);
 
 
 figure(2)
 
  
 h=subplot(2,2,1);
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),d(:,7),'k-o');
 line([-0.3,-3.1],[0.5, 0.5],'linewidth',2,'linestyle','--','color','k')
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([0 0.85]);
 xlim([-3.05 -1.9]);
 
 
 h=subplot(2,2,3);
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),d(:,10),'k-o');
 line([-0.3,-3.1],[0.5, 0.5],'linewidth',2,'linestyle','--','color','k')
 set(g,'linewidth',2,'markerfacecolor','k');
 ylim([0 0.85]);
 xlim([-3.05 -1.9]);
 
 xlabel('log_1_0(1/\itR )');

figure(3)

h=subplot(2,2,1);
set(h,'fontsize',14,'FontName','Arial');

g=plot(log10(d(:,1)),d(:,2),'k-o',log10(d(:,1)),d(:,3),'r-^',log10(d(:,1)),d(:,4),'b-d');
set(g,'linewidth',2);
set(g(1),'markerfacecolor','k');
set(g(2),'markerfacecolor','r');
set(g(3),'markerfacecolor','b');

ylabel('\omega')
xlabel('log_1_0(1/\itR)')
ylim([0.47 0.48])
xlim([-3.05 -1.9])

h=subplot(2,2,2);
set(h,'fontsize',14,'FontName','Arial');
d12=d(:,2)-d(:,3);d23=d(:,3)-d(:,4);d13=d(:,2)-d(:,4);
frq=1000*abs([d12 d23 d13]);

g=plot(log10(d(:,1)),frq(:,1),'k-o',log10(d(:,1)),frq(:,2),'r-^',log10(d(:,1)),frq(:,3),'b-d');
set(g,'linewidth',2);
set(g(1),'markerfacecolor','k');
set(g(2),'markerfacecolor','r');
set(g(3),'markerfacecolor','b');

ylabel('|\Delta\omega|\times 10^3')
xlabel('log_1_0(1/\itR)')
ylim([-0.15 6]);
xlim([-3.05 -1.9]);

 end




