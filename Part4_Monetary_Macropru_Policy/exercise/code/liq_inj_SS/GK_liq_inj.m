   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Part of the Financial Frictions Course by Stelios Tsiaras %%
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%compute the steady state of NK Model 
%--------------------------------------------------------------------------
%Economy
%--------------------------------------------------------------------------		
 alphha  = 0.33;     %%Production function

 betta   = 0.99;      %% Time preference

gammma   = 0.50;    %% Habbit parameter

 delta   = 0.025;		%% Depreciation of capital
 
 chil    = 5.584;		%% Rel. utility weight of labor

  epsl   = 0.33;	    %% Inverse Frisch elastitcity

%--------------------------------------------------------------------------
%Banks
%--------------------------------------------------------------------------
psi_k=0.5;
phiX     = 1.5;       %% Investment adjustment costs parameter

  
G_over_Y = 0.2;  %% GOvernment spending over GDP

 
theta = 0.383;  %% Absconding rate of the bankers
ksi      = 0.003;    %% Start up fund for the new bankers
sigmab   = 0.972; %% Remain probality of the bankers
omega=0.5;
chim=0.001;
%% Basics
R=1/betta;
%% Banker Solution (GK)
%%
R_1=[1.0122, 3.55];
%%Solution for the Loan Interest Rate(1) and phi(2) on SS%%
%%Uses function determined by the solution of SS divided by K.Solves a system%%
fun = @(c) myfun_GK_liq_inj(c,sigmab,ksi,betta,theta,omega,chim);
options=optimset('MaxFunEvals',10000,'MaxIter',10000,'Display','off');
c=fsolve(fun,R_1,options);

Rk=c(1);
phi=c(2);
Rm = omega*Rk +(1-omega)*R;
%%

N_over_K   = 1/phi;
Omega      = (1-sigmab)+sigmab*phi*theta;
D_over_K   = 1 - N_over_K;
rK          = Rk+delta-1;
L_over_K   = (rK/alphha)^(1/(1-alphha));
C_over_K   = (1-G_over_Y)*(L_over_K)^(1-alphha)-delta;
Y_over_K   = (C_over_K+delta)/(1-G_over_Y);
Y_over_C   = (Y_over_K)/(C_over_K);
Lab        = ((1-betta*gammma)*(1-alphha)*Y_over_C/(chil*(1-gammma)))^(1/(1+epsl)); 
K          = (Y_over_K/(Lab^(1-alphha)))^(1/(alphha-1));

%Having found K, we find the other variables tha were transformed in terms of K
%------------------------------------------------------------------------------

D      = D_over_K*K;
N      = N_over_K*K;
C      = C_over_K*K;
Y      = Y_over_K*K;
I      = delta*K;
W      = (1-alphha)*Y/Lab;
psi    = 1;
A      = 1;
xi     = 1;
Lambda = betta;
Q      = 1;
G      = G_over_Y*Y;
Le     = Q*K;
T      = G;
Uc     = (C*(1-gammma))^(-1) -betta*gammma*(C*(1-gammma))^(-1);
S      = K;
GDP= C+I;
spread  = Rk-R;
spreadA  = Rk-R;
RkRk=1;RR=1;
spreadspread=RkRk-RR;
vt         = betta*Omega*R;
mu         = betta*Omega*(Rk-R);

X=1;
Sinv=0;
Sdash=0;
Q=1;


YY=1;   Loansloans=1; YY=1; Loansloans=1; KK=1; CC=1; LabLab=1; II=1; RR=1; RkRk=1; RlRl=1;
WW=1; rKrK=1; NN=1;  UcUc=1; QQ=1; DD=1; phiphi=1; D_hD_h=1; TT=1; GG=1; GDP1=1;
spreadRkR=RkRk-RR;
CMR=1; premiumpremium=RkRk-RR; Nw2Ass = N/Le;
nws=1; g=1; zeta=1; sigma_pref=1;


