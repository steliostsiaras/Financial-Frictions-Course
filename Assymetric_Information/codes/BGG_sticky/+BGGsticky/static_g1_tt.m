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

assert(length(T) >= 45);

T = BGGsticky.static_resid_tt(T, y, x, params);

T(33) = (1-params(3))*getPowerDeriv(y(1)-y(1)*params(3),T(1),1);
TEFD_fdd_0_1 = jacob_element('logncdf',1,{y(19),(-0.5)*T(7),y(39)});
T(34) = TEFD_fdd_0_1;
TEFD_fdd_0_2 = jacob_element('logncdf',2,{y(19),(-0.5)*T(7),y(39)});
T(35) = TEFD_fdd_0_2;
TEFD_fdd_0_3 = jacob_element('logncdf',3,{y(19),(-0.5)*T(7),y(39)});
T(36) = TEFD_fdd_0_3;
T(37) = exp((-(T(9)*T(9)))/2)/2.506628274631;
T(38) = getPowerDeriv(y(29)/y(30),(-params(15)),1);
T(39) = getPowerDeriv(y(30),params(15),1);
T(40) = getPowerDeriv(y(30),params(18)*(1-params(15)),1);
T(41) = ((y(31))-y(31))/((y(31))*(y(31)))/(y(31)/(y(31)));
T(42) = 1/y(41)/(y(39)/y(41));
T(43) = ((y(79)-y(40)*y(78))*y(80)+(1-y(79))*(y(80)-y(40)*y(81)))*((y(79)-y(40)*y(78))*y(80)+(1-y(79))*(y(80)-y(40)*y(81)));
T(44) = (-y(39))/(y(41)*y(41))/(y(39)/y(41));
T(45) = (1-params(3))*getPowerDeriv(y(61)-params(3)*y(61),T(1),1);

end
