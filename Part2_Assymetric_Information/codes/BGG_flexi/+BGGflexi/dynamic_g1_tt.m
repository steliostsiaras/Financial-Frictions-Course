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

assert(length(T) >= 18);

T = BGGflexi.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(11) = getPowerDeriv(y(12)-params(3)*y(1),(-1),1);
T(12) = getPowerDeriv(y(65)-y(12)*params(3),(-1),1);
T(13) = getPowerDeriv(y(32)*y(3),params(1),1);
TEFD_fdd_0_1 = jacob_element('logncdf',1,{y(29),(-0.5)*T(6),y(37)});
T(14) = TEFD_fdd_0_1;
TEFD_fdd_0_2 = jacob_element('logncdf',2,{y(29),(-0.5)*T(6),y(37)});
T(15) = TEFD_fdd_0_2;
TEFD_fdd_0_3 = jacob_element('logncdf',3,{y(29),(-0.5)*T(6),y(37)});
T(16) = TEFD_fdd_0_3;
T(17) = exp((-(T(8)*T(8)))/2)/2.506628274631;
T(18) = (y(48)*(y(47)-y(46)*y(39))+(1-y(47))*(y(48)-y(49)*y(39)))*(y(48)*(y(47)-y(46)*y(39))+(1-y(47))*(y(48)-y(49)*y(39)));

end
