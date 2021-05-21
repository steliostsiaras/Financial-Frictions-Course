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
    T = GK_calib.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(50, 1);
lhs = y(11);
rhs = (1-y(34))*y(13)+(1-params(6))*y(1);
residual(1) = lhs - rhs;
lhs = y(33);
rhs = y(13)/y(2);
residual(2) = lhs - rhs;
lhs = y(34);
rhs = params(10)*(y(33)-1)^2;
residual(3) = lhs - rhs;
lhs = y(35);
rhs = (y(33)-1)*2*params(10);
residual(4) = lhs - rhs;
lhs = y(11);
rhs = y(25)*y(40);
residual(5) = lhs - rhs;
lhs = y(21)*(1-y(34)-y(33)*y(35))+y(64)*y(63)*y(68)*T(1);
rhs = 1;
residual(6) = lhs - rhs;
lhs = y(10);
rhs = T(3)*T(4);
residual(7) = lhs - rhs;
lhs = y(20);
rhs = T(5)-T(5)*params(3)*params(2);
residual(8) = lhs - rhs;
lhs = y(26);
rhs = y(20)*params(2)/y(3);
residual(9) = lhs - rhs;
lhs = params(2)*y(62)/y(20)*y(15);
rhs = 1;
residual(10) = lhs - rhs;
lhs = y(10)*(1-params(1))*y(20);
rhs = y(12)*params(4)*T(6);
residual(11) = lhs - rhs;
lhs = y(17);
rhs = y(10)*(1-params(1))/y(12);
residual(12) = lhs - rhs;
lhs = y(18);
rhs = params(1)*y(10)/y(1);
residual(13) = lhs - rhs;
lhs = y(27);
rhs = 1-params(8)+params(8)*y(37)*y(24);
residual(14) = lhs - rhs;
lhs = y(25)*y(21);
rhs = y(24)*y(19);
residual(15) = lhs - rhs;
lhs = y(25)*y(21);
rhs = y(19)+y(23);
residual(16) = lhs - rhs;
lhs = y(24);
rhs = y(64)*y(65)*y(60)/(y(37)-y(64)*y(65)*y(66));
residual(17) = lhs - rhs;
lhs = y(19);
rhs = y(16)*y(4)*y(6)*(params(8)+params(9))-y(15)*params(8)*y(5);
residual(18) = lhs - rhs;
lhs = y(16);
rhs = y(40)*(y(18)+(1-params(6))*y(21))/y(4);
residual(19) = lhs - rhs;
lhs = y(10);
rhs = y(13)+y(14)+y(29);
residual(20) = lhs - rhs;
lhs = y(29);
rhs = y(28);
residual(21) = lhs - rhs;
lhs = y(29);
rhs = y(39)*params(11)*(steady_state(1));
residual(22) = lhs - rhs;
lhs = y(36);
rhs = y(61)-y(15);
residual(23) = lhs - rhs;
lhs = y(30);
rhs = y(16)-y(15);
residual(24) = lhs - rhs;
lhs = log(y(40));
rhs = params(13)*log(y(9))-x(it_, 3);
residual(25) = lhs - rhs;
lhs = log(y(38));
rhs = params(12)*log(y(7))+x(it_, 1);
residual(26) = lhs - rhs;
lhs = log(y(39));
rhs = params(14)*log(y(8))+x(it_, 2);
residual(27) = lhs - rhs;
lhs = y(37);
rhs = (steady_state(28));
residual(28) = lhs - rhs;
lhs = y(31);
rhs = y(13)+y(14);
residual(29) = lhs - rhs;
lhs = y(32);
rhs = y(19)/y(22);
residual(30) = lhs - rhs;
lhs = y(22);
rhs = y(25)*y(21);
residual(31) = lhs - rhs;
lhs = y(41);
rhs = y(10)/(steady_state(1));
residual(32) = lhs - rhs;
lhs = y(57);
rhs = y(31)/(steady_state(22));
residual(33) = lhs - rhs;
lhs = y(59);
rhs = y(22)/(steady_state(13));
residual(34) = lhs - rhs;
lhs = y(42);
rhs = y(11)/(steady_state(2));
residual(35) = lhs - rhs;
lhs = y(43);
rhs = y(14)/(steady_state(5));
residual(36) = lhs - rhs;
lhs = y(44);
rhs = y(12)/(steady_state(3));
residual(37) = lhs - rhs;
lhs = y(45);
rhs = y(13)/(steady_state(4));
residual(38) = lhs - rhs;
lhs = y(46);
rhs = y(15)/(steady_state(6));
residual(39) = lhs - rhs;
lhs = y(47);
rhs = y(16)/(steady_state(7));
residual(40) = lhs - rhs;
lhs = y(48);
rhs = y(17)/(steady_state(8));
residual(41) = lhs - rhs;
lhs = y(49);
rhs = y(18)/(steady_state(9));
residual(42) = lhs - rhs;
lhs = y(50);
rhs = y(19)/(steady_state(10));
residual(43) = lhs - rhs;
lhs = y(51);
rhs = y(20)/(steady_state(11));
residual(44) = lhs - rhs;
lhs = y(52);
rhs = y(21)/(steady_state(12));
residual(45) = lhs - rhs;
lhs = y(53);
rhs = y(23)/(steady_state(14));
residual(46) = lhs - rhs;
lhs = y(54);
rhs = y(24)/(steady_state(15));
residual(47) = lhs - rhs;
lhs = y(55);
rhs = y(28)/(steady_state(19));
residual(48) = lhs - rhs;
lhs = y(56);
rhs = y(29)/(steady_state(20));
residual(49) = lhs - rhs;
lhs = y(58);
rhs = y(70)-y(69);
residual(50) = lhs - rhs;

end
