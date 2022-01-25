function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 10);

T(1) = y(15)^params(5);
T(2) = (y(32)*y(3))^params(1);
T(3) = y(20)*T(2);
T(4) = y(15)^(1-params(1));
T(5) = y(71)^2;
T(6) = y(37)^2;
TEF_0 = logncdf(y(29),(-0.5)*T(6),y(37));
T(7) = TEF_0;
T(8) = (0.5*T(6)-log(y(29)))/y(37);
T(9) = (-((log(y(29))+T(6)*.5)^2));
T(10) = exp(T(9)/(2*T(6)));

end
