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
    T = BGGflexi.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(46, 1);
lhs = y(13);
rhs = T(7)-T(7)*params(3)*params(2);
residual(1) = lhs - rhs;
lhs = y(14);
rhs = y(13)*params(2)/y(1);
residual(2) = lhs - rhs;
lhs = y(58)*y(16);
rhs = 1;
residual(3) = lhs - rhs;
lhs = y(13)*(1-params(1))*y(17);
rhs = y(15)*params(4)*T(8);
residual(4) = lhs - rhs;
lhs = y(17);
rhs = T(10)*T(11);
residual(5) = lhs - rhs;
lhs = y(19);
rhs = (1-params(1))*y(17)/y(15);
residual(6) = lhs - rhs;
lhs = y(20);
rhs = params(1)*y(17)/(y(33)*y(3));
residual(7) = lhs - rhs;
lhs = y(18);
rhs = y(33)*(y(31)+y(3)*(1-params(6)));
residual(8) = lhs - rhs;
lhs = y(32);
rhs = T(12)+y(31)*params(8)*(y(31)/y(7)-1)/y(7)-T(13)*T(14);
residual(9) = lhs - rhs;
lhs = y(22);
rhs = y(33)*(y(20)+(1-params(6))*y(32))/y(8);
residual(10) = lhs - rhs;
lhs = y(18)*y(32);
rhs = y(26)+y(24);
residual(11) = lhs - rhs;
lhs = y(24);
rhs = y(3)*y(8)*y(22)*(y(37)+params(7))*T(17);
residual(12) = lhs - rhs;
lhs = y(27);
rhs = y(3)*y(8)*y(22)*(1-params(7))*(1-y(37))*T(17);
residual(13) = lhs - rhs;
lhs = y(24)*y(25);
rhs = y(18)*y(32);
residual(14) = lhs - rhs;
residual(15) = y(3)*(1-T(15)*(T(16)-T(4)*y(40)))-y(5);
lhs = y(30);
rhs = y(23)*y(6)/(y(3)*y(22)*y(8));
residual(16) = lhs - rhs;
lhs = y(28);
rhs = (1-T(2))/T(19);
residual(17) = lhs - rhs;
lhs = y(29);
rhs = y(16)*y(28);
residual(18) = lhs - rhs;
lhs = y(59);
rhs = y(60);
residual(19) = lhs - rhs;
lhs = y(17);
rhs = y(12)+y(27)+y(34)+y(31)*T(12)+y(3)*y(8)*y(22)*T(4)*y(40);
residual(20) = lhs - rhs;
lhs = y(34);
rhs = y(35);
residual(21) = lhs - rhs;
lhs = y(34);
rhs = params(10)*(steady_state(6));
residual(22) = lhs - rhs;
lhs = y(36);
rhs = y(59)-y(16);
residual(23) = lhs - rhs;
lhs = log(y(21));
rhs = 0.75*log(y(4))+x(it_, 1);
residual(24) = lhs - rhs;
lhs = log(y(42));
rhs = params(18)*log(y(11))+x(it_, 2);
residual(25) = lhs - rhs;
lhs = log(y(38)/y(39));
rhs = params(17)*log(y(10)/y(39))+x(it_, 4)*0.07;
residual(26) = lhs - rhs;
lhs = log(y(33));
rhs = params(18)*log(y(9))+x(it_, 3);
residual(27) = lhs - rhs;
lhs = y(41);
rhs = T(2);
residual(28) = lhs - rhs;
lhs = y(43);
rhs = y(17)/(steady_state(6));
residual(29) = lhs - rhs;
lhs = y(52);
rhs = y(18)/(steady_state(7));
residual(30) = lhs - rhs;
lhs = y(45);
rhs = y(31)/(steady_state(20));
residual(31) = lhs - rhs;
lhs = y(44);
rhs = y(12)/(steady_state(1));
residual(32) = lhs - rhs;
lhs = y(46);
rhs = y(19)/(steady_state(8));
residual(33) = lhs - rhs;
lhs = y(54);
rhs = y(15)/(steady_state(4));
residual(34) = lhs - rhs;
lhs = y(48);
rhs = y(32)/(steady_state(21));
residual(35) = lhs - rhs;
lhs = y(47);
rhs = y(16)/(steady_state(5));
residual(36) = lhs - rhs;
lhs = y(49);
rhs = y(22)/(steady_state(11));
residual(37) = lhs - rhs;
lhs = y(51);
rhs = y(63)-y(62);
residual(38) = lhs - rhs;
lhs = y(50);
rhs = y(24)/(steady_state(13));
residual(39) = lhs - rhs;
lhs = y(53);
rhs = y(28)/(steady_state(17));
residual(40) = lhs - rhs;
lhs = y(56);
rhs = y(33)/(steady_state(22));
residual(41) = lhs - rhs;
lhs = y(55);
rhs = y(25)/(steady_state(14));
residual(42) = lhs - rhs;
lhs = y(57);
rhs = y(26)/(steady_state(15));
residual(43) = lhs - rhs;
lhs = y(37);
rhs = (steady_state(26));
residual(44) = lhs - rhs;
lhs = y(39);
rhs = (steady_state(27));
residual(45) = lhs - rhs;
lhs = y(40);
rhs = (steady_state(29));
residual(46) = lhs - rhs;

end
