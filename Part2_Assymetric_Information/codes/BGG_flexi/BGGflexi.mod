   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Part of the Financial Frictions Course by Stelios Tsiaras %%
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//                           BGG with Flexible Prices. 

% Runs with Dynare 4.6.x

% Match tartgets by calibrating three parameters
% (sigmae,sigma_omega,mon) in order to get
% three targets: phi = 2, p =0.03, rho = 1 + 0.02/4.
% These target-moments are inserted in the SS-file and through the function the 
% three parameters are computed. These three parameters are introduced as
% variables here which are always in their SS-value (see below).

external_function(name=logncdf, nargs=3);

var
// Consumers
C Uc Lambda Lab R
// Firms
Y K W A rK
// Entrepreneurs
Rk Z Ne phie Le Ce rho 
% p fnGam fnG DGam DG 
rhoRex omega
// Rest
I Q psi G T spread
sigmae sigma_omega sigma_omega_ss mon bankrupt Sg X S Sdash

p fnG fnGam DGam DG
% Percentage Deviations
YY CC II WW RR QQ RkRk NeNe spreadspread KK
rhorho LabLab phiephie psipsi LeLe

;

varexo 
e_A    % productivity
e_G    % gov spending
e_KQ   % capital quality
e_RS   % risk shock
;

parameters  alphha betta gammma chil epsl delta 
ksie phiX  G_over_Y   
rhosigma rhog;

ksie     = 0.0102;       % Start up transfer
%----------------------------------------		
alphha   = 0.33; 		%% Production function
betta    = 0.99;  		%% Time preference
gammma   = 0.500;       %% Habbit parameter
delta    = 0.025;		%% Amortization
chil     = 5.584;		%% Rel. utility weight of labor
epsl     = 0.333;	    %% Inverse Frisch elastitcity
phiX     = 1;           %% Inverse elasticity of net investment to the price of capital
G_over_Y = 0.2;

rhosigma = 0.97;
rhog     = 0.97;

model;


%:::CONSUMERS:::




%:::Marginal Utility::: 1
Uc =  (C-gammma*C(-1))^(-1) -betta*gammma*(C(+1)-gammma*C)^(-1);

%:::Stochastic discount factor::: 2
Lambda = betta*(Uc)/(Uc(-1));

%:::Euler equation::: 3
Lambda(+1)*R = 1;

%:::Wage - Labour Optimality condition::: 4
Uc*(1-alphha)*Y = Lab*chil*(Lab^epsl);


%:::FIRMS:::%




%:::Production Function::: 5
Y = A*((psi*K(-1))^(alphha))*Lab^(1-alphha);

%:::Wage::: 6
W = (1-alphha)*Y/Lab;

%:::Return on Capital::: 7
rK = alphha*Y/(K(-1)*psi); 


%:::CAPITAL GOODS PRODUCERS:::




%:::Law of Motion of Capital::: 8
K=((1-S)*I+(1-delta)*K(-1));
%
%where
%

X=I/I(-1);
S=phiX*(X-1)^2;
Sdash=2*phiX*(X-1);


%:::Price of Capital Goods::: 10
Q*(1-S-X*Sdash)+Lambda(+1)*Q(+1)*Sdash(+1)*X(+1)^2=1;


p     = logncdf(omega,-0.5*(sigma_omega)^2,sigma_omega);
fnG   = 1 - normcdf((0.5*(sigma_omega)^2 -log(omega))/sigma_omega,0,1); %39
fnGam = fnG+omega*(1-p);
DGam  = (1-p);
DG    = 1/(omega*sigma_omega*sqrt(2*(4*atan(1))))*exp(-(log(omega)
        +.5*(sigma_omega)^2)^2/(2*(sigma_omega)^2));

%:::ENTREPRENEURS:::





%:::Real return of capital::: 11
Rk = psi*(rK+(1-delta)*Q)/Q(-1);

%:::Balance Sheet::: 12
Q*K= Le + Ne;

%:::Net Worth::: 13
Ne = (sigmae+ksie)*(1-fnGam)*Rk*Q(-1)*K(-1);   

%:::Consumption:::  14                    
Ce = (1-ksie)*(1-sigmae)*(1-fnGam)*Rk*Q(-1)*K(-1);

%:::Leverage::: 15
Ne*phie = Q*K;

%incentive compatibility constraint
phie*Rk(+1)*(fnGam(+1)-mon*fnG(+1))=R(+1)*(phie-1); 

%threshold omega value, omega= omega_bar
omega = Z(-1)*(Q(-1)*K(-1) - Ne(-1))/(Rk*Q(-1)*K(-1));

rho   = (DGam/((fnGam-mon*fnG)*DGam+(1-fnGam)*(DGam-mon*DG)));

%:::Interest rate wedge::: 24
rhoRex = rho*R;
Rk(+1) = rhoRex(+1);  


%:::Resource Constraint::: 25
Y = C + Ce + G + I + mon*fnG*Rk*Q(-1)*K(-1);
G = T; 
G = G_over_Y*(steady_state(Y));
spread = Rk(+1)-R;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Shock equations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Productivity Shock
log(A) = 0.75*log(A(-1)) + e_A;

% Government Spending Shock
log(Sg) = rhog*log(Sg(-1)) + e_G;

% Risk Shock
log(sigma_omega / sigma_omega_ss) = rhosigma * log(sigma_omega(-1) / sigma_omega_ss)  + e_RS;

% Capital Quality Shock
log(psi) = rhog*log(psi(-1)) - e_KQ;

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
spreadspread=RkRk(+1)-RR(+1);
NeNe=Ne/STEADY_STATE(Ne);
rhorho=rho/STEADY_STATE(rho);
psipsi=psi/STEADY_STATE(psi);
phiephie=phie/STEADY_STATE(phie);
LeLe = Le/STEADY_STATE(Le);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calibration of financiial sector parameters%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sigmae=STEADY_STATE(sigmae);
sigma_omega_ss=STEADY_STATE(sigma_omega);
mon=STEADY_STATE(mon);

end;

shocks;
var e_A; stderr 1;
var e_G; stderr 1;
var e_KQ; stderr 1;
var e_RS; stderr 1;
end;


steady;

options_.nograph   = 0;

stoch_simul(order=1,periods=10000,irf=40) 
YY CC II LabLab RR QQ RkRk NeNe LeLe phiephie spreadspread bankrupt ;
%NeNe sigma_omega spreadspread;
