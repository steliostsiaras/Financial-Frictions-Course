function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 50);

T = BGGsticky.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(39) = getPowerDeriv(y(55)-params(3)*y(1),T(1),1);
T(40) = getPowerDeriv(y(191)-y(55)*params(3),T(1),1);
TEFD_fdd_0_1 = jacob_element('logncdf',1,{y(72),(-0.5)*T(5),y(92)});
T(41) = TEFD_fdd_0_1;
TEFD_fdd_0_2 = jacob_element('logncdf',2,{y(72),(-0.5)*T(5),y(92)});
T(42) = TEFD_fdd_0_2;
TEFD_fdd_0_3 = jacob_element('logncdf',3,{y(72),(-0.5)*T(5),y(92)});
T(43) = TEFD_fdd_0_3;
T(44) = exp((-(T(7)*T(7)))/2)/2.506628274631;
T(45) = T(4)*(-y(74))/(y(7)*y(7))*2*(y(74)/y(7)-1);
T(46) = T(4)*2*(y(74)/y(7)-1)*1/y(7);
T(47) = getPowerDeriv(y(82)/y(83),(-params(15)),1);
T(48) = (y(133)*(y(132)-y(93)*y(131))+(1-y(132))*(y(133)-y(93)*y(134)))*(y(133)*(y(132)-y(93)*y(131))+(1-y(132))*(y(133)-y(93)*y(134)));
T(49) = getPowerDeriv(y(114)-params(3)*y(22),T(1),1);
T(50) = getPowerDeriv(y(200)-params(3)*y(114),T(1),1);

end
