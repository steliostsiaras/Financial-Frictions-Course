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
dynare BGGflexi 


gg = 1:40;
ss = 0:(length(gg) - 1);
subplot(3, 3, 1)
plot(ss, oo_.irfs.YY_e_A(gg), 'o-')
set(gca,'fontsize',20)
title('A. Output','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 2)
plot(ss, oo_.irfs.LeLe_e_A(gg), 'o-')
set(gca,'fontsize',20)
title('B. Credit','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 3)
plot(ss, oo_.irfs.II_e_A(gg), 'o-')
set(gca,'fontsize',20)
title('C. Investment','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 4)
plot(ss, oo_.irfs.spreadspread_e_A(gg), 'o-')
set(gca,'fontsize',20)
title('E. Spread','FontSize',20)
ylabel({'Annual Basis Points'})
axis tight

subplot(3, 3, 5)

ph1=plot(ss, oo_.irfs.bankrupt_e_A(gg), 'o-','LineWidth',1);
axis tight
set(gca,'fontsize',20)

title('F. Default','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})


subplot(3, 3, 6)
plot(ss, oo_.irfs.NeNe_e_A(gg), 'o-');
set(gca,'fontsize',20)
title('G. Net Worth','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 7)
plot(ss, oo_.irfs.LabLab_e_A(gg), 'o-');
set(gca,'fontsize',20)
title('Labor','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 8)
plot(ss, oo_.irfs.RR_e_A(gg), 'o-');
set(gca,'fontsize',20)
title('Risk Free Interest Rate','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

sh=subplot(3,3,9);
p= [.72, .15 0.2 0.15];
lh=legend(sh,[ph1],{'BGG-RBC'},'FontWeight','bold','FontSize',20);
set(lh,'position',p);
axis(sh,'off');



%% Risk Shock
dynare BGGflexi 


gg = 1:40;
ss = 0:(length(gg) - 1);
subplot(3, 3, 1)
plot(ss, oo_.irfs.YY_e_RS(gg), 'o-')
set(gca,'fontsize',20)
title('A. Output','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 2)
plot(ss, oo_.irfs.LeLe_e_RS(gg), 'o-')
set(gca,'fontsize',20)
title('B. Credit','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 3)
plot(ss, oo_.irfs.II_e_RS(gg), 'o-')
set(gca,'fontsize',20)
title('C. Investment','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 4)
plot(ss, oo_.irfs.spreadspread_e_RS(gg), 'o-')
set(gca,'fontsize',20)
title('E. Spread','FontSize',20)
ylabel({'Annual Basis Points'})
axis tight

subplot(3, 3, 5)

ph1=plot(ss, oo_.irfs.bankrupt_e_RS(gg), 'o-','LineWidth',1);
axis tight
set(gca,'fontsize',20)

title('F. Default','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})


subplot(3, 3, 6)
plot(ss, oo_.irfs.NeNe_e_RS(gg), 'o-');
set(gca,'fontsize',20)
title('G. Net Worth','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 7)
plot(ss, oo_.irfs.LabLab_e_RS(gg), 'o-');
set(gca,'fontsize',20)
title('Labor','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 8)
plot(ss, oo_.irfs.RR_e_RS(gg), 'o-');
set(gca,'fontsize',20)
title('Risk Free Interest Rate','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

sh=subplot(3,3,9);
p= [.72, .15 0.2 0.15];
lh=legend(sh,[ph1],{'BGG-RBC'},'FontWeight','bold','FontSize',20);
set(lh,'position',p);
axis(sh,'off');

%% Risk Shock with Anticipated Components in BGG sticky
%%
cd '/Users/alabama/Documents/GitHub/Financial_Firctions_Course_EUI/Financial-Frictions-Course/Assymetric_Information/codes/BGG_sticky'

dynare BGGsticky 

gg = 1:40;
ss = 0:(length(gg) - 1);
subplot(2, 2, 1)
plot(ss, oo_.irfs.YY_e_RS(gg), 'o-')
hold on
plot(ss, oo_.irfs.YY_e_xi1(gg))
hold on
plot(ss, oo_.irfs.YY_e_xi2(gg))
hold on
plot(ss, oo_.irfs.YY_e_xi3(gg))
hold on
plot(ss, oo_.irfs.YY_e_xi4(gg))
hold on
plot(ss, oo_.irfs.YY_e_xi5(gg))
hold on
plot(ss, oo_.irfs.YY_e_xi6(gg))
hold on
plot(ss, oo_.irfs.YY_e_xi7(gg))
hold on
plot(ss, oo_.irfs.YY_e_xi8(gg))
title('A. Output','FontSize',20)

grid on
subplot(2, 2, 2)
plot(ss, oo_.irfs.spreadspread_e_RS(gg), 'o-')
hold on
plot(ss, oo_.irfs.spreadspread_e_xi1(gg))
hold on
plot(ss, oo_.irfs.spreadspread_e_xi2(gg))
hold on
plot(ss, oo_.irfs.spreadspread_e_xi3(gg))
hold on
plot(ss, oo_.irfs.spreadspread_e_xi4(gg))
hold on
plot(ss, oo_.irfs.spreadspread_e_xi5(gg))
hold on
plot(ss, oo_.irfs.spreadspread_e_xi6(gg))
hold on
plot(ss, oo_.irfs.spreadspread_e_xi7(gg))
hold on
plot(ss, oo_.irfs.spreadspread_e_xi8(gg))
grid on
title('B. Spread','FontSize',20)

subplot(2, 2, 3)
plot(ss, oo_.irfs.sigma_omega_e_RS(gg), 'o-')
hold on
plot(ss, oo_.irfs.sigma_omega_e_xi1(gg))
hold on
plot(ss, oo_.irfs.sigma_omega_e_xi2(gg))
hold on
plot(ss, oo_.irfs.sigma_omega_e_xi3(gg))
hold on
plot(ss, oo_.irfs.sigma_omega_e_xi4(gg))
hold on
plot(ss, oo_.irfs.sigma_omega_e_xi5(gg))
hold on
plot(ss, oo_.irfs.sigma_omega_e_xi6(gg))
hold on
plot(ss, oo_.irfs.sigma_omega_e_xi7(gg))
hold on
plot(ss, oo_.irfs.sigma_omega_e_xi8(gg))
grid on
title('C. Risk Shock','FontSize',20)

subplot(2, 2, 4)
plot(ss, oo_.irfs.KK_e_RS(gg), 'o-')
hold on
plot(ss, oo_.irfs.KK_e_xi1(gg))
hold on
plot(ss, oo_.irfs.KK_e_xi2(gg))
hold on
plot(ss, oo_.irfs.KK_e_xi3(gg))
hold on
plot(ss, oo_.irfs.KK_e_xi4(gg))
hold on
plot(ss, oo_.irfs.KK_e_xi5(gg))
hold on
plot(ss, oo_.irfs.KK_e_xi6(gg))
hold on
plot(ss, oo_.irfs.KK_e_xi7(gg))
hold on
plot(ss, oo_.irfs.KK_e_xi8(gg))
grid on
title('D. Capital','FontSize',20)
