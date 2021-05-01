external_function(name=logncdf, nargs=3);

% 1. BGG + sticky prices + Risk Shocks signals CMR2014_AER
% 2. Flexible prices core RBC model (Rk = R)
% For the Taylor rule I use the deviation of output from it's optimal
% flexible value. 
% With the flexible after prod shock NW goes up and lev down as in C&F
% Under the normal Taylor Rule, after a prod shock, NW goes down and lev up.

% I also include the anticipated components of risk shock like CMR2014
% If I want only the unanticipated this can be fixed from the options below
% The unananticipated is logxi0 the same with e_RS

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Taylor Rule specification OPTIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%     If =1, Taylor Rule with flexible no contract adjustment
@#define TRflexi = 1
@#define sigma_in_taylor_rule = 0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Risk Shock Signals OPTIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% when stopshock = 1, then non-risk shocks are all turned off
@#define stopshock= 0

% when stopsignal = 1, the anticipated component of risk are turned off
@#define stopsignal= 1

% when stopunant = 1, then unanticipated risk shock turned off
@#define stopunant= 0

% leave this as it is
% when signal_corr_nonzero = 1, sig_corr_p can be non zero.
@#define signal_corr_nonzero= 1

@#define possible_signals = ["0","1","2","3","4","5","6","7","8"]



var
%   Consumers
C Uc Lambda Lab R

%   Firms
Y K W Z A
% Entrepreneurs
Rk Rl Ne phie Le Ce rho
//p fnGam fnG DGam DG 
rhoRex omega bankrupt

%   Rest
I Q psi G T spread
sigma_pref zeta
PIS PIP Rn D H F X Ym Pm
sigmae sigma_omega mon sigma_omega_ss Sg

% Risk Shock Signals
xi0 xi1 xi2 xi3 xi4 xi5 xi6 xi7 xi8
log_xi0 log_xi1 log_xi2 log_xi3 log_xi4 log_xi5 log_xi6 log_xi7 log_xi8

% Flexi Price
Cf Ucf Lambdaf Labf Rf
Ymf Kf Wf Rkf
If Qf Gf Tf OUTGAP Pmf Zf Sf Sdashf Xif

p fnG fnGam DGam DG
S Sdash Xi

% Percentage Deviations
YY CC II WW RR QQ RnRn PIPPIP OUTGAPOUTGAP RkRk NeNe spreadspread KK
rhorho LabLab phiephie psipsi LeLe
YYF CCF IIF WWF RRF spreadspreadF LabLabF QQF RkRkF KKF
;




varexo e_A epsilonM e_G
e_xi1 e_xi2 e_xi3 e_xi4 e_xi5 e_xi6 e_xi7 e_xi8 e_RS;
//epsilonsigmae



parameters 

alphha betta gammma chil epsl delta 
ksie eta  G_over_Y  phiX kpY kpP rho_r els gam sig kap zzeta
rhosigma
signal_corr_p stdsigma2_p stdsigma1_p stdA stdG;

%mon      = 0.12; //mon=monitoring

%//sigmae   = 0.9740;      %0.9750-->BGG
ksie     = 0.0102;         %0.0102-->BGG 
%sigma_omega = 0.3136;
%----------------------------------------	
phiX=    1;
alphha   = 0.33; 		%Production function
betta    = 0.99;  		%% Time preference
gammma   = 0.500;      %% Habbit parameter
delta    = 0.025;		%% Amortization
chil     = 5.584;		%% Rel. utility weight of labor
epsl     = 0.333;	    %% Inverse Frisch elastitcity
eta      = 1.5;         %%Inverse elasticity of net investment to the price of capital
G_over_Y = 0.2;
gam      = 0.75;     % Calvo probability
els      = 4.167;    % elasticity of substitution goods
sig      = 1;       	% intertemp. elasticity of substitution
kpP      = 1.5;      % Taylor rule weight on inflation
kpY      = 0.3;     % Taylor rule weight on markup
zzeta    = 7.0;

kap      = 1; // indexation

rho_r    = 0.7;
rhosigma = 0.97;
rhog     = 0.97;
signal_corr_p = 0; //zero corellaion btw shocks to get the straight lines in CMR Fig 2
stdsigma2_p = 0.0282985;
stdsigma1_p = 0.0282985;%0.0700061;
stdA        = 1;  %0.07;
stdG        = 1;  %0.028;

model;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model equations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BGG + NK block
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%:::CONSUMERS:::




%:::Marginal Utility::: 1
Uc = (C - gammma*C(-1))^(-1)-betta*gammma*(C(+1)-gammma*C)^(-1);

%:::Stochastic discount factor::: 2
(Lambda) = sigma_pref*betta*(Uc)/(Uc(-1));

%:::Euler equation::: 3
Lambda(+1)*R = 1;

%:::Wage - Labour Optimality condition::: 4
Uc*Pm*(1-alphha)*Ym = Lab*chil*(Lab^epsl);


%:::FIRMS:::%




%:::Production Function::: 5
Ym = A*((psi*K(-1))^(alphha))*Lab^(1-alphha);
Ym = Y*D;

%:::Wage::: 6
W = Pm*(1-alphha)*Ym/Lab;

%:::Return on Capital::: 7
Z = alphha*Ym*Pm/(K(-1)*psi); 


%:::CAPITAL GOODS PRODUCERS:::



%:::Law of Motion of Capital::: 8
K=((1-S)*I+(1-delta)*K(-1));
%
%where
%

Xi=I/I(-1);
S=phiX*(Xi-1)^2;
Sdash=2*phiX*(Xi-1);


%:::Price of Capital Goods::: 10
Q*(1-S-Xi*Sdash)+Lambda(+1)*Q(+1)*Sdash(+1)*Xi(+1)^2=1;


%:::ENTREPRENEURS:::





%:::Real return of capital::: 11
Rk = psi*(Z+(1-delta)*Q)/Q(-1);

%:::Balance Sheet::: 12
Q*K= Le + Ne;

%:::Net Worth::: 13
Ne = (sigmae+ksie)*(1-fnGam)*Rk*Q(-1)*K(-1);   

%:::Consumption:::  14                    
Ce = (1-ksie)*(1-sigmae)*(1-fnGam)*Rk*Q(-1)*K(-1);

%:::Leverage::: 15
Ne*phie = Q*K;

%:::Zero profit Condition::: 16 + %:::Idiosyncratic Shock::: 17
% First way 
phie*Rk(+1)*(fnGam(+1)-mon*fnG(+1))=R(+1)*(phie-1); 
omega = Rl(-1)*(Q(-1)*K(-1) - Ne(-1))/(PIP*Rk*Q(-1)*K(-1));


rho   = (DGam/((fnGam-mon*fnG)*DGam+(1-fnGam)*(DGam-mon*DG)));

%:::Interest rate wedge::: 24
rhoRex = rho*R;
Rk(+1) = rhoRex(+1);  

% Auxiliary expressions.  These simplify the equations without adding
% additional variables.

p     = logncdf(omega,-0.5*(sigma_omega)^2,sigma_omega);
fnG   = 1 - normcdf((0.5*(sigma_omega)^2 -log(omega))/sigma_omega,0,1); %39
fnGam = fnG+omega*(1-p);
DGam  = (1-p);
DG    = 1/(omega*sigma_omega*sqrt(2*(4*atan(1))))*exp(-(log(omega)
        +.5*(sigma_omega)^2)^2/(2*(sigma_omega)^2));


%:::Resource Constraint::: 25
Y = C + Ce + G + I + mon*fnG*Rk*Q(-1)*K(-1);
G = T; 
G = Sg*G_over_Y*(steady_state(Y));
spread = Rk - R;


%:::Price Block:::





%:::Price Dispersion:::
D = gam*(D(-1))*(PIP(-1))^(-kap*els)*(PIP)^els +   (1-gam)* (PIS/PIP)^(-els);
//((1-gam*(PIP(-1))^(kap*(1-gam))*(PIP)^(gam-1))/(1-gam))^(-els/(1-gam));

%:::Optimal price choice I:::
F = (Y)*(Pm)+gam*(Lambda(+1))*(PIP(+1))^els*((PIP))^(-els*kap)*(F(+1));

%:::Optimal price choice II:::
H = (Y)+gam*(Lambda(+1))*(PIP(+1))^(els-1)*(PIP)^(kap*(1-els))*(H(+1));

%:::Optimal price choice III:::
PIS = els/(els-1)*(F)/(H)*(PIP);

%:::Price index::: 
PIP^(1-els) = gam*(PIP(-1))^(kap*(1-els))+(1-gam)*(PIS)^(1-els);

%:::Fisher equation:::
(Rn) = (R)*(PIP(+1));

%:::Taylor Rule::: 1 for flexible price adjustment, 0 for other

@#  if TRflexi == 0  
log(Rn/STEADY_STATE(Rn))=rho_r*log(Rn(-1)/STEADY_STATE(Rn))+(1-rho_r)*kpP *log(PIP/STEADY_STATE(PIP))
+(1-rho_r)*kpY *log(Y/STEADY_STATE(Y))+epsilonM;
@#  endif

@# if TRflexi == 1  
log(Rn/STEADY_STATE(Rn))=rho_r*log(Rn(-1)/STEADY_STATE(Rn))+(1-rho_r)*kpP*log(PIP/STEADY_STATE(PIP))
+(1-rho_r)*kpY*log((Y/STEADY_STATE(Y))/(Ymf/STEADY_STATE(Ymf)))  

@# if sigma_in_taylor_rule
+ 1 * log(sigma_omega/steady_state(sigma_omega))+epsilonM;
   @# else
       +epsilonM;
@# endif
%(Rn) = rho_r*(Rn(-1)) + (1-rho_r)*((1/betta)*((PIP))*kpP + ((els-1)/els/(Pm))*(kpY)) + epsilonM;
@# endif

//:::Markup:::
X  =   1/Pm;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calibration of banking parameters%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sigmae=STEADY_STATE(sigmae);
sigma_omega_ss=STEADY_STATE(sigma_omega_ss);
mon=STEADY_STATE(mon);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Flexible Price, non-BGG contract block
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ucf = (Cf - gammma*Cf(-1))^(-1)-betta*gammma*(Cf(+1)-gammma*Cf)^(-1);

Lambdaf = sigma_pref*betta*(Ucf)/(Ucf(-1));

Lambdaf(+1)*Rf  = 1;

Lambdaf(+1)*Rkf(+1) = 1;

Ucf*Pmf*(1-alphha)*Ymf= Labf*chil*(Labf^epsl);

Ymf = A*((psi*Kf(-1))^(alphha))*Labf^(1-alphha);

Zf = alphha*Ymf*Pmf/(Kf(-1)*psi); 

Rkf=psi*(Zf +(1-delta)*Qf)/Qf(-1);

Xif=If/If(-1);
Sf=phiX*(Xif-1)^2;
Sdashf=2*phiX*(Xif-1);


%:::Price of Capital Goods::: 10
Qf*(1-Sf-Xif*Sdashf)+Lambdaf(+1)*Qf(+1)*Sdashf(+1)*Xif(+1)^2=1;

Wf = Pmf*(1-alphha)*Ymf/Labf;

Ymf=Cf+Gf+If;

Kf=psi*(If+(1-delta)*Kf(-1));

Gf = Tf; 

Gf = G_over_Y*(steady_state(Ymf));

Pmf=1;

OUTGAP=Ymf/Y;
bankrupt = p;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Percentage Deviations from the steady state
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

YY=Y/STEADY_STATE(Y);
KK=K/STEADY_STATE(K);
II=I/STEADY_STATE(I);
CC=C/STEADY_STATE(C);
WW=W/STEADY_STATE(W);
LabLab=Lab/STEADY_STATE(Lab);
QQ=Q/STEADY_STATE(Q);
RR=R/STEADY_STATE(R);
RkRk=Rk/STEADY_STATE(Rk);
RnRn=Rn/STEADY_STATE(Rn);
PIPPIP=PIP/STEADY_STATE(PIP);
spreadspread=RkRk(+1)-RR(+1);
NeNe=Ne/STEADY_STATE(Ne);
rhorho=rho/STEADY_STATE(rho);
psipsi=psi/STEADY_STATE(psi);
phiephie=phie/STEADY_STATE(phie);
OUTGAPOUTGAP=OUTGAP/STEADY_STATE(OUTGAP);
LeLe = Le/STEADY_STATE(Le);
% Flexible Price 
YYF=Ymf/STEADY_STATE(Ymf);
KKF=Kf/STEADY_STATE(Kf);
IIF=If/STEADY_STATE(If);
CCF=Cf/STEADY_STATE(Cf);
WWF=Wf/STEADY_STATE(Wf);
LabLabF=Labf/STEADY_STATE(Labf);
QQF=Qf/STEADY_STATE(Qf);
RRF=Rf/STEADY_STATE(Rf);
RkRkF=Rkf/STEADY_STATE(Rkf);
spreadspreadF=RkRkF(+1)-RRF; // or RRF. If RRF spread=0;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Shock equations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Productivity Shock
log(A) = 0.75*log(A(-1)) + e_A;

% Government Spending Shock
log(Sg) = 0.75*log(Sg(-1)) + e_G;


% Risk Shock 
log(sigma_omega / sigma_omega_ss) = rhosigma * log(sigma_omega(-1) / sigma_omega_ss) 
 % unanticipated component 
 + log_xi0
% anticipated components 
  @#for index in ["1", "2", "3", "4", "5", "6", "7", "8"]
    + log(xi@{index}(-@{index}))
  @#endfor 
  ;

 log_xi0 = log(xi0);
 log_xi1 = log(xi1);
 log_xi2 = log(xi2);
 log_xi3 = log(xi3);
 log_xi4 = log(xi4);
 log_xi5 = log(xi5);
 log_xi6 = log(xi6);
 log_xi7 = log(xi7);
 log_xi8 = log(xi8);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Signal equations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  @#if ("8" in possible_signals)
  log(xi8) = stdsigma2_p * e_xi8;
  @#else
  log(xi8) = 0;
  @#endif
  
  @#if ("7" in possible_signals)
  log(xi7) = signal_corr_p * stdsigma2_p * e_xi8 
  @#for index in ["7"]
    + sqrt(1 - signal_corr_p^2) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi7) = 0;
  @#endif
  
  @#if ("6" in possible_signals)
  log(xi6) = signal_corr_p^2 * stdsigma2_p * e_xi8
  @#for index in ["7", "6"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 6) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi6) = 0;
  @#endif

  @#if ("5" in possible_signals)
  log(xi5) = signal_corr_p^3 * stdsigma2_p * e_xi8
  @#for index in ["7", "6", "5"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 5) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi5) = 0;
  @#endif

  @#if ("4" in possible_signals)
  log(xi4) = signal_corr_p^4 * stdsigma2_p * e_xi8
  @#for index in ["7", "6", "5", "4"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 4) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi4) = 0;
  @#endif

  @#if ("3" in possible_signals)  
  log(xi3) = signal_corr_p^5 * stdsigma2_p * e_xi8
  @#for index in ["7", "6", "5", "4", "3"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 3) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi3) = 0;
  @#endif

  @#if ("2" in possible_signals)  
  log(xi2) = signal_corr_p^6 * stdsigma2_p * e_xi8
  @#for index in ["7", "6", "5", "4", "3", "2"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 2) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi2) = 0;
  @#endif

  @#if ("1" in possible_signals)
  log(xi1) = signal_corr_p^7 * stdsigma2_p * e_xi8
  @#for index in ["7", "6", "5", "4", "3", "2", "1"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 1) * stdsigma2_p * e_xi@{index}
  @#endfor
  ;
  @#else
  log(xi1) = 0;
  @#endif
  
  @# if ("0" in possible_signals)
  log(xi0) = signal_corr_p^8 * stdsigma1_p * e_xi8
  @#for index in ["7", "6", "5", "4", "3", "2", "1"]
    + sqrt(1 - signal_corr_p^2) * signal_corr_p^(@{index} - 0) * stdsigma1_p * e_xi@{index}
  @#endfor
  + sqrt(1-signal_corr_p^2) * stdsigma1_p * e_RS;
  @#else
  log(xi0)=0;
  @#endif  
  


zeta=1; sigma_pref=1; psi=1;


end;

shocks;
var e_A; stderr (1-@{stopshock})*stdA;
var e_G; stderr (1-@{stopshock})*stdG;
var epsilonM; stderr 0;
var e_xi8; stderr 1-@{stopsignal};
var e_xi7; stderr 1-@{stopsignal};
var e_xi6; stderr 1-@{stopsignal};
var e_xi5; stderr 1-@{stopsignal};
var e_xi4; stderr 1-@{stopsignal};
var e_xi3; stderr 1-@{stopsignal};
var e_xi2; stderr 1-@{stopsignal};
var e_xi1; stderr 1-@{stopsignal}; 
var e_RS;  stderr 1-@{stopunant};

// IF STOPSIGNAL=1 THEN ALL STDERR=0
end;


steady;
resid(1); 
check;

options_.nograph        = 0;

stoch_simul(order=1,periods=10000,irf=40) YY CC NeNe sigma_omega spreadspread KK;
%II LabLab RR QQ RnRn PIPPIP OUTGAPOUTGAP RkRk NeNe LeLe phiephie spreadspread bankrupt
