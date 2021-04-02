function [residual, g1, g2, g3] = RBC1_static(y, x, params)
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

residual = zeros( 19, 1);

%
% Model equations
%

T40 = y(7)^params(5);
T41 = y(11)*T40;
T44 = y(9)^(1-params(5));
lhs =y(1);
rhs =log(y(5))-params(13)*y(7)^(1+params(14))/(1+params(14));
residual(1)= lhs-rhs;
lhs =y(2);
rhs =1/y(5);
residual(2)= lhs-rhs;
lhs =y(3);
rhs =(-params(13))*y(7)^params(14);
residual(3)= lhs-rhs;
lhs =y(2);
rhs =y(2)*params(7)*y(4);
residual(4)= lhs-rhs;
lhs =(-y(3))/y(2);
rhs =y(6);
residual(5)= lhs-rhs;
lhs =y(8);
rhs =T41*T44;
residual(6)= lhs-rhs;
lhs =y(8)*params(5)/y(7);
rhs =y(6);
residual(7)= lhs-rhs;
lhs =y(8)*(1-params(5))/y(9);
rhs =y(18);
residual(8)= lhs-rhs;
lhs =y(17);
rhs =y(18)+1-params(8);
residual(9)= lhs-rhs;
lhs =y(8);
rhs =y(5)+y(12)+y(10);
residual(10)= lhs-rhs;
lhs =y(9);
rhs =y(10)+y(9)*(1-params(8));
residual(11)= lhs-rhs;
lhs =y(19);
rhs =y(2)*params(7)/y(2);
residual(12)= lhs-rhs;
lhs =y(17)*y(19);
rhs =y(4)*y(19);
residual(13)= lhs-rhs;
lhs =y(12);
rhs =y(8)*params(6);
residual(14)= lhs-rhs;
lhs =y(13);
rhs =y(12);
residual(15)= lhs-rhs;
lhs =log(y(11))-log((y(11)));
rhs =(log(y(11))-log((y(11))))*params(9)+params(12)*x(1);
residual(16)= lhs-rhs;
lhs =y(14);
rhs =y(9)/y(8);
residual(17)= lhs-rhs;
lhs =y(15);
rhs =y(10)/y(8);
residual(18)= lhs-rhs;
lhs =y(16);
rhs =y(5)/y(8);
residual(19)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(19, 19);

  %
  % Jacobian matrix
  %

T149 = 1/y(11)-1/(y(11));
  g1(1,1)=1;
  g1(1,5)=(-(1/y(5)));
  g1(1,7)=params(13)*getPowerDeriv(y(7),1+params(14),1)/(1+params(14));
  g1(2,2)=1;
  g1(2,5)=(-((-1)/(y(5)*y(5))));
  g1(3,3)=1;
  g1(3,7)=(-((-params(13))*getPowerDeriv(y(7),params(14),1)));
  g1(4,2)=1-params(7)*y(4);
  g1(4,4)=(-(y(2)*params(7)));
  g1(5,2)=y(3)/(y(2)*y(2));
  g1(5,3)=(-1)/y(2);
  g1(5,6)=(-1);
  g1(6,7)=(-(T44*y(11)*getPowerDeriv(y(7),params(5),1)));
  g1(6,8)=1;
  g1(6,9)=(-(T41*getPowerDeriv(y(9),1-params(5),1)));
  g1(6,11)=(-(T40*T44));
  g1(7,6)=(-1);
  g1(7,7)=(-(y(8)*params(5)))/(y(7)*y(7));
  g1(7,8)=params(5)/y(7);
  g1(8,8)=(1-params(5))/y(9);
  g1(8,9)=(-(y(8)*(1-params(5))))/(y(9)*y(9));
  g1(8,18)=(-1);
  g1(9,17)=1;
  g1(9,18)=(-1);
  g1(10,5)=(-1);
  g1(10,8)=1;
  g1(10,10)=(-1);
  g1(10,12)=(-1);
  g1(11,9)=1-(1-params(8));
  g1(11,10)=(-1);
  g1(12,19)=1;
  g1(13,4)=(-y(19));
  g1(13,17)=y(19);
  g1(13,19)=y(17)-y(4);
  g1(14,8)=(-params(6));
  g1(14,12)=1;
  g1(15,12)=(-1);
  g1(15,13)=1;
  g1(16,11)=T149-params(9)*T149;
  g1(17,8)=(-((-y(9))/(y(8)*y(8))));
  g1(17,9)=(-(1/y(8)));
  g1(17,14)=1;
  g1(18,8)=(-((-y(10))/(y(8)*y(8))));
  g1(18,10)=(-(1/y(8)));
  g1(18,15)=1;
  g1(19,5)=(-(1/y(8)));
  g1(19,8)=(-((-y(5))/(y(8)*y(8))));
  g1(19,16)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],19,361);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],19,6859);
end
end
end
end
