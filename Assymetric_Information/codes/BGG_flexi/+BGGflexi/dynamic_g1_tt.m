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

assert(length(T) >= 33);

T = BGGflexi.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(20) = (1-params(3))*getPowerDeriv(y(12)*(1-params(3)),(-1),1);
T(21) = getPowerDeriv(y(33)*y(3),params(1),1);
T(22) = exp((-(T(3)*T(3)))/2)/2.506628274631;
T(23) = (-(1/y(30)))/y(38)*T(22);
TEFD_fdd_0_1 = jacob_element('logncdf',1,{y(30),(-0.5)*T(1),y(38)});
T(24) = TEFD_fdd_0_1;
TEFD_fdd_0_2 = jacob_element('logncdf',2,{y(30),(-0.5)*T(1),y(38)});
T(25) = TEFD_fdd_0_2;
TEFD_fdd_0_3 = jacob_element('logncdf',3,{y(30),(-0.5)*T(1),y(38)});
T(26) = TEFD_fdd_0_3;
T(27) = 1-T(2)+y(30)*(-T(24))-T(23);
T(28) = (-T(27));
T(29) = params(8)/2*(-y(31))/(y(7)*y(7))*2*(y(31)/y(7)-1);
T(30) = params(8)/2*2*(y(31)/y(7)-1)*1/y(7);
T(31) = T(22)*(y(38)*0.5*2*y(38)-(0.5*T(1)-log(y(30))))/(y(38)*y(38));
T(32) = y(30)*(-(T(26)+T(25)*(-0.5)*2*y(38)))-T(31);
T(33) = (-T(32));

end
