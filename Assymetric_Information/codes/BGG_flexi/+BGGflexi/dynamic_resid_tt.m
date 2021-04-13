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

assert(length(T) >= 19);

T(1) = y(38)^2;
TEF_0 = logncdf(y(30),(-0.5)*T(1),y(38));
T(2) = TEF_0;
T(3) = (0.5*T(1)-log(y(30)))/y(38);
T(4) = 1-normcdf(T(3),0,1);
T(5) = (-((log(y(30))+T(1)*.5)^2));
T(6) = exp(T(5)/(2*T(1)));
T(7) = (y(12)*(1-params(3)))^(-1);
T(8) = y(15)^params(5);
T(9) = (y(33)*y(3))^params(1);
T(10) = y(21)*T(9);
T(11) = y(15)^(1-params(1));
T(12) = 1+params(8)/2*(y(31)/y(7)-1)^2;
T(13) = y(58)*params(8)*(y(61)/y(31)-1);
T(14) = (y(61)/y(31))^2;
T(15) = y(22)/y(2);
T(16) = T(4)+y(30)*(1-T(2));
T(17) = 1-T(16);
T(18) = 1-T(2)-1/(y(30)*y(38)*2.506628274631)*T(6)*y(40);
T(19) = (1-T(2))*(T(16)-T(4)*y(40))+T(17)*T(18);

end
