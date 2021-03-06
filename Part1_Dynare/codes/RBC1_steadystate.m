function [ys,params,check] = RBC1_steadystate(ys,exo,M_,options_)

NumberOfParameters = M_.param_nbr;
for ii = 1:NumberOfParameters
  paramname = M_.param_names{ii};
  eval([ paramname ' = M_.params(' int2str(ii) ');']);
end
% initialize indicator
check = 0;
%%

%% THIS BLOCK IS MODEL SPECIFIC.
%%
%% Here the user has to define the steady state.
%%
%% Here the user has to define the steady state.


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
%%                                                         % End of the loop.


