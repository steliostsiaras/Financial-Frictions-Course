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

assert(length(T) >= 20);

T = BGGflexi.static_resid_tt(T, y, x, params);

T(12) = (1-params(3))*getPowerDeriv(y(1)*(1-params(3)),(-1),1);
T(13) = getPowerDeriv(y(22)*y(7),params(1),1);
TEFD_fdd_0_1 = jacob_element('logncdf',1,{y(19),(-0.5)*T(7),y(27)});
T(14) = TEFD_fdd_0_1;
TEFD_fdd_0_2 = jacob_element('logncdf',2,{y(19),(-0.5)*T(7),y(27)});
T(15) = TEFD_fdd_0_2;
TEFD_fdd_0_3 = jacob_element('logncdf',3,{y(19),(-0.5)*T(7),y(27)});
T(16) = TEFD_fdd_0_3;
T(17) = exp((-(T(9)*T(9)))/2)/2.506628274631;
T(18) = 1/y(28)/(y(27)/y(28));
T(19) = (-y(27))/(y(28)*y(28))/(y(27)/y(28));
T(20) = (y(38)*(y(37)-y(36)*y(29))+(1-y(37))*(y(38)-y(39)*y(29)))*(y(38)*(y(37)-y(36)*y(29))+(1-y(37))*(y(38)-y(39)*y(29)));

end
