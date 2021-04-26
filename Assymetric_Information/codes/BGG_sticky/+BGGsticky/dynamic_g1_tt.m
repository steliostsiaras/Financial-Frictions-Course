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

assert(length(T) >= 44);

T = BGGsticky.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(35) = getPowerDeriv(y(55)-params(3)*y(1),T(1),1);
T(36) = getPowerDeriv(y(197)-y(55)*params(3),T(1),1);
TEFD_fdd_0_1 = jacob_element('logncdf',1,{y(72),(-0.5)*T(5),y(92)});
T(37) = TEFD_fdd_0_1;
TEFD_fdd_0_2 = jacob_element('logncdf',2,{y(72),(-0.5)*T(5),y(92)});
T(38) = TEFD_fdd_0_2;
TEFD_fdd_0_3 = jacob_element('logncdf',3,{y(72),(-0.5)*T(5),y(92)});
T(39) = TEFD_fdd_0_3;
T(40) = exp((-(T(7)*T(7)))/2)/2.506628274631;
T(41) = getPowerDeriv(y(82)/y(83),(-params(14)),1);
T(42) = (y(136)*(y(135)-y(93)*y(134))+(1-y(135))*(y(136)-y(93)*y(137)))*(y(136)*(y(135)-y(93)*y(134))+(1-y(135))*(y(136)-y(93)*y(137)));
T(43) = getPowerDeriv(y(114)-params(3)*y(22),T(1),1);
T(44) = getPowerDeriv(y(206)-params(3)*y(114),T(1),1);

end
