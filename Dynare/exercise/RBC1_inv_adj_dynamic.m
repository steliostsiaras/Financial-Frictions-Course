function [residual, g1, g2, g3] = RBC1_inv_adj_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(21, 1);
T41 = y(12)^params(5);
T42 = y(16)*T41;
T45 = y(2)^(1-params(5));
T75 = 1-params(15)*(y(25)-1)^2;
T92 = y(30)^2;
T95 = 2*params(15)*(y(30)-1)*T92*y(31);
lhs =y(6);
rhs =log(y(10))-params(13)*y(12)^(1+params(14))/(1+params(14));
residual(1)= lhs-rhs;
lhs =y(7);
rhs =1/y(10);
residual(2)= lhs-rhs;
lhs =y(8);
rhs =(-params(13))*y(12)^params(14);
residual(3)= lhs-rhs;
lhs =y(7);
rhs =params(7)*y(9)*y(27);
residual(4)= lhs-rhs;
lhs =(-y(8))/y(7);
rhs =y(11);
residual(5)= lhs-rhs;
lhs =y(13);
rhs =T42*T45;
residual(6)= lhs-rhs;
lhs =y(13)*params(5)/y(12);
rhs =y(11);
residual(7)= lhs-rhs;
lhs =y(13)*(1-params(5))/y(2);
rhs =y(23);
residual(8)= lhs-rhs;
lhs =y(22);
rhs =(y(23)+(1-params(8))*y(26))/y(5);
residual(9)= lhs-rhs;
lhs =y(13);
rhs =y(10)+y(17)+y(15);
residual(10)= lhs-rhs;
lhs =y(14);
rhs =y(15)*T75+y(2)*(1-params(8));
residual(11)= lhs-rhs;
lhs =y(25);
rhs =y(15)/y(3);
residual(12)= lhs-rhs;
lhs =y(26)*(T75-(y(25)-1)*params(15)*2*y(25))+T95*y(29);
rhs =1;
residual(13)= lhs-rhs;
lhs =y(24);
rhs =y(7)*params(7)/y(1);
residual(14)= lhs-rhs;
lhs =y(29)*y(28);
rhs =y(9)*y(29);
residual(15)= lhs-rhs;
lhs =y(17);
rhs =y(13)*params(6);
residual(16)= lhs-rhs;
lhs =y(18);
rhs =y(17);
residual(17)= lhs-rhs;
lhs =log(y(16))-log((steady_state(11)));
rhs =params(9)*(log(y(4))-log((steady_state(11))))+params(12)*x(it_, 1);
residual(18)= lhs-rhs;
lhs =y(19);
rhs =y(14)/y(13);
residual(19)= lhs-rhs;
lhs =y(20);
rhs =y(15)/y(13);
residual(20)= lhs-rhs;
lhs =y(21);
rhs =y(10)/y(13);
residual(21)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(21, 32);

  %
  % Jacobian matrix
  %

  g1(1,6)=1;
  g1(1,10)=(-(1/y(10)));
  g1(1,12)=params(13)*getPowerDeriv(y(12),1+params(14),1)/(1+params(14));
  g1(2,7)=1;
  g1(2,10)=(-((-1)/(y(10)*y(10))));
  g1(3,8)=1;
  g1(3,12)=(-((-params(13))*getPowerDeriv(y(12),params(14),1)));
  g1(4,7)=1;
  g1(4,27)=(-(params(7)*y(9)));
  g1(4,9)=(-(params(7)*y(27)));
  g1(5,7)=y(8)/(y(7)*y(7));
  g1(5,8)=(-1)/y(7);
  g1(5,11)=(-1);
  g1(6,12)=(-(T45*y(16)*getPowerDeriv(y(12),params(5),1)));
  g1(6,13)=1;
  g1(6,2)=(-(T42*getPowerDeriv(y(2),1-params(5),1)));
  g1(6,16)=(-(T41*T45));
  g1(7,11)=(-1);
  g1(7,12)=(-(y(13)*params(5)))/(y(12)*y(12));
  g1(7,13)=params(5)/y(12);
  g1(8,13)=(1-params(5))/y(2);
  g1(8,2)=(-(y(13)*(1-params(5))))/(y(2)*y(2));
  g1(8,23)=(-1);
  g1(9,22)=1;
  g1(9,23)=(-(1/y(5)));
  g1(9,5)=(-((-(y(23)+(1-params(8))*y(26)))/(y(5)*y(5))));
  g1(9,26)=(-((1-params(8))/y(5)));
  g1(10,10)=(-1);
  g1(10,13)=1;
  g1(10,15)=(-1);
  g1(10,17)=(-1);
  g1(11,2)=(-(1-params(8)));
  g1(11,14)=1;
  g1(11,15)=(-T75);
  g1(11,25)=(-(y(15)*(-(params(15)*2*(y(25)-1)))));
  g1(12,3)=(-((-y(15))/(y(3)*y(3))));
  g1(12,15)=(-(1/y(3)));
  g1(12,25)=1;
  g1(13,29)=T95;
  g1(13,25)=y(26)*((-(params(15)*2*(y(25)-1)))-(params(15)*2*y(25)+(y(25)-1)*2*params(15)));
  g1(13,30)=y(29)*y(31)*(2*params(15)*T92+2*params(15)*(y(30)-1)*2*y(30));
  g1(13,26)=T75-(y(25)-1)*params(15)*2*y(25);
  g1(13,31)=2*params(15)*(y(30)-1)*T92*y(29);
  g1(14,1)=(-((-(y(7)*params(7)))/(y(1)*y(1))));
  g1(14,7)=(-(params(7)/y(1)));
  g1(14,24)=1;
  g1(15,9)=(-y(29));
  g1(15,28)=y(29);
  g1(15,29)=y(28)-y(9);
  g1(16,13)=(-params(6));
  g1(16,17)=1;
  g1(17,17)=(-1);
  g1(17,18)=1;
  g1(18,4)=(-(params(9)*1/y(4)));
  g1(18,16)=1/y(16);
  g1(18,32)=(-params(12));
  g1(19,13)=(-((-y(14))/(y(13)*y(13))));
  g1(19,14)=(-(1/y(13)));
  g1(19,19)=1;
  g1(20,13)=(-((-y(15))/(y(13)*y(13))));
  g1(20,15)=(-(1/y(13)));
  g1(20,20)=1;
  g1(21,10)=(-(1/y(13)));
  g1(21,13)=(-((-y(10))/(y(13)*y(13))));
  g1(21,21)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],21,1024);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],21,32768);
end
end
end
end
