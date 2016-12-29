function X=run_odek(applied_V,Res,Rcross,capacitance)

global V;
global R;
global Rc;
global cd;

V=applied_V;   %V=36.7395 typical values
R=Res;         %R=0.02  typical values
Rc=Rcross;
cd=capacitance; % to get different oscillators change cd ;


X0=[0.4834 0.9658 0.9205 0.2205 0.4910 0.3746 0.4785 0.9431 0.0848]; % [e u w for 3 osc]
options=odeset('Abstol',1e-6,'reltol',1e-6);

t=1:0.01:30000;
tnew=cell(10000000,1);
X=cell(10000000,1:9);
clear tnew
clear X
[tnew,X]=ode45(@koper,t,X0,options);
X=X(1000000:end,1:3:end);% select  e1 e2 e3 double layer potetials
                        %ignore 5000 oscillations







% 
%  [fre]=findfre1(X,100,3,1000,1000,[0.02 0.02 0.02])
% 
%  diff_os(fre(1),fre(2),fre(3));
% 
% 
%  %uncomment to see figures
%  
% figure(1)
% subplot(2,2,1)
% plot(data(:,1),X(:,1))
% %xlim([200 250]);
% % 
% % subplot(2,2,2)
% % plot(data(:,1),X(:,2))
% % %xlim([200 250]);
% % 
% % subplot(2,2,3)
% % plot(data(:,1),X(:,3))
% % %xlim([200 250]);
% % 
% % subplot(2,2,4)
% % plot(data(:,1),X(:,1),'r-',data(:,1),X(:,2),'-b',data(:,1),X(:,3),'-g')
% % %xlim([200 250]);
% % 
 end