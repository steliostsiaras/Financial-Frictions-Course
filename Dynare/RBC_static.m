function [residual, g1, g2, g3] = RBC_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 28, 1);

%
% Model equations
%

T12 = y(5)^(1-params(5));
T15 = (1-y(7))^params(5);
T16 = T12*T15;
T27 = (1-params(5))*y(5)^((1-params(5))*(1-params(9))-1);
T29 = (1-y(7))^(params(5)*(1-params(9)));
T35 = (-params(5))*y(5)^((1-params(5))*(1-params(9)));
T37 = (1-y(7))^(params(5)*(1-params(9))-1);
T52 = (y(7)*y(12))^params(6);
T55 = y(9)^(1-params(6));
T72 = 1-params(14)*(y(14)-1)^2;
T86 = y(14)^2;
lhs =y(1);
rhs =(T16^(1-params(9))-1)/(1-params(9));
residual(1)= lhs-rhs;
lhs =y(2);
rhs =T27*T29;
residual(2)= lhs-rhs;
lhs =y(3);
rhs =T35*T37;
residual(3)= lhs-rhs;
lhs =y(28)*y(4);
rhs =1;
residual(4)= lhs-rhs;
lhs =(-y(3))/y(2);
rhs =y(6);
residual(5)= lhs-rhs;
lhs =y(8);
rhs =T52*T55;
residual(6)= lhs-rhs;
lhs =y(8)*params(6)/y(7);
rhs =y(6);
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(5)+y(13)+y(10);
residual(8)= lhs-rhs;
lhs =y(14);
rhs =1;
residual(9)= lhs-rhs;
lhs =y(9);
rhs =y(10)*T72+y(9)*(1-params(8));
residual(10)= lhs-rhs;
lhs =y(28);
rhs =y(2)*params(7)/y(2);
residual(11)= lhs-rhs;
lhs =y(16);
rhs =y(28)*(y(14)-1)*2*params(14)*T86*y(15);
residual(12)= lhs-rhs;
lhs =y(16)+y(15)*(T72-(y(14)-1)*params(14)*2*y(14));
rhs =1;
residual(13)= lhs-rhs;
lhs =y(27);
rhs =(y(8)*(1-params(6))/y(9)+(1-params(8))*y(15))/y(15);
residual(14)= lhs-rhs;
lhs =y(28)*y(27);
rhs =y(28)*y(4);
residual(15)= lhs-rhs;
lhs =y(13);
rhs =y(7)*y(6)*y(11);
residual(16)= lhs-rhs;
lhs =log(y(12))-log((y(12)));
rhs =(log(y(12))-log((y(12))))*params(10)+params(13)*x(1);
residual(17)= lhs-rhs;
lhs =log(y(13))-log((y(13)));
rhs =(log(y(13))-log((y(13))))*params(11)+params(13)*x(2);
residual(18)= lhs-rhs;
lhs =y(18);
rhs =y(8)/(y(8));
residual(19)= lhs-rhs;
lhs =y(23);
rhs =y(9)/(y(9));
residual(20)= lhs-rhs;
lhs =y(22);
rhs =y(10)/(y(10));
residual(21)= lhs-rhs;
lhs =y(19);
rhs =y(5)/(y(5));
residual(22)= lhs-rhs;
lhs =y(21);
rhs =y(6)/(y(6));
residual(23)= lhs-rhs;
lhs =y(20);
rhs =y(7)/(y(7));
residual(24)= lhs-rhs;
lhs =y(17);
rhs =y(4)/(y(4));
residual(25)= lhs-rhs;
lhs =y(24);
rhs =y(9)/y(8);
residual(26)= lhs-rhs;
lhs =y(25);
rhs =y(10)/y(8);
residual(27)= lhs-rhs;
lhs =y(26);
rhs =y(5)/y(8);
residual(28)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(28, 28);

  %
  % Jacobian matrix
  %

T180 = getPowerDeriv(T16,1-params(9),1);
T218 = getPowerDeriv(y(7)*y(12),params(6),1);
T273 = 1/y(12)-1/(y(12));
T278 = 1/y(13)-1/(y(13));
  g1(1,1)=1;
  g1(1,5)=(-(T15*getPowerDeriv(y(5),1-params(5),1)*T180/(1-params(9))));
  g1(1,7)=(-(T180*T12*(-(getPowerDeriv(1-y(7),params(5),1)))/(1-params(9))));
  g1(2,2)=1;
  g1(2,5)=(-(T29*(1-params(5))*getPowerDeriv(y(5),(1-params(5))*(1-params(9))-1,1)));
  g1(2,7)=(-(T27*(-(getPowerDeriv(1-y(7),params(5)*(1-params(9)),1)))));
  g1(3,3)=1;
  g1(3,5)=(-(T37*(-params(5))*getPowerDeriv(y(5),(1-params(5))*(1-params(9)),1)));
  g1(3,7)=(-(T35*(-(getPowerDeriv(1-y(7),params(5)*(1-params(9))-1,1)))));
  g1(4,4)=y(28);
  g1(4,28)=y(4);
  g1(5,2)=y(3)/(y(2)*y(2));
  g1(5,3)=(-1)/y(2);
  g1(5,6)=(-1);
  g1(6,7)=(-(T55*y(12)*T218));
  g1(6,8)=1;
  g1(6,9)=(-(T52*getPowerDeriv(y(9),1-params(6),1)));
  g1(6,12)=(-(T55*y(7)*T218));
  g1(7,6)=(-1);
  g1(7,7)=(-(y(8)*params(6)))/(y(7)*y(7));
  g1(7,8)=params(6)/y(7);
  g1(8,5)=(-1);
  g1(8,8)=1;
  g1(8,10)=(-1);
  g1(8,13)=(-1);
  g1(9,14)=1;
  g1(10,9)=1-(1-params(8));
  g1(10,10)=(-T72);
  g1(10,14)=(-(y(10)*(-(params(14)*2*(y(14)-1)))));
  g1(11,28)=1;
  g1(12,14)=(-(y(28)*y(15)*(2*params(14)*T86+(y(14)-1)*2*params(14)*2*y(14))));
  g1(12,15)=(-(y(28)*(y(14)-1)*2*params(14)*T86));
  g1(12,16)=1;
  g1(12,28)=(-((y(14)-1)*2*params(14)*T86*y(15)));
  g1(13,14)=y(15)*((-(params(14)*2*(y(14)-1)))-((y(14)-1)*2*params(14)+params(14)*2*y(14)));
  g1(13,15)=T72-(y(14)-1)*params(14)*2*y(14);
  g1(13,16)=1;
  g1(14,8)=(-((1-params(6))/y(9)/y(15)));
  g1(14,9)=(-((-(y(8)*(1-params(6))))/(y(9)*y(9))/y(15)));
  g1(14,15)=(-(((1-params(8))*y(15)-(y(8)*(1-params(6))/y(9)+(1-params(8))*y(15)))/(y(15)*y(15))));
  g1(14,27)=1;
  g1(15,4)=(-y(28));
  g1(15,27)=y(28);
  g1(15,28)=y(27)-y(4);
  g1(16,6)=(-(y(7)*y(11)));
  g1(16,7)=(-(y(6)*y(11)));
  g1(16,11)=(-(y(7)*y(6)));
  g1(16,13)=1;
  g1(17,12)=T273-params(10)*T273;
  g1(18,13)=T278-params(11)*T278;
  g1(19,8)=(-(((y(8))-y(8))/((y(8))*(y(8)))));
  g1(19,18)=1;
  g1(20,9)=(-(((y(9))-y(9))/((y(9))*(y(9)))));
  g1(20,23)=1;
  g1(21,10)=(-(((y(10))-y(10))/((y(10))*(y(10)))));
  g1(21,22)=1;
  g1(22,5)=(-(((y(5))-y(5))/((y(5))*(y(5)))));
  g1(22,19)=1;
  g1(23,6)=(-(((y(6))-y(6))/((y(6))*(y(6)))));
  g1(23,21)=1;
  g1(24,7)=(-(((y(7))-y(7))/((y(7))*(y(7)))));
  g1(24,20)=1;
  g1(25,4)=(-(((y(4))-y(4))/((y(4))*(y(4)))));
  g1(25,17)=1;
  g1(26,8)=(-((-y(9))/(y(8)*y(8))));
  g1(26,9)=(-(1/y(8)));
  g1(26,24)=1;
  g1(27,8)=(-((-y(10))/(y(8)*y(8))));
  g1(27,10)=(-(1/y(8)));
  g1(27,25)=1;
  g1(28,5)=(-(1/y(8)));
  g1(28,8)=(-((-y(5))/(y(8)*y(8))));
  g1(28,26)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],28,784);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],28,21952);
end
end
end
end
