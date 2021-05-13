   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Part of the Financial Frictions Course by Stelios Tsiaras %%
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Responses to productivity shock 
%% Plots for lecture
%% ....................................
clear all
clc 
close all

%% Productivity Shock
dynare GK
%%

gg = 1:40;
ss = 0:(length(gg) - 1);
subplot(3, 3, 1)
plot(ss, oo_.irfs.YY_e_A(gg), 'LineWidth',2)
set(gca,'fontsize',20)
title('A. Output','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 2)
plot(ss, oo_.irfs.KK_e_A(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('B. Capital','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 3)
plot(ss, oo_.irfs.II_e_A(gg), 'LineWidth',2)
set(gca,'fontsize',20)
title('C. Investment','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 4)
plot(ss, oo_.irfs.spreadspread_e_A(gg), 'LineWidth',2)
set(gca,'fontsize',20)
title('E. Spread','FontSize',20)
ylabel({'Annual Basis Points'})
axis tight
grid on

subplot(3, 3, 5)

ph1=plot(ss, oo_.irfs.NN_e_A(gg),'LineWidth',2);
axis tight
set(gca,'fontsize',20)

title('F. Net Worth','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
grid on


subplot(3, 3, 6)
plot(ss, oo_.irfs.QQ_e_A(gg), 'LineWidth',2);
set(gca,'fontsize',20)
title('G. Price of Capital','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 7)
plot(ss, oo_.irfs.LabLab_e_A(gg),'LineWidth',2);
set(gca,'fontsize',20)
title('Labor','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 8)
plot(ss, oo_.irfs.RR_e_A(gg), 'LineWidth',2);
set(gca,'fontsize',20)
title('Risk Free Interest Rate','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

sh=subplot(3,3,9);
p= [.72, .15 0.2 0.15];
lh=legend(sh,[ph1],{'GK'},'FontWeight','bold','FontSize',20);
set(lh,'position',p);
axis(sh,'off');



%% Capital Quality Shock
dynare GK


gg = 1:40;
ss = 0:(length(gg) - 1);
subplot(3, 3, 1)
plot(ss, oo_.irfs.YY_e_psi(gg), 'LineWidth',2)
set(gca,'fontsize',20)
title('A. Output','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 2)
plot(ss, oo_.irfs.KK_e_psi(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('B. Capital','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 3)
plot(ss, oo_.irfs.II_e_psi(gg), 'LineWidth',2)
set(gca,'fontsize',20)
title('C. Investment','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 4)
plot(ss, oo_.irfs.spreadspread_e_psi(gg), 'LineWidth',2)
set(gca,'fontsize',20)
title('E. Spread','FontSize',20)
ylabel({'Annual Basis Points'})
axis tight
grid on

subplot(3, 3, 5)

ph1=plot(ss, oo_.irfs.NN_e_psi(gg),'LineWidth',2);
axis tight
set(gca,'fontsize',20)

title('F. Net Worth','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
grid on


subplot(3, 3, 6)
plot(ss, oo_.irfs.QQ_e_psi(gg), 'LineWidth',2);
set(gca,'fontsize',20)
title('G. Price of Capital','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 7)
plot(ss, oo_.irfs.LabLab_e_psi(gg),'LineWidth',2);
set(gca,'fontsize',20)
title('Labor','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 8)
plot(ss, oo_.irfs.RR_e_psi(gg), 'LineWidth',2);
set(gca,'fontsize',20)
title('Risk Free Interest Rate','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

sh=subplot(3,3,9);
p= [.72, .15 0.2 0.15];
lh=legend(sh,[ph1],{'GK'},'FontWeight','bold','FontSize',20);
set(lh,'position',p);
axis(sh,'off');