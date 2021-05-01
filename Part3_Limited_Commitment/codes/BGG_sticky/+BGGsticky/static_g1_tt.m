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

assert(length(T) >= 47);

T = BGGsticky.static_resid_tt(T, y, x, params);

T(35) = (1-params(3))*getPowerDeriv(y(1)-y(1)*params(3),T(1),1);
TEFD_fdd_0_1 = jacob_element('logncdf',1,{y(19),(-0.5)*T(8),y(39)});
T(36) = TEFD_fdd_0_1;
TEFD_fdd_0_2 = jacob_element('logncdf',2,{y(19),(-0.5)*T(8),y(39)});
T(37) = TEFD_fdd_0_2;
TEFD_fdd_0_3 = jacob_element('logncdf',3,{y(19),(-0.5)*T(8),y(39)});
T(38) = TEFD_fdd_0_3;
T(39) = exp((-(T(10)*T(10)))/2)/2.506628274631;
T(40) = getPowerDeriv(y(29)/y(30),(-params(14)),1);
T(41) = getPowerDeriv(y(30),params(14),1);
T(42) = getPowerDeriv(y(30),params(17)*(1-params(14)),1);
T(43) = ((y(31))-y(31))/((y(31))*(y(31)))/(y(31)/(y(31)));
T(44) = 1/y(41)/(y(39)/y(41));
T(45) = ((y(82)-y(40)*y(81))*y(83)+(1-y(82))*(y(83)-y(40)*y(84)))*((y(82)-y(40)*y(81))*y(83)+(1-y(82))*(y(83)-y(40)*y(84)));
T(46) = (-y(39))/(y(41)*y(41))/(y(39)/y(41));
T(47) = (1-params(3))*getPowerDeriv(y(61)-params(3)*y(61),T(1),1);

end
