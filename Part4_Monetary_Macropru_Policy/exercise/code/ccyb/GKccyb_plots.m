
%% ....................................

%% Homework

%% Comparison of CCYB measures

clear;

psi_k   = 0;             % Give to psi_k the value of every iteration
save psi_k_value psi_k                % send the parameter value to Dynare


dynare GK_ccyb
result(1) = oo_.irfs;

psi_k   = 0.15;             % Give to psi_k the value of every iteration
save psi_k_value psi_k   

% Here change your path to where you have stored BGGflexi
dynare GK_ccyb
result(2) = oo_.irfs;

%%
figure('Name','Capital Quality Shock under CCyB and no CCyB'); 

gg = 1:40;
ss = 0:(length(gg) - 1);
subplot(3, 3, 1)
plot(ss, result(1).YY_e_psi(gg),'LineWidth',2)
hold on
plot(ss, result(2).YY_e_psi(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('A. Output','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 2)
plot(ss, result(1).KK_e_psi(gg),'LineWidth',2)
hold on
plot(ss, result(2).KK_e_psi(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('B. Capital','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 3)
plot(ss, result(1).II_e_psi(gg),'LineWidth',2')
hold on
plot(ss, result(2).II_e_psi(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('C. Investment','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 4)
plot(ss, result(1).spreadspread_e_psi(gg),'LineWidth',2)
hold on
plot(ss, result(2).spreadspread_e_psi(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('E. Spread','FontSize',20)
ylabel({'Annual Basis Points'})
axis tight
grid on

subplot(3, 3, 5)

ph1=plot(ss, result(1).Loansloans_e_psi(gg),'LineWidth',2);
hold on
ph2=plot(ss, result(2).Loansloans_e_psi(gg),'LineWidth',2);
axis tight
set(gca,'fontsize',20)

title('F. Loans','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
grid on


subplot(3, 3, 6)
plot(ss, result(1).NN_e_psi(gg),'LineWidth',2);
hold on
plot(ss, result(2).NN_e_psi(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('G. Net Worth','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 7)
plot(ss, result(1).LabLab_e_psi(gg),'LineWidth',2);
hold on
plot(ss, result(2).LabLab_e_psi(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('Labor','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 8)
plot(ss, result(1).RR_e_psi(gg),'LineWidth',2);
hold on
plot(ss, result(2).RR_e_psi(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('Risk Free Interest Rate','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

sh=subplot(3,3,9);
p= [.72, .15 0.2 0.15];
lh=legend(sh,[ph1;ph2],{'No CCyB','CCyB'},'FontWeight','bold','FontSize',20);
set(lh,'position',p);
axis(sh,'off');
