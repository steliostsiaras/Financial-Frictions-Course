%% Responses to productivity shock 
% Comparison of NK-BGG with plain RBC
clear;

pol=1;
t         = 40;            % IRF length
yrr       = zeros(t,pol);
crr       = zeros(t,pol);
irr       = zeros(t,pol);
krr       = zeros(t,pol);
creditrr  = zeros(t,pol);
creditrrf = zeros(t,pol);
resrr     = zeros(t,pol);
premrr    = zeros(t,pol);
netwrbr   = zeros(t,pol);
riskrr    = zeros(t,pol);
netwrr    = zeros(t,pol);
netwrrf   = zeros(t,pol);
chimG     = zeros(t,pol);
sprdG     = zeros(t,pol);
yr        = zeros(t,pol);
defaultr  = zeros(t,pol);
defaultrf = zeros(t,pol);
yrrf       = zeros(t,pol);
crrf       = zeros(t,pol);
irrf       = zeros(t,pol);
rr       = zeros(t,pol);
rrf       = zeros(t,pol);
krrf       = zeros(t,pol);
phierr = zeros(t,pol);
premrrf= zeros(t,pol);

for i = 1:pol
cd 'https://github.com/steliostsiaras/Financial-Frictions-Course/blob/main/Assymetric_Information/codes/BGG_flexi/BGGsticky'
dynare BGGsticky noclearall 

yrr (:,i)       = oo_.irfs.YY_e_A;
crr (:,i)       = oo_.irfs.CC_e_A;
irr (:,i)       = oo_.irfs.II_e_A;
krr (:,i)       = oo_.irfs.KK_e_A;
labrr  (:,i)           = oo_.irfs.LabLab_e_A;
creditrr(:,i)   = oo_.irfs.LeLe_e_A;
netwrr (:,i)    = oo_.irfs.NeNe_e_A;
phierr (:,i)    = oo_.irfs.phiephie_e_A;
rr(:,i)         = oo_.irfs.RR_e_A;
defaultr(:,i)   = oo_.irfs.bankrupt_e_A;
premrr(:,i)     = oo_.irfs.spreadspread_e_A;

yrrf (:,i)      = oo_.irfs.YYF_e_A;
crrf (:,i)      = oo_.irfs.CCF_e_A;
irrf (:,i)      = oo_.irfs.IIF_e_A;
krrf (:,i)      = oo_.irfs.KKF_e_A;
rrf(:,i)        = oo_.irfs.RRF_e_A;
premrrf(:,i)    = oo_.irfs.spreadspreadF_e_A;
labrrf          = oo_.irfs.LabLabF_e_A;

end

i=2;
cd 'GitHub/Financial_Firctions_Course_EUI/Financial-Frictions-Course/Assymetric_Information/codes/BGG_flexi/'
dynare BGGflexi noclearall 
yrr (:,i)       = oo_.irfs.YY_e_A;
crr (:,i)       = oo_.irfs.CC_e_A;
irr (:,i)       = oo_.irfs.II_e_A;
krr (:,i)       = oo_.irfs.KK_e_A;
labrr(:,i)      = oo_.irfs.LabLab_e_A;
creditrr(:,i)   = oo_.irfs.LeLe_e_A;
netwrr (:,i)    = oo_.irfs.NeNe_e_A;
phierr (:,i)    = oo_.irfs.phiephie_e_A;
rr(:,i)         = oo_.irfs.RR_e_A;
defaultr(:,i)   = oo_.irfs.bankrupt_e_A;
premr(:,i)     = oo_.irfs.spreadspread_e_A;
%Colours...................
co = [0         0.4470    0.7410;
      0.7       0         0;
      0.3010    0.7450    0.9330;
      0.6350    0.0780    0.1840];
set(groot,'defaultAxesColorOrder',co)
%% ....................................

figure('Name','Productivity Shock under BGGNK no contract'); 

gg = 1:40;
ss = 0:(length(gg) - 1);
subplot(3, 3, 1)
plot(ss, yrr(gg), 'o-')
hold on
plot(ss, yrrf(gg), '*-')
set(gca,'fontsize',20)
title('A. Output','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 2)
plot(ss, creditrr(gg), 'o-')
hold on
plot(ss, creditrrf(gg), '*-')
set(gca,'fontsize',20)
title('B. Credit','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 3)
plot(ss, irr(gg), 'o-')
hold on
plot(ss, irrf(gg), '*-')
set(gca,'fontsize',20)
title('C. Investment','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 4)
plot(ss, premrr(gg), 'o-')
hold on
plot(ss, premrrf(gg), '*-')
set(gca,'fontsize',20)
title('E. Spread','FontSize',20)
ylabel({'Annual Basis Points'})
axis tight

subplot(3, 3, 5)

ph1=plot(ss, defaultr(gg), 'o-','LineWidth',1);
hold on
ph2=plot(ss, defaultrf(gg), '*-','LineWidth',1);
axis tight
set(gca,'fontsize',20)

title('F. Default','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})


subplot(3, 3, 6)
plot(ss, netwrr(gg), 'o-');
hold on
plot(ss, netwrrf(gg), '*-')
set(gca,'fontsize',20)
title('G. Net Worth','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 7)
plot(ss, labrr(gg), 'o-');
hold on
plot(ss, labrrf(gg), '*-')
set(gca,'fontsize',20)
title('Labor','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 8)
plot(ss, rr(gg), 'o-');
hold on
plot(ss, rrf(gg), '*-')
set(gca,'fontsize',20)
title('Risk Free Interest Rate','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

sh=subplot(3,3,9);
p= [.72, .15 0.2 0.15];
lh=legend(sh,[ph1;ph2],{'BGG+NK','Flexi-RBC'},'FontWeight','bold','FontSize',20);
set(lh,'position',p);
axis(sh,'off');

%% Responses to RISK SHOCK
%%
cd '/Users/alabama/Documents/GitHub/Financial_Firctions_Course_EUI/Financial-Frictions-Course/Assymetric_Information/codes/BGG_sticky/'

clear;

pol=1;
t         = 40;            % IRF length
yrS       = zeros(t,pol);
crS       = zeros(t,pol);
irS       = zeros(t,pol);
krS       = zeros(t,pol);
creditrS  = zeros(t,pol);
creditrSf = zeros(t,pol);
resrS     = zeros(t,pol);
premrS    = zeros(t,pol);
netwrbS   = zeros(t,pol);
riskrS    = zeros(t,pol);
netwrS    = zeros(t,pol);
netwrSf   = zeros(t,pol);
chimG     = zeros(t,pol);
sprdG     = zeros(t,pol);
yr        = zeros(t,pol);
defaultS  = zeros(t,pol);
defaultSf = zeros(t,pol);
yrSf       = zeros(t,pol);
crSf       = zeros(t,pol);
irSf       = zeros(t,pol);
rS       = zeros(t,pol);
rSf       = zeros(t,pol);
krSf       = zeros(t,pol);
phierS = zeros(t,pol);
premrSf= zeros(t,pol);

for i = 1:1

dynare BGGsticky noclearall 

yrS (:,i)       = oo_.irfs.YY_e_sigma;
crS (:,i)       = oo_.irfs.CC_e_sigma;
irS (:,i)       = oo_.irfs.II_e_sigma;
krS (:,i)       = oo_.irfs.KK_e_sigma;
labrS(:,i)      = oo_.irfs.LabLab_e_sigma;
creditrS(:,i)   = oo_.irfs.LeLe_e_sigma;
netwrS (:,i)    = oo_.irfs.NeNe_e_sigma;
phierS (:,i)    = oo_.irfs.phiephie_e_sigma;
rS(:,i)         = oo_.irfs.RR_e_sigma;
defaultS(:,i)   = oo_.irfs.bankrupt_e_sigma;
premrS(:,i)     = oo_.irfs.spreadspread_e_sigma;

yrSf (:,i)      = oo_.irfs.YYF_e_sigma;
crSf (:,i)      = oo_.irfs.CCF_e_sigma;
irSf (:,i)      = oo_.irfs.IIF_e_sigma;
krSf (:,i)      = oo_.irfs.KKF_e_sigma;
rSf(:,i)        = oo_.irfs.RRF_e_sigma;
premrSf(:,i)    = oo_.irfs.spreadspreadF_e_sigma;
labrSf          = oo_.irfs.LabLabF_e_sigma;

end

%Colours...................
co = [0         0.4470    0.7410;
      0.7       0         0;
      0.3010    0.7450    0.9330;
      0.6350    0.0780    0.1840];
set(groot,'defaultAxesColorOrder',co)
%% ....................................
figure('Name','Risk Shock under BGG-NK and RBC without BGG contract');  

gg = 1:40;
ss = 0:(length(gg) - 1);
subplot(3, 3, 1)
plot(ss, yrS(gg), 'o-')
hold on
plot(ss, yrSf(gg), '*-')
set(gca,'fontsize',20)
title('A. Output','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 2)
plot(ss, creditrS(gg), 'o-')
hold on
plot(ss, creditrSf(gg), '*-')
set(gca,'fontsize',20)
title('B. Credit','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 3)
plot(ss, irS(gg), 'o-')
hold on
plot(ss, irSf(gg), '*-')
set(gca,'fontsize',20)
title('C. Investment','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 4)
plot(ss, premrS(gg), 'o-')
hold on
plot(ss, premrSf(gg), '*-')
set(gca,'fontsize',20)
title('E. Spread','FontSize',20)
ylabel({'Annual Basis Points'})
axis tight

subplot(3, 3, 5)

ph1=plot(ss, defaultS(gg), 'o-','LineWidth',1);
hold on
ph2=plot(ss, defaultSf(gg), '*-','LineWidth',1);
axis tight
set(gca,'fontsize',20)

title('F. Default','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})


subplot(3, 3, 6)
plot(ss, netwrS(gg), 'o-');
hold on
plot(ss, netwrSf(gg), '*-')
set(gca,'fontsize',20)
title('G. Net Worth','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 7)
plot(ss, labrS(gg), 'o-');
hold on
plot(ss, labrSf(gg), '*-')
set(gca,'fontsize',20)
title('Labor','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 8)
plot(ss, rS(gg), 'o-');
hold on
plot(ss, rSf(gg), '*-')
set(gca,'fontsize',20)
title('Risk Free Interest Rate','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

sh=subplot(3,3,9);
p= [.72, .15 0.2 0.15];
lh=legend(sh,[ph1;ph2],{'BGG+NK','Flexi-RBC'},'FontWeight','bold','FontSize',20);
set(lh,'position',p);
axis(sh,'off');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Responses to RISK SHOCK NKBGG vs RBCBGG
%% Differences between BGGNK BGGRBC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i=2;
cd '/Users/alabama/Documents/GitHub/Financial_Firctions_Course_EUI/Financial-Frictions-Course/Assymetric_Information/codes/BGG_flexi/'

dynare BGGflexi noclearall 
yrS (:,i)       = oo_.irfs.YY_e_RS;
crS (:,i)       = oo_.irfs.CC_e_RS;
irS (:,i)       = oo_.irfs.II_e_RS;
krS (:,i)       = oo_.irfs.KK_e_RS;
labrS(:,i)      = oo_.irfs.LabLab_e_RS;
creditrS(:,i)   = oo_.irfs.LeLe_e_RS;
netwrS (:,i)    = oo_.irfs.NeNe_e_RS;
phierS (:,i)    = oo_.irfs.phiephie_e_RS;
rS(:,i)         = oo_.irfs.RR_e_RS;
defaultS(:,i)   = oo_.irfs.bankrupt_e_RS;
premrS(:,i)     = oo_.irfs.spreadspread_e_RS;
%%
figure('Name','Risk Shock under BGG-NK and BGG-RBC'); 

gg = 1:40;
ss = 0:(length(gg) - 1);
subplot(3, 3, 1)
plot(ss, yrS(gg,1), 'o-')
hold on
plot(ss, yrS(gg,2), '*-')
set(gca,'fontsize',20)
title('A. Output','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 2)
plot(ss, creditrS(gg,1), 'o-')
hold on
plot(ss, creditrS(gg,2), '*-')
set(gca,'fontsize',20)
title('B. Credit','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 3)
plot(ss, irS(gg,1), 'o-')
hold on
plot(ss, irS(gg,2), '*-')
set(gca,'fontsize',20)
title('C. Investment','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 4)
plot(ss, premrS(gg,1), 'o-')
hold on
plot(ss, premrS(gg,2), '*-')
set(gca,'fontsize',20)
title('E. Spread','FontSize',20)
ylabel({'Annual Basis Points'})
axis tight

subplot(3, 3, 5)

ph1=plot(ss, defaultS(gg,1), 'o-','LineWidth',1);
hold on
ph2=plot(ss, defaultS(gg,2), '*-','LineWidth',1);
axis tight
set(gca,'fontsize',20)

title('F. Default','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})


subplot(3, 3, 6)
plot(ss, netwrS(gg,1), 'o-');
hold on
plot(ss, netwrS(gg,2), '*-')
set(gca,'fontsize',20)
title('G. Net Worth','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 7)
plot(ss, labrS(gg,1), 'o-');
hold on
plot(ss, labrS(gg,2), '*-')
set(gca,'fontsize',20)
title('Labor','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

subplot(3, 3, 8)
plot(ss, rS(gg,1), 'o-');
hold on
plot(ss, rS(gg,2), '*-')
set(gca,'fontsize',20)
title('Risk Free Interest Rate','FontSize',20)
ylabel({'Percent Deviation';'from Steady State'})
axis tight

sh=subplot(3,3,9);
p= [.72, .15 0.2 0.15];
lh=legend(sh,[ph1;ph2],{'BGG+NK','BGG+RBC'},'FontWeight','bold','FontSize',20);
set(lh,'position',p);
axis(sh,'off');

