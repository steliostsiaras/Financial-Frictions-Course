function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = RBC1.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(19, 1);
lhs = y(4);
rhs = log(y(8))-params(13)*y(10)^(1+params(14))/(1+params(14));
residual(1) = lhs - rhs;
lhs = y(5);
rhs = 1/y(8);
residual(2) = lhs - rhs;
lhs = y(6);
rhs = (-params(13))*y(10)^params(14);
residual(3) = lhs - rhs;
lhs = y(5);
rhs = params(7)*y(7)*y(23);
residual(4) = lhs - rhs;
lhs = (-y(6))/y(5);
rhs = y(9);
residual(5) = lhs - rhs;
lhs = y(11);
rhs = T(2)*T(3);
residual(6) = lhs - rhs;
lhs = y(11)*params(5)/y(10);
rhs = y(9);
residual(7) = lhs - rhs;
lhs = y(11)*(1-params(5))/y(2);
rhs = y(21);
residual(8) = lhs - rhs;
lhs = y(20);
rhs = y(21)+1-params(8);
residual(9) = lhs - rhs;
lhs = y(11);
rhs = y(8)+y(15)+y(13);
residual(10) = lhs - rhs;
lhs = y(12);
rhs = y(13)+y(2)*(1-params(8));
residual(11) = lhs - rhs;
lhs = y(22);
rhs = y(5)*params(7)/y(1);
residual(12) = lhs - rhs;
lhs = y(25)*y(24);
rhs = y(7)*y(25);
residual(13) = lhs - rhs;
lhs = y(15);
rhs = y(11)*params(6);
residual(14) = lhs - rhs;
lhs = y(16);
rhs = y(15);
residual(15) = lhs - rhs;
lhs = log(y(14))-log((steady_state(11)));
rhs = params(9)*(log(y(3))-log((steady_state(11))))+params(12)*x(it_, 1);
residual(16) = lhs - rhs;
lhs = y(17);
rhs = y(12)/y(11);
residual(17) = lhs - rhs;
lhs = y(18);
rhs = y(13)/y(11);
residual(18) = lhs - rhs;
lhs = y(19);
rhs = y(8)/y(11);
residual(19) = lhs - rhs;

end
