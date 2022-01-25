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
residual = zeros(54, 1);
lhs = y(13);
rhs = (y(12)-params(3)*y(1))^(-1)-params(3)*params(2)*(y(65)-y(12)*params(3))^(-1);
residual(1) = lhs - rhs;
lhs = y(14);
rhs = y(13)*params(2)/y(2);
residual(2) = lhs - rhs;
lhs = y(66)*y(16);
rhs = 1;
residual(3) = lhs - rhs;
lhs = y(13)*(1-params(1))*y(17);
rhs = y(15)*params(4)*T(1);
residual(4) = lhs - rhs;
lhs = y(17);
rhs = T(3)*T(4);
residual(5) = lhs - rhs;
lhs = y(19);
rhs = (1-params(1))*y(17)/y(15);
residual(6) = lhs - rhs;
lhs = y(21);
rhs = params(1)*y(17)/(y(32)*y(3));
residual(7) = lhs - rhs;
lhs = y(18);
rhs = (1-y(43))*y(30)+y(3)*(1-params(6));
residual(8) = lhs - rhs;
lhs = y(42);
rhs = y(30)/y(7);
residual(9) = lhs - rhs;
lhs = y(43);
rhs = params(8)*(y(42)-1)^2;
residual(10) = lhs - rhs;
lhs = y(44);
rhs = (y(42)-1)*2*params(8);
residual(11) = lhs - rhs;
lhs = y(31)*(1-y(43)-y(42)*y(44))+y(66)*y(70)*y(72)*T(5);
rhs = 1;
residual(12) = lhs - rhs;
lhs = y(45);
rhs = T(7);
residual(13) = lhs - rhs;
lhs = y(46);
rhs = 1-normcdf(T(8),0,1);
residual(14) = lhs - rhs;
lhs = y(47);
rhs = y(46)+y(29)*(1-y(45));
residual(15) = lhs - rhs;
lhs = y(48);
rhs = 1-y(45);
residual(16) = lhs - rhs;
lhs = y(49);
rhs = 1/(y(29)*y(37)*2.506628274631)*T(10);
residual(17) = lhs - rhs;
lhs = y(22);
rhs = y(32)*(y(21)+(1-params(6))*y(31))/y(8);
residual(18) = lhs - rhs;
lhs = y(18)*y(31);
rhs = y(25)+y(23);
residual(19) = lhs - rhs;
lhs = y(23);
rhs = y(3)*y(8)*y(22)*(y(36)+params(7))*(1-y(47));
residual(20) = lhs - rhs;
lhs = y(26);
rhs = y(3)*y(8)*y(22)*(1-y(47))*(1-params(7))*(1-y(36));
residual(21) = lhs - rhs;
lhs = y(23)*y(24);
rhs = y(18)*y(31);
residual(22) = lhs - rhs;
lhs = y(24)*y(68)*(y(74)-y(39)*y(73));
rhs = y(67)*(y(24)-1);
residual(23) = lhs - rhs;
lhs = y(29);
rhs = y(5)*(y(3)*y(8)-y(6))/(y(3)*y(22)*y(8));
residual(24) = lhs - rhs;
lhs = y(27);
rhs = y(48)/(y(48)*(y(47)-y(46)*y(39))+(1-y(47))*(y(48)-y(49)*y(39)));
residual(25) = lhs - rhs;
lhs = y(28);
rhs = y(16)*y(27);
residual(26) = lhs - rhs;
lhs = y(68);
rhs = y(69);
residual(27) = lhs - rhs;
lhs = y(17);
rhs = y(30)+y(12)+y(26)+y(33)+y(3)*y(8)*y(22)*y(46)*y(39);
residual(28) = lhs - rhs;
lhs = y(33);
rhs = y(34);
residual(29) = lhs - rhs;
lhs = y(33);
rhs = params(9)*(steady_state(6));
residual(30) = lhs - rhs;
lhs = y(35);
rhs = y(68)-y(16);
residual(31) = lhs - rhs;
lhs = log(y(20));
rhs = 0.75*log(y(4))+x(it_, 1);
residual(32) = lhs - rhs;
lhs = log(y(41));
rhs = params(11)*log(y(11))+x(it_, 2);
residual(33) = lhs - rhs;
lhs = log(y(37)/y(38));
rhs = params(10)*log(y(10)/y(38))+x(it_, 4);
residual(34) = lhs - rhs;
lhs = log(y(32));
rhs = params(11)*log(y(9))-x(it_, 3);
residual(35) = lhs - rhs;
lhs = y(40);
rhs = y(45);
residual(36) = lhs - rhs;
lhs = y(50);
rhs = y(17)/(steady_state(6));
residual(37) = lhs - rhs;
lhs = y(59);
rhs = y(18)/(steady_state(7));
residual(38) = lhs - rhs;
lhs = y(52);
rhs = y(30)/(steady_state(20));
residual(39) = lhs - rhs;
lhs = y(51);
rhs = y(12)/(steady_state(1));
residual(40) = lhs - rhs;
lhs = y(53);
rhs = y(19)/(steady_state(8));
residual(41) = lhs - rhs;
lhs = y(61);
rhs = y(15)/(steady_state(4));
residual(42) = lhs - rhs;
lhs = y(55);
rhs = y(31)/(steady_state(21));
residual(43) = lhs - rhs;
lhs = y(54);
rhs = y(16)/(steady_state(5));
residual(44) = lhs - rhs;
lhs = y(56);
rhs = y(22)/(steady_state(11));
residual(45) = lhs - rhs;
lhs = y(58);
rhs = y(76)-y(75);
residual(46) = lhs - rhs;
lhs = y(57);
rhs = y(23)/(steady_state(13));
residual(47) = lhs - rhs;
lhs = y(60);
rhs = y(27)/(steady_state(17));
residual(48) = lhs - rhs;
lhs = y(63);
rhs = y(32)/(steady_state(22));
residual(49) = lhs - rhs;
lhs = y(62);
rhs = y(24)/(steady_state(14));
residual(50) = lhs - rhs;
lhs = y(64);
rhs = y(25)/(steady_state(15));
residual(51) = lhs - rhs;
lhs = y(36);
rhs = (steady_state(26));
residual(52) = lhs - rhs;
lhs = y(38);
rhs = (steady_state(27));
residual(53) = lhs - rhs;
lhs = y(39);
rhs = (steady_state(29));
residual(54) = lhs - rhs;

end
