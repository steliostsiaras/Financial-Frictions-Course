function T = static_g1_tt(T, y, x, params)
% function T = static_g1_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 30);

T = BGGflexi.static_resid_tt(T, y, x, params);

T(17) = (1-params(3))*getPowerDeriv(y(1)*(1-params(3)),(-1),1);
T(18) = getPowerDeriv(y(22)*y(7),params(1),1);
T(19) = exp((-(T(3)*T(3)))/2)/2.506628274631;
T(20) = (-(1/y(19)))/y(27)*T(19);
TEFD_fdd_0_1 = jacob_element('logncdf',1,{y(19),(-0.5)*T(1),y(27)});
T(21) = TEFD_fdd_0_1;
TEFD_fdd_0_2 = jacob_element('logncdf',2,{y(19),(-0.5)*T(1),y(27)});
T(22) = TEFD_fdd_0_2;
TEFD_fdd_0_3 = jacob_element('logncdf',3,{y(19),(-0.5)*T(1),y(27)});
T(23) = TEFD_fdd_0_3;
T(24) = 1-T(2)+y(19)*(-T(21))-T(20);
T(25) = (-T(24));
T(26) = T(19)*(y(27)*0.5*2*y(27)-(0.5*T(1)-log(y(19))))/(y(27)*y(27));
T(27) = y(19)*(-(T(23)+T(22)*(-0.5)*2*y(27)))-T(26);
T(28) = (-T(27));
T(29) = 1/y(28)/(y(27)/y(28));
T(30) = (-y(27))/(y(28)*y(28))/(y(27)/y(28));

end
