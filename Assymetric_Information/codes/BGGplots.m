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



%% Comparison of NK-BGG with  RBC-BGG

clear;

cd '/Users/alabama/Documents/GitHub/Financial_Firctions_Course_EUI/Financial-Frictions-Course/Assymetric_Information/codes/BGG_sticky/'

dynare BGGsticky noclearall 
result(1) = oo_.irfs;


cd '/Users/alabama/Documents/GitHub/Financial_Firctions_Course_EUI/Financial-Frictions-Course/Assymetric_Information/codes/BGG_flexi/'
dynare BGGflexi noclearall 
result(2) = oo_.irfs;


figure('Name','Productivity Shock under BGG NK and BGG RBC'); 

gg = 1:40;
ss = 0:(length(gg) - 1);
subplot(3, 3, 1)
plot(ss, result(1).YY_e_A(gg),'LineWidth',2)
hold on
plot(ss, result(2).YY_e_A(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('A. Output','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 2)
plot(ss, result(1).LeLe_e_A(gg),'LineWidth',2)
hold on
plot(ss, result(2).LeLe_e_A(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('B. Credit','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 3)
plot(ss, result(1).II_e_A(gg),'LineWidth',2')
hold on
plot(ss, result(2).II_e_A(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('C. Investment','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 4)
plot(ss, result(1).spreadspread_e_A(gg),'LineWidth',2)
hold on
plot(ss, result(2).spreadspread_e_A(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('E. Spread','FontSize',20)
ylabel({'Annual Basis Points'})
axis tight
grid on

subplot(3, 3, 5)

ph1=plot(ss, result(1).bankrupt_e_A(gg),'LineWidth',2);
hold on
ph2=plot(ss, result(2).bankrupt_e_A(gg),'LineWidth',2);
axis tight
set(gca,'fontsize',20)

title('F. Default','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
grid on


subplot(3, 3, 6)
plot(ss, result(1).NeNe_e_A(gg),'LineWidth',2);
hold on
plot(ss, result(2).NeNe_e_A(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('G. Net Worth','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 7)
plot(ss, result(1).LabLab_e_A(gg),'LineWidth',2);
hold on
plot(ss, result(2).LabLab_e_A(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('Labor','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 8)
plot(ss, result(1).RR_e_A(gg),'LineWidth',2);
hold on
plot(ss, result(2).RR_e_A(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('Risk Free Interest Rate','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

sh=subplot(3,3,9);
p= [.72, .15 0.2 0.15];
lh=legend(sh,[ph1;ph2],{'BGG+NK','BGG+Flexi'},'FontWeight','bold','FontSize',20);
set(lh,'position',p);
axis(sh,'off');

%% Risk Shock

figure('Name','Risk Shock under BGG NK and BB RBC'); 

gg = 1:40;
ss = 0:(length(gg) - 1);
subplot(3, 3, 1)
plot(ss, result(1).YY_e_RS(gg),'LineWidth',2)
hold on
plot(ss, result(2).YY_e_RS(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('A. Output','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 2)
plot(ss, result(1).LeLe_e_RS(gg),'LineWidth',2)
hold on
plot(ss, result(2).LeLe_e_RS(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('B. Credit','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 3)
plot(ss, result(1).II_e_RS(gg),'LineWidth',2')
hold on
plot(ss, result(2).II_e_RS(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('C. Investment','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 4)
plot(ss, result(1).spreadspread_e_RS(gg),'LineWidth',2)
hold on
plot(ss, result(2).spreadspread_e_RS(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('E. Spread','FontSize',20)
ylabel({'Annual Basis Points'})
axis tight
grid on

subplot(3, 3, 5)

ph1=plot(ss, result(1).bankrupt_e_RS(gg),'LineWidth',2);
hold on
ph2=plot(ss, result(2).bankrupt_e_RS(gg),'LineWidth',2);
axis tight
set(gca,'fontsize',20)

title('F. Default','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
grid on


subplot(3, 3, 6)
plot(ss, result(1).NeNe_e_RS(gg),'LineWidth',2);
hold on
plot(ss, result(2).NeNe_e_RS(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('G. Net Worth','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 7)
plot(ss, result(1).LabLab_e_RS(gg),'LineWidth',2);
hold on
plot(ss, result(2).LabLab_e_RS(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('Labor','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

subplot(3, 3, 8)
plot(ss, result(1).RR_e_RS(gg),'LineWidth',2);
hold on
plot(ss, result(2).RR_e_RS(gg),'LineWidth',2)
set(gca,'fontsize',20)
title('Risk Free Interest Rate','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight
grid on

sh=subplot(3,3,9);
p= [.72, .15 0.2 0.15];
lh=legend(sh,[ph1;ph2],{'BGG+NK','BGG+Flexi'},'FontWeight','bold','FontSize',20);
set(lh,'position',p);
axis(sh,'off');
