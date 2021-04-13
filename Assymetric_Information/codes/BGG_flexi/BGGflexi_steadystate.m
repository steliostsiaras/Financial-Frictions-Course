%% This is the MATLAB program to find the steady state in BGG
%% It takes the parameters from the DYNARE BGG.mod and gives the steady state
%%
%%
function [ys,params,check] = BGGflexi_steadystate(ys,exo,M_,options_)

NumberOfParameters = M_.param_nbr;
for ii = 1:NumberOfParameters
  paramname = M_.param_names{ii};
  eval([ paramname ' = M_.params(' int2str(ii) ');']);
end
% initialize indicator
check = 0;


%% THIS BLOCK IS MODEL SPECIFIC.
%%
%% Here the user has to define the steady state.
%


R            = 1/betta;
Lambda       = betta;

% Targets
p_mom        =  0.03;     %Steady state default. 3% default quarterly. 

p            = p_mom;
rho          =  1 + 0.02/4; %0.02/4; %    %steady state premium
phie_mom     =   2; 
phie         = phie_mom;

%% Calibrating the model with targets phi,rho,default...
%%
x0=[0.98,0.3, 0.49, 0.008, 0.98, 0.30, 0.2, 0.49];
fun = @(c) myfun_BGG_calib(c,p_mom,ksie,rho,phie_mom,R);
options=optimset('MaxFunEvals',1000);
c     = fsolve(fun,x0,options);
sigmae  = c(1);
sigma_omega_ss = c(2);
fnGam = c(3);
fnG   = c(4);
DGam  = c(5);
DG    = c(6);
mon   = c(7);
omega  = exp(c(8));

%% Steady state

%Entrepreneur
Rk=(1/betta)*rho;
Ne_over_K=1/phie;
Loans_over_K=1-Ne_over_K;
Rl=omega*Rk*(Loans_over_K)^-1;
Z=Rk+delta-1;

%Consumer
L_over_K=(Z/(alphha))^(1/(1-alphha));
Ce_over_K=(1-ksie)*(1-sigmae)*(1-fnGam)*Rk;
C_over_K=0.8*(L_over_K)^(1-alphha)-delta-mon*fnG*Rk-Ce_over_K;
Y_over_K=(C_over_K+Ce_over_K+delta+mon*fnG*Rk)*0.8^(-1);
Y_over_C=(Y_over_K)/(C_over_K);
Lab= ((1-betta*gammma)*(1-alphha)*Y_over_C/(chil*(1-gammma)))^(1/(1+epsl)); 
K  = (Y_over_K/Lab^(1-alphha))^(1/(alphha-1));


%Finding the variables
Lab=L_over_K*K;
Ce=Ce_over_K*K;
C=C_over_K*K;
Y=Y_over_K*K;
Le=Loans_over_K*K;
Ne=Ne_over_K*K;
I=delta*K;

%Rest variables
W=(1-alphha)*Y/Lab;
Uc=(C*(1-gammma))^(-1) -betta*gammma*(C*(1-gammma))^(-1);
Q=1;
psi=1;
G=0.2*Y;

T=G;
rhoRex=rho*R;
A=1;
YY=1;   Loansloans=1; A=1; YY=1; Loansloans=1; KK=1; CC=1; LabLab=1; II=1; RR=1; RkRk=1; RlRl=1;
WW=1; ZZ=1;  NeNe=1; UcUc=1; QQ=1;phiephie=1;  TT=1; GG=1; rhorho=1; 
pp=1; rhoRexrhoRex=1; spreadRkR=RkRk-RR;
spreadRlR=RlRl-RR; premium =Rk-R;  S=0; Sdash=0; premiumpremium=Rk-R;
sigma_pref=1;
zeta=1;
A=1;
psi=1;
spread = Rk-R;

sigma_omega= sigma_omega_ss;
bankrupt = p;
Sg=1;


YY=1;
KK=1;
II=1;
CC=1;
WW=1;
LabLab=1;
QQ=1;
RR=1;
RkRk=1;
RnRn=1;
PIPPIP=1;
spreadspread=0;
NeNe=1;
rhorho=1;
psipsi=1;
phiephie=1;
OUTGAPOUTGAP=1;
LeLe =1;
%% END OF THE MODEL SPECIFIC BLOCK.

%% DO NOT CHANGE THIS PART.
%%
%% Store model parameters
params=NaN(NumberOfParameters,1);
for iter = 1:length(M_.params) %update parameters set in the file
  eval([ 'params(' num2str(iter) ') = ' M_.param_names{iter} ';' ])
end

NumberOfEndogenousVariables = M_.orig_endo_nbr; %auxiliary variables are set automatically
for ii = 1:NumberOfEndogenousVariables
  varname = M_.endo_names{ii};
  eval(['ys(' int2str(ii) ') = ' varname ';']);
end

end                                                  % End of the loop.
%%



