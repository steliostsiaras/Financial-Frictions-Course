function [ys,check]=RBC1_steadystate(ys,exe);

global M_
%% DO NOT CHANGE THIS PART.
%%
%% Here we load the values of the deep parameters in a loop.
%%
NumberOfParameters = M_.param_nbr;                            % Number of deep parameters.
for i = 1:NumberOfParameters                                  % Loop...
  paramname = deblank(M_.param_names(i,:));                   %    Get the name of parameter i. 
  eval([ paramname ' = M_.params(' int2str(i) ');']);         %    Get the value of parameter i.
end                                                           % End of the loop.  
check = 0;

%% THIS BLOCK IS MODEL SPECIFIC.
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
NumberOfParameters = M_.param_nbr;                            % Number of deep parameters.
for i = 1:NumberOfParameters                                  % Loop...
  paramname = deblank(M_.param_names(i,:));                   %    Get the name of parameter i. 
  eval(['M_.params(' int2str(i) ') = ' paramname ';']);       %    Get the value of parameter i.
end   
%% DO NOT CHANGE THIS PART.
%%
%% Here we define the steady state vZNues of the endogenous variables of
%% the model.
%%
NumberOfEndogenousVariables = M_.endo_nbr;                    % Number of endogenous variables.
ys = zeros(NumberOfEndogenousVariables,1);                    % Initialization of ys (steady state).
for i = 1:NumberOfEndogenousVariables                         % Loop...
  varname = deblank(M_.endo_names(i,:));                      %    Get the name of endogenous variable i.                     
  eval(['ys(' int2str(i) ') = ' varname ';']);                %    Get the steady state vZNue of this variable.
end                                                           % End of the loop.
%%

