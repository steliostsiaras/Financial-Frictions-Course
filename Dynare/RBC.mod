% Endogenous Variables%
%%%%%%%%%%%%%%%%%%%%%%%
var   U UC UH R C  W H Y   K  I  tax
A G X Q Z1 RR YY CC HH WW II KK KY IY CY
RK LAMBDA;


%Exogenous Variables%
%%%%%%%%%%%%%%%%%%%%%
varexo epsA epsG;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%DECLARATION OF PARAMETERS%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parameters cy gy iy H_bar varrho alp  betta delta sigma_c rhoA rhoG A_bar sigma phiX;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%SETTING OF PARAMETERS%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cy=0.6;
gy=0.2;
iy=0.2;
H_bar=0.33;//target ss hours worked
alp=0.7;
varrho=alp*(1-H_bar)/(alp*(1-H_bar)+cy*H_bar);//Calibrated to hit H=H_bar in steady state
betta=0.99;
delta=(1/betta-1)*iy/(1-alp-iy);//Calibrated to hit iy and R=1/betta in steady state
sigma_c=2.0;
phiX=2.0;

%
%Choice of Units
%
A_bar=1;
%
%shock persistence
%
rhoA=0.75;
rhoG=0.75;
%
%shock scaling  parameter
%
sigma=0.01;//for order 2 or 3 stochastic simulations 

//
// ----------------------------
// *** DSGE-Model-equations ***
// ----------------------------
model;


%%%%%%%%%%%%%%%%%%%%%%%%%
%%Single period utility%%
%%%%%%%%%%%%%%%%%%%%%%%%%
U=(((C^(1-varrho))*((1-H)^varrho))^(1-sigma_c)-1)/(1-sigma_c);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Marginal utility of consumption%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
UC=(1-varrho)*(C^((1-varrho)*(1-sigma_c)-1))*((1-H)^(varrho*(1-sigma_c)));
UH=-varrho*(C^((1-varrho)*(1-sigma_c)))*((1-H)^(varrho*(1-sigma_c)-1));

%%%%%%%%%%%%%%%%%%
%%Euler equation%%
%%%%%%%%%%%%%%%%%%
//UC=betta*R*UC(+1);//OR
LAMBDA(+1)*R=1;

%%%%%%%%%%%%%%%%%%%%%
%%Labour supply foc%%
%%%%%%%%%%%%%%%%%%%%%
-UH/UC=W;



%%%%%%%%%%%%%%%%%%%%%%%
%%Production Function%%
%%%%%%%%%%%%%%%%%%%%%%%
Y=((A*H)^alp)*(K(-1))^(1-alp);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Wholesale firms FOC for labour%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alp*Y/H=W;

%%%%%%%%%%%%%%%%%%%%%%%
%%Resource constraint%%
%%%%%%%%%%%%%%%%%%%%%%%
Y=C+G+I;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Capital law of motion%%%%%
%%Costs of investment case%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X=I/I(-1);
K=I*(1-phiX*(X-1)^2)+(1-delta)*K(-1);

%%%%%%%%%%%%%
%%Tobin's Q%%
%%%%%%%%%%%%%
%
%Stochastic Discount Factor
%
LAMBDA=betta*UC/UC(-1);
Z1=2*phiX*(X-1)*X^2*Q*LAMBDA;
Q*(1-phiX*(X-1)^2-X*2*phiX*(X-1))+Z1(+1)=1;
RK=((1-alp)*Y/K(-1)+(1-delta)*Q)/Q(-1);
LAMBDA(+1)*RK(+1)=LAMBDA(+1)*R;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Balance budget constraint%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
G=H*W*tax;


%%%%%%%%%%%%%%%%%%%
%%Shock processes%%
%%%%%%%%%%%%%%%%%%%
log(A)-log(STEADY_STATE(A))=rhoA*(log(A(-1))-log(STEADY_STATE(A)))+sigma*epsA;
log(G)-log(STEADY_STATE(G))=rhoG*(log(G(-1))-log(STEADY_STATE(G)))+sigma*epsG;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Variables in deviation form%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
YY=Y/STEADY_STATE(Y);
KK=K/STEADY_STATE(K);
II=I/STEADY_STATE(I);
CC=C/STEADY_STATE(C);
WW=W/STEADY_STATE(W);
HH=H/STEADY_STATE(H);
RR=R/STEADY_STATE(R);

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
steady_state_model;

A=A_bar;
R=1.0/betta;
KY=(1-alp)/(R-1+delta);
IY=(1-alp)*delta/(R-1+delta);
CY=1-IY-gy;
H=(1-varrho)*alp/(varrho*CY+(1-varrho)*alp);
Y=A*H*KY^((1-alp)/alp);
K=KY*Y;
I=IY*Y;
C=CY*Y;
G=gy*Y;
W=alp*Y/H;
tax=G/(W*H);
U=1/(1-sigma_c)*(C^((1-varrho)*(1-sigma_c))*(1-H)^(varrho*(1-sigma_c))-1);
UC=(1-varrho)*C^((1-varrho)*(1-sigma_c)-1)*(1-H)^(varrho*(1-sigma_c));
UH=-varrho*(C^((1-varrho)*(1-sigma_c)))*((1-H)^(varrho*(1-sigma_c)-1));

LAMBDA=betta;
%
%Additional ss for Invest Costs
%
Q=1;
X=1;
Z1=2*phiX*(X-1)*X^2*Q/(R);
RK=R;
%
%
%
YY=1;
CC=1;
HH=1;
WW=1; 
II=1; 
KK=1;
RR=1;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%SPECIFICATION OF SHOCKS%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
shocks;
var epsA; stderr 1;
var epsG; stderr 1;
end;


steady;

check;


stoch_simul(order=2,irf=40) YY CC II HH WW RR Q;

