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

assert(length(T) >= 38);

T(1) = (-1);
T(2) = y(58)^params(5);
T(3) = y(58)^(1-params(1));
T(4) = params(8)/2;
T(5) = y(92)^2;
TEF_0 = logncdf(y(72),(-0.5)*T(5),y(92));
T(6) = TEF_0;
T(7) = (0.5*T(5)-log(y(72)))/y(92);
T(8) = (-((log(y(72))+T(5)*.5)^2));
T(9) = exp(T(8)/(2*T(5)));
T(10) = 1+T(4)*(y(74)/y(7)-1)^2;
T(11) = y(9)^((-params(18))*params(15));
T(12) = params(16)*y(11)*T(11);
T(13) = y(83)^params(15);
T(14) = y(197)^params(15);
T(15) = y(83)^(params(18)*(-params(15)));
T(16) = y(197)^(params(15)-1);
T(17) = y(83)^(params(18)*(1-params(15)));
T(18) = y(87)*params(15)/(params(15)-1)/y(86);
T(19) = y(119)/(steady_state(66));
T(20) = y(60)/(steady_state(6))/T(19);
T(21) = y(117)^params(5);
T(22) = y(117)^(1-params(1));
T(23) = params(21)^2;
T(24) = sqrt(1-T(23));
T(25) = params(22)*T(24);
T(26) = params(21)^3;
T(27) = params(21)^4;
T(28) = params(21)^5;
T(29) = params(21)^6;
T(30) = params(21)^7;
T(31) = params(21)^8*params(23);
T(32) = y(3)^params(1);
T(33) = y(64)*T(32);
T(34) = y(192)*params(8)*(y(196)/y(74)-1);
T(35) = (y(196)/y(74))^2;
T(36) = y(24)^params(1);
T(37) = params(8)*y(201)*(y(203)/y(123)-1);
T(38) = (y(203)/y(123))^2;

end
