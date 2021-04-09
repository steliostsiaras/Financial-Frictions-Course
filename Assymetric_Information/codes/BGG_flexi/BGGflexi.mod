//                           BGG with Flexible Prices. 

% Runs with Dynare up to 4.5.x

% Match tartgets by calibrating three parameters
% (sigmae,sigma_omega,mon) in order to get
% three targets: phi = 2, p =0.05, rho = 1 + 0.02/4.
% These target-moments are inserted in the SS-file and through the function the 
% three parameters are computed. These three parameters are introduced as
% variables here which are always in their SS-value (see below).

external_function(name=logncdf, nargs=3);

var
// Consumers
C Uc Lambda Lab R
// Firms
Y K W Z A
// Entrepreneurs
Rk Rl Ne phie Le Ce rho 
% p fnGam fnG DGam DG 
rhoRex omega
// Rest
I Q psi G T spread
sigmae sigma_omega sigma_omega_ss mon bankrupt Sg

% Percentage Deviations
YY CC II WW RR QQ RkRk NeNe spreadspread KK
rhorho LabLab phiephie psipsi LeLe

;

varexo 
e_A    % productivity
e_G    % gov spending
e_KQ   % capital quality
e_RS % risk shock
;

parameters  alphha betta gammma chil epsl delta 
ksie eta taf G_over_Y  phiX kpY kpP  els gam sig 
rhosigma rhog;

%mon      = 0.12; // mon=monitoring

%sigmae   = 0.9750;       % Survival Probability
ksie     = 0.0102;       % Start up transfer
%sigma_omega = 0.3136;
%----------------------------------------		
alphha   = 0.33; 		%% Production function
betta    = 0.99;  		%% Time preference
gammma   = 0.500;       %% Habbit parameter
delta    = 0.025;		%% Amortization
chil     = 5.584;		%% Rel. utility weight of labor
epsl     = 0.333;	    %% Inverse Frisch elastitcity
eta      = 1.5;         %% Inverse elasticity of net investment to the price of capital
G_over_Y = 0.2;

rhosigma = 0.97;
rhog     = 0.97;

model;

% Auxiliary expressions.  These simplify the equations without adding
% additional variables.

# p      = logncdf(omega,-0.5*(sigma_omega)^2,sigma_omega);
# p1     = logncdf(omega(+1),-0.5*(sigma_omega)^2,sigma_omega);
# fnG    = 1 - normcdf((0.5*(sigma_omega)^2 -log(omega))/sigma_omega,0,1); 
# fnG1   = 1 - normcdf((0.5*(sigma_omega)^2 -log(omega(+1)))/sigma_omega,0,1); %39
# fnGam  = fnG+omega*(1-p);
# fnGam1 = fnG1+omega(+1)*(1-p1);
# DGam   = (1-p);
# DGam1  = (1-p1);
# DG     = 1/(omega*sigma_omega*sqrt(2*(4*atan(1))))*exp(-(log(omega)
           +.5*(sigma_omega)^2)^2/(2*(sigma_omega)^2));
# DG1    = 1/(omega(+1)*sigma_omega*sqrt(2*(4*atan(1))))*exp(-(log(omega(+1))
        +.5*(sigma_omega)^2)^2/(2*(sigma_omega)^2));

%:::CONSUMERS:::




%:::Marginal Utility::: 1
Uc = (C*(1-gammma))^(-1) -betta*gammma*(C*(1-gammma))^(-1);

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
Z = alphha*Y/(K(-1)*psi); 


%:::CAPITAL GOODS PRODUCERS:::




%:::Law of Motion of Capital::: 8
K = psi*(I+(1-delta)*K(-1)); 

%:::Available Capital net of monitoring costs::: 9
//K = (1-fnG*mon)*K;

%:::Price of Capital Goods::: 10
Q = 1 + eta/2*(I/(I(-1))-1)^2+eta*(I/(I(-1))-1)*(I)/((I(-1)))-
((Lambda(+1)))*eta*(((I(+1))/(I))-1)*((I(+1))/(I))^2;


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

%:::Zero profit Condition::: 16
//((Q(-1)*K(-1))/(Ne(-1))*Rk*(fnGam-mon*fnG)) = R*((Q(-1)*K(-1)/(Ne(-1)))-1);                                  
//phie*Rk(+1)*(fnGam1-mon*fnG1)=R(+1)*(phie-1);
K(-1)*( 1 - (Rk/R(-1))*(fnGam-mon*fnG)) - Ne(-1);

%:::Idiosyncratic Shock::: 17
//Rl*(Le)/(Rk*Q(-1)*K(-1)) = omega;    //psi here  ,Rk(+1)           
//omega = Rl(-1)*(Q(-1)*K(-1)-Ne(-1))/(Rk*Q(-1)*K(-1));
omega = Rl*(Le(-1))/(Rk*Q(-1)*K(-1));

rho   = (DGam/((fnGam-mon*fnG)*DGam+(1-fnGam)*(DGam-mon*DG)));

%:::Interest rate wedge::: 24
rhoRex = rho*R;
Rk(+1) = rhoRex(+1);  


%:::Resource Constraint::: 25
Y = C + Ce + G + I*(1+(eta/2)*((I/I(-1))-1)^2) + mon*fnG*Rk*Q(-1)*K(-1);
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
log(sigma_omega / sigma_omega_ss) = rhosigma * log(sigma_omega(-1) / sigma_omega_ss)  + e_RS*0.07;

% Capital Quality Shock
log(psi) = rhog*log(psi(-1)) + e_KQ;

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
%Calibration of banking parameters%
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
resid(1); 
check;

options_.nograph        = 1;

stoch_simul(order=1,periods=10000,irf=40) ;
%YY CC II LabLab RR QQ RkRk NeNe LeLe phiephie spreadspread bankrupt
%NeNe sigma_omega spreadspread;
