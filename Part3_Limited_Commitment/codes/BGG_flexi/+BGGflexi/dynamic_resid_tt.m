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

assert(length(T) >= 11);

T(1) = (y(11)*(1-params(3)))^(-1);
T(2) = y(14)^params(5);
T(3) = (y(31)*y(2))^params(1);
T(4) = y(19)*T(3);
T(5) = y(14)^(1-params(1));
T(6) = y(69)^2;
T(7) = y(36)^2;
TEF_0 = logncdf(y(28),(-0.5)*T(7),y(36));
T(8) = TEF_0;
T(9) = (0.5*T(7)-log(y(28)))/y(36);
T(10) = (-((log(y(28))+T(7)*.5)^2));
T(11) = exp(T(10)/(2*T(7)));

end
