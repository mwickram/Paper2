function plot_data(filename,cole)


 d=load(filename);

 d=d(5:end-cole,:);
 d(:,1)=1./d(:,1);
 
 figure(1)
 
 for k=1:6
 
 h=subplot(2,3,k);
 set(h,'fontsize',14);
 g=plot(log10(d(:,1)),d(:,k+7),'-o');%,'markerfacecolor','b','linewidth',2);
 
 xlabel('log_1_0(1/R )');ylabel('\rho');
 %ylim([0 1.05]);
 %xlim([1 6])
 %ylim([0 1.05]);xlim([1 6]);
 
 if k>3
 ylabel('\rho_z');
 
 end
 end
 
 figure(2)
 
 for k=1:3

 subplot(2,2,k);
 plot(log10(d(:,1)),d(:,k+4),'-o');
 xlabel('log_1_0(1/R)') , ylabel('\sigma')
 %xlim([1 6])
 %ylim([0 0.55])
 end

 subplot(2,2,4)
%plot(log10((d(:,1))),abs(d(:,2)-d(:,3)),'o',log10(d(:,1)),abs(d(:,3)-d(:,4)),'^',log10(d(:,1)),abs(d(:,2)-d(:,4)),' d')
plot(log10((d(:,1))),d(:,2),'o',log10(d(:,1)),d(:,3),'^',log10(d(:,1)),d(:,4),' d')
ylabel('\omega')
xlabel('log_1_0(1/R)') 
%xlim([1 6])


 figure(3)
 
subplot(2,2,1)
plot(log10(d(:,1)),d(:,2),'ko',log10(d(:,1)),d(:,3),'k^')
ylabel('\omega')
xlabel('log_1_0(1/R)')
legend('1', '2')

subplot(2,2,2)
plot(log10(d(:,1)),d(:,3),'k^', log10(d(:,1)),d(:,4),'kd')
ylabel('\omega')
xlabel('log_1_0(1/R)')
legend('2', '3')

subplot(2,2,3)
plot(log10(d(:,1)),d(:,4),'kd',log10(d(:,1)),d(:,2),'ko')
ylabel('\omega')
xlabel('log_1_0(1/R)')
legend('3', '1')

subplot(2,2,4)
plot(log10(d(:,1)),1000*abs(d(:,2)-d(:,3)),'k-o',log10(d(:,1)),1000*abs(d(:,3)-d(:,4)),'k-^',log10(d(:,1)),1000*abs(d(:,2)-d(:,4)),'k-d')
ylabel('\Delta\omega \times 10^-^3')
xlabel('log_1_0(1/R)')
legend('1-2','2-3','1-3','Location','best')
 ylim([0 6]);xlim([-7 -1.5])

figure(4)

D=d(:,14:19);

 for k=1:6
 
 h=subplot(2,3,k);
 set(h,'fontsize',14);
 plot(log10(d(:,1)),D(:,k),'-ok','linewidth',2);
 
 xlabel('log10(1/R)');ylabel('D (rad^2/s)');
 %ylim([0 0.02]);xlim([-7 -1.5])
 
 if k>3
 ylabel('');
 %ylim([0 0.02]);xlim([1 6])
 xlabel('log10(1/R)');ylabel('D_l_,_m (rad^2/s)');
 end
 
 end
 
 
 
 figure(5)
 
Dplus=[d(:,17:19)  d(:,14)+ d(:,15) d(:,15)+d(:,16) d(:,14)+d(:,16)];

  for k=1:6
 
 h=subplot(2,3,k);
 set(h,'fontsize',14);
 plot(log10(d(:,1)),Dplus(:,k),'-ok','linewidth',2);
 
 xlabel('log10(1/R)');ylabel('D_l_,_m (rad^2/s)');
 %ylim([0 0.02]);xlim([-7 -1.5])
 
 if k>3
 ylabel('');
 %ylim([0 0.02]);xlim([1 6])
 xlabel('log10(1/R)');ylabel('D_l + D_m (rad^2/s)');
 end
 
  end
 
 
 

 end




