function direction

 d=load('Am010809.dat');
 d=d(3:end,:);

 d(:,1)=1./d(:,1);
 
 
 figure(1)
 
 
 h=subplot(2,2,1);
 
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),d(:,5),'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 line([-0.3,-3.1],[0.5, 0.5],'linewidth',2,'linestyle','--','color','k');
 ylabel('\rho');
 ylim([0 1]);
 xlim([-3.1 -0.3]);
 
 
 h=subplot(2,2,2);
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),d(:,6),'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 line([-0.3,-3.1],[0.5, 0.5],'linewidth',2,'linestyle','--','color','k');
 ylim([0 1]);
 xlim([-3.1 -0.3]);
 d(:,5)./abs((d(:,2)-d(:,3))*2*pi);
 d(:,6)./abs((d(:,3)-d(:,4))*2*pi);
 
 h=subplot(2,2,3);
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),d(:,8),'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 line([-0.3,-3.1],[0.5, 0.5],'linewidth',2,'linestyle','--','color','k');
 ylabel('\rho^z');
 xlabel('log_1_0(1/\itR )');
 ylim([0 1]); 
 xlim([-3.1 -0.3]);
  
 h=subplot(2,2,4);
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),d(:,9),'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 line([-0.3,-3.1],[0.5, 0.5],'linewidth',2,'linestyle','--','color','k')
 xlabel('log_1_0(1/\itR )');
 ylim([0 1]);
 xlim([-3.1 -0.3]);
 
 figure(2)
 
  
 h=subplot(2,2,1);
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),d(:,7),'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 line([-0.3,-3.1],[0.5, 0.5],'linewidth',2,'linestyle','--','color','k');
 ylim([0 1]);
 xlim([-3.1 -0.3]);
 
 h=subplot(2,2,3);
 set(h,'fontsize',14,'FontName', 'Arial');
 g=plot(log10(d(:,1)),d(:,10),'k-o');
 set(g,'linewidth',2,'markerfacecolor','k');
 line([-0.3,-3.1],[0.5, 0.5],'linewidth',2,'linestyle','--','color','k');
 ylim([0 1]);
 xlim([-3.1 -0.3]);
 xlabel('log_1_0(1/\itR )');

figure(3)

h=subplot(2,2,1);
set(h,'fontsize',14,'FontName','Arial');

g=plot(log10(d(:,1)),d(:,2),'k-o',log10(d(:,1)),d(:,3),'r-^',log10(d(:,1)),d(:,4),'b-d');
set(g,'linewidth',2);
set(g(1),'markerfacecolor','k');
set(g(2),'markerfacecolor','r');
set(g(3),'markerfacecolor','b');

ylabel('\omega (Hz)')
xlabel('log_1_0(1/\itR)')
xlim([-3.1 -0.3])
ylim([1.07 1.15])

h=subplot(2,2,2);
set(h,'fontsize',14,'FontName','Arial');
d12=d(:,2)-d(:,3);d23=d(:,3)-d(:,4);d13=d(:,2)-d(:,4);
frq=1000*abs([d12 d23 d13]);

g=plot(log10(d(:,1)),frq(:,1),'k-o',log10(d(:,1)),frq(:,2),'r-^',log10(d(:,1)),frq(:,3),'b-d');
set(g,'linewidth',2);
set(g(1),'markerfacecolor','k');
set(g(2),'markerfacecolor','r');
set(g(3),'markerfacecolor','b');

ylabel('|\Delta\omega| (mHz)')
xlabel('log_1_0(1/\itR)')
ylim([-1 30]);
xlim([-3.1 -0.3]);

legend('\Delta\omega_1_2','\Delta\omega_2_3','\Delta\omega_1_3');
 end




