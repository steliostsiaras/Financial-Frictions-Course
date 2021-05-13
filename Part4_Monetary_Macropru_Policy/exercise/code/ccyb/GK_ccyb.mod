var Y K Lab I C R Rk W rK N Uc Q Le D phi  S Lambda Omega T G spread GDP Nw2Ass
X Sinv Sdash spreadA theta

%Shocks
A g psi

%Percentage differences%
YY KK CC LabLab II 
RR RkRk  WW rKrK NN  UcUc QQ DD phiphi TT GG GDP1 spreadspread Loansloans
;

varexo  e_A  e_g e_psi;

parameters  alphha betta gammma chil epsl delta theta_star sigmab 
ksi phiX G_over_Y  psi_k

%AR(1) coefficients 
rhoA rhopsi rhog;


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

load psi_k_value;
set_param_value('psi_k'    ,psi_k); 

phiX     = 1.5;       %% Investment adjustment costs parameter

  
G_over_Y = 0.2;  %% GOvernment spending over GDP

 
theta_star = 0.383;  %% Absconding rate of the bankers
ksi      = 0.003;    %% Start up fund for the new bankers
sigmab   = 0.972; %% Remain probality of the bankers

%%%%%%%%%%%Shocks coeffecients%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rhoA      = 0.95;
rhopsi    = 0.95;
rhog      = 0.95;



model;

%--------------------------------------------------------------------------

%%%%%%%%%PHYSICAL SETUP%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------

% Law of Motion of Capital
K=((1-Sinv)*I+(1-delta)*K(-1));

%
%where
%
X=I/I(-1);
Sinv=phiX*(X-1)^2;
Sdash=2*phiX*(X-1);
K=S*psi;

Q*(1-Sinv-X*Sdash)+Lambda(+1)*Q(+1)*Sdash(+1)*X(+1)^2=1;

% Production Function 
Y = A*((K(-1))^(alphha))*((Lab)^(1-alphha)); 

%--------------------------------------------------------------------------

%%%%%%%%%CONSUMERS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------

%%%Marginal Utility%%% 
Uc = (C*(1-gammma))^(-1) - betta*gammma*(C*(1-gammma))^(-1); 

%%%Sochastic discount factor%%%
Lambda = betta*(Uc)/(Uc(-1));

%%%Euler equation%%%
betta*(Uc(+1)/(Uc))*R = 1;

%%%Wage - Labour Optimality condition%%%
Uc*(1-alphha)*Y = Lab*chil*(Lab^epsl);

%%%Wage%%%
W = (1-alphha)*(Y)/(Lab);

%%%Return on Capital%%%
rK = alphha* (Y/(K(-1)));    

%--------------------------------------------------------------------------

%%%%%%%%%%%%%%%%%BANKS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------

%%%Marginal Value of net Worth%%%
Omega = 1-sigmab+sigmab*theta*phi;

%%%Supply of Loans%%%                                          
Q*S = N*phi; 

%%%Banks Balance Sheet%%%
Q*S = D + N ;  

% Countercyclial requirements according to the credit gap
theta = theta_star + psi_k*((Q*S)/(Y+Y(-1)+Y(-2)+Y(-3)) - steady_state(Q)*steady_state(S)/(4*steady_state(Y)));

%%%Leverage%%%
phi=Lambda(+1)*Omega(+1)*(R(+1))/(theta-(Lambda(+1)*Omega(+1)*spread(+1)));

%%%Net Worth%%%
N = Rk*Q(-1)*(S(-1))*(sigmab+ksi) - sigmab*R*D(-1);       

%%%Real return of capital%%%  
Rk = psi*(rK+(1-delta)*Q)/Q(-1);                                                                          
                           
%--------------------------------------------------------------------------

%%%%%%%%%MARKET CLEARING%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------

%%%Resource Constraint%%%
Y = C+I+G;

%%%Government %%%
G=T;

%%%Government enditures%%%
G = g*G_over_Y*(steady_state(Y));

%--------------------------------------------------------------------------

%%%%%%%%%SPREADS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------

spreadA = Rk(+1)-R;
spread= Rk-R;

%--------------------------------------------------------------------------

%%%%%%%%%SHOCKS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------
%%%Capital quality shock process%%%
log(psi)= rhopsi*log(psi(-1))  - e_psi;

%%%TFP shock process%%%
log(A)    = rhoA*log(A(-1))  + e_A;

%%%Government shock process%%%
log(g)    = rhog*log(g(-1))  + e_g;



%--------------------------------------------------------------------------

%%%%%%%%%REST DEFINITIONS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------

GDP = C + I;

Nw2Ass = N/Le;

Le = Q*S;

%--------------------------------------------------------------------------

%%%%%%%%%PERCENTAGE DIFFERENCES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------


YY=Y/STEADY_STATE(Y);
GDP1 = GDP/STEADY_STATE(GDP);
Loansloans=Le/STEADY_STATE(Le);
KK=K/STEADY_STATE(K);
CC=C/STEADY_STATE(C);
LabLab=Lab/STEADY_STATE(Lab);
II=I/STEADY_STATE(I);
RR=R/STEADY_STATE(R);
RkRk=Rk/STEADY_STATE(Rk);
WW=W/STEADY_STATE(W);
rKrK=rK/STEADY_STATE(rK);
NN=N/STEADY_STATE(N);
UcUc=Uc/STEADY_STATE(Uc);
QQ=Q/STEADY_STATE(Q);
DD=D/STEADY_STATE(D); 
phiphi= phi/STEADY_STATE(phi);
TT= T/STEADY_STATE(T);
GG= G/STEADY_STATE(G);
spreadspread=RkRk(+1)-RR(+1);

end;

steady;

shocks;
var e_psi;
stderr 1;
var e_A;
stderr 1;
 var e_g; 
stderr 1; 
end;


check;
steady;
options_.nograph=1;

stoch_simul(order=1,periods=10000,irf=40)
YY KK CC LabLab II 
RR RkRk  WW rKrK NN  UcUc QQ DD phiphi TT GG GDP1 spreadspread Loansloans
;


