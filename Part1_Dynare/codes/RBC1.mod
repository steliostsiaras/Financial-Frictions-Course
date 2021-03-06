
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Part of the Financial Frictions Course by Stelios Tsiaras %%
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

@#define SS_block=0
% 0 for SS matlab file
% 1 for analytical SS block in the model

% Endogenous Variables %
%%%%%%%%%%%%%%%%%%%%%%%%
var U UC UH R C W H Y K I A G T KY IY CY RK rK LAMBDA ;

% Exogenous Variables %
%%%%%%%%%%%%%%%%%%%%%%%
varexo epsA;

% Parameters %
%%%%%%%%%%%%%%
parameters cy iy ky
H_bar alp gy betta delta rhoA A_bar sigma omega phi;

% Parameter Values %
%%%%%%%%%%%%%%%%%%%%

gy    = 0.2;  % G/Y in SS
H_bar = 0.33; % target ss hours worked
alp   = 0.7;  % labour share
betta = 0.99; % discount factor
phi   = 1;    % inverse Frisch labor elasticity 
delta = 0.025;%(1/betta-1)*iy/(1-alp-iy);//Calibrated to hit iy and R=1/betta in steady state
r     = 1/betta; % R in SS, we need this to calibrate omega
ky    = (1-alp)/(r-1+delta); % we need this to calibrate omega
iy    = (1-alp)*delta/(r-1+delta); % we need this to calibrate omega
cy    = 1-iy-gy; % we need this to calibrate omega

% calibrate omega from the labour FOC to reach H_bar
omega = alp * cy^(-1) * (1/H_bar^(1+phi)); % weight parameter of labor 

A_bar=1;

%shock persistence
rhoA=0.75;

%shock scaling  parameter
sigma=0.01; //for order 2 or 3 stochastic simulations 

% DSGE equations %
%%%%%%%%%%%%%%%%%%

model;

[name = 'Utility']
U =log(C) - omega*(H^(1+phi))/(1+phi);

[name = 'Marginal utility of consumption']
UC = 1/C;

[name = 'Marginal disutility of labour']
UH = - omega*H^phi;

[name = 'Euler equation']
UC = betta*R*UC(+1);

[name = 'Labour supply FOC']
-UH/UC = W;

[name = 'Production Function']
Y=A*(H^alp)*(K(-1))^(1-alp);

[name = 'MPL']
alp*Y/H=W;

[name = 'MPK']
(1-alp)*Y/K(-1)=rK;

[name = 'Gross Rate']
RK = rK + (1-delta);

[name = 'Resource Cosntraint']
Y=C+G+I;

[name = 'Law of Motion for capital']
K = I + (1-delta)*K(-1);

[name = 'Stochastic Discount Factor']
LAMBDA=betta*UC/UC(-1);

[name = 'Arbitrage']
LAMBDA(+1)*RK(+1)=LAMBDA(+1)*R;

[name = 'Government Spending']
G=gy*Y;

[name = 'Taxes']
T = G;

% Shock processes %
%%%%%%%%%%%%%%%%%%%
[name = 'TFP process']
log(A)-log(STEADY_STATE(A))=rhoA*(log(A(-1))-log(STEADY_STATE(A)))+sigma*epsA;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Convert to per GDP-Variables used in steady state
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
KY=K/Y;
IY=I/Y;
CY=C/Y;
end;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%ANALYTICAL STEADY-STATE COMPUTATION%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
@#if  SS_block==1

steady_state_model;

A=A_bar;
R=1.0/betta;
KY=(1-alp)/(R-1+delta);
IY=(1-alp)*delta/(R-1+delta);
CY=1-IY-gy;
H = ((1/omega)*alp/(CY))^(1/(1+phi));
Y=A*H*KY^((1-alp)/alp);
G=gy*Y;
T = G;
K=KY*Y;
I=IY*Y;
C=CY*Y;
W=alp*Y/H;
rK = (1-alp)*Y/K;
RK = (1-alp)*Y/K +(1-delta);
U  = log(C) - omega*(H^(1+phi))/(1+phi);
UC = 1/C;
UH = -omega*H^phi;
LAMBDA=betta;

end;

@#endif

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%SPECIFICATION OF SHOCKS%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
shocks;
var epsA; stderr 1;
end;

steady;

check;

stoch_simul(order=1,irf=40) Y C I H W R;