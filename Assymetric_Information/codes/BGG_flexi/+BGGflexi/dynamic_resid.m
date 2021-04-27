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
lhs = y(12);
rhs = T(1)-T(1)*params(3)*params(2);
residual(1) = lhs - rhs;
lhs = y(13);
rhs = y(12)*params(2)/y(1);
residual(2) = lhs - rhs;
lhs = y(64)*y(15);
rhs = 1;
residual(3) = lhs - rhs;
lhs = y(12)*(1-params(1))*y(16);
rhs = y(14)*params(4)*T(2);
residual(4) = lhs - rhs;
lhs = y(16);
rhs = T(4)*T(5);
residual(5) = lhs - rhs;
lhs = y(18);
rhs = (1-params(1))*y(16)/y(14);
residual(6) = lhs - rhs;
lhs = y(21);
rhs = params(1)*y(16)/(y(31)*y(2));
residual(7) = lhs - rhs;
lhs = y(17);
rhs = (1-y(42))*y(29)+y(2)*(1-params(6));
residual(8) = lhs - rhs;
lhs = y(41);
rhs = y(29)/y(6);
residual(9) = lhs - rhs;
lhs = y(42);
rhs = params(8)*(y(41)-1)^2;
residual(10) = lhs - rhs;
lhs = y(43);
rhs = (y(41)-1)*2*params(8);
residual(11) = lhs - rhs;
lhs = y(30)*(1-y(42)-y(41)*y(43))+y(64)*y(68)*y(70)*T(6);
rhs = 1;
residual(12) = lhs - rhs;
lhs = y(44);
rhs = T(8);
residual(13) = lhs - rhs;
lhs = y(45);
rhs = 1-normcdf(T(9),0,1);
residual(14) = lhs - rhs;
lhs = y(46);
rhs = y(45)+y(28)*(1-y(44));
residual(15) = lhs - rhs;
lhs = y(47);
rhs = 1-y(44);
residual(16) = lhs - rhs;
lhs = y(48);
rhs = 1/(y(28)*y(36)*2.506628274631)*T(11);
residual(17) = lhs - rhs;
lhs = y(20);
rhs = y(31)*(y(21)+(1-params(6))*y(30))/y(7);
residual(18) = lhs - rhs;
lhs = y(17)*y(30);
rhs = y(24)+y(22);
residual(19) = lhs - rhs;
lhs = y(22);
rhs = y(2)*y(7)*y(20)*(y(35)+params(7))*(1-y(46));
residual(20) = lhs - rhs;
lhs = y(25);
rhs = y(2)*y(7)*y(20)*(1-y(46))*(1-params(7))*(1-y(35));
residual(21) = lhs - rhs;
lhs = y(22)*y(23);
rhs = y(17)*y(30);
residual(22) = lhs - rhs;
lhs = y(23)*y(66)*(y(72)-y(38)*y(71));
rhs = y(65)*(y(23)-1);
residual(23) = lhs - rhs;
lhs = y(28);
rhs = y(3)*(y(2)*y(7)-y(5))/(y(2)*y(20)*y(7));
residual(24) = lhs - rhs;
lhs = y(26);
rhs = y(47)/(y(47)*(y(46)-y(45)*y(38))+(1-y(46))*(y(47)-y(48)*y(38)));
residual(25) = lhs - rhs;
lhs = y(27);
rhs = y(15)*y(26);
residual(26) = lhs - rhs;
lhs = y(66);
rhs = y(67);
residual(27) = lhs - rhs;
lhs = y(16);
rhs = y(29)+y(11)+y(25)+y(32)+y(2)*y(7)*y(20)*y(45)*y(38);
residual(28) = lhs - rhs;
lhs = y(32);
rhs = y(33);
residual(29) = lhs - rhs;
lhs = y(32);
rhs = params(9)*(steady_state(6));
residual(30) = lhs - rhs;
lhs = y(34);
rhs = y(66)-y(15);
residual(31) = lhs - rhs;
lhs = log(y(19));
rhs = 0.75*log(y(4))+x(it_, 1);
residual(32) = lhs - rhs;
lhs = log(y(40));
rhs = params(11)*log(y(10))+x(it_, 2);
residual(33) = lhs - rhs;
lhs = log(y(36)/y(37));
rhs = params(10)*log(y(9)/y(37))+x(it_, 4)*0.07;
residual(34) = lhs - rhs;
lhs = log(y(31));
rhs = params(11)*log(y(8))-x(it_, 3);
residual(35) = lhs - rhs;
lhs = y(39);
rhs = y(44);
residual(36) = lhs - rhs;
lhs = y(49);
rhs = y(16)/(steady_state(6));
residual(37) = lhs - rhs;
lhs = y(58);
rhs = y(17)/(steady_state(7));
residual(38) = lhs - rhs;
lhs = y(51);
rhs = y(29)/(steady_state(20));
residual(39) = lhs - rhs;
lhs = y(50);
rhs = y(11)/(steady_state(1));
residual(40) = lhs - rhs;
lhs = y(52);
rhs = y(18)/(steady_state(8));
residual(41) = lhs - rhs;
lhs = y(60);
rhs = y(14)/(steady_state(4));
residual(42) = lhs - rhs;
lhs = y(54);
rhs = y(30)/(steady_state(21));
residual(43) = lhs - rhs;
lhs = y(53);
rhs = y(15)/(steady_state(5));
residual(44) = lhs - rhs;
lhs = y(55);
rhs = y(20)/(steady_state(11));
residual(45) = lhs - rhs;
lhs = y(57);
rhs = y(74)-y(73);
residual(46) = lhs - rhs;
lhs = y(56);
rhs = y(22)/(steady_state(13));
residual(47) = lhs - rhs;
lhs = y(59);
rhs = y(26)/(steady_state(17));
residual(48) = lhs - rhs;
lhs = y(62);
rhs = y(31)/(steady_state(22));
residual(49) = lhs - rhs;
lhs = y(61);
rhs = y(23)/(steady_state(14));
residual(50) = lhs - rhs;
lhs = y(63);
rhs = y(24)/(steady_state(15));
residual(51) = lhs - rhs;
lhs = y(35);
rhs = (steady_state(26));
residual(52) = lhs - rhs;
lhs = y(37);
rhs = (steady_state(27));
residual(53) = lhs - rhs;
lhs = y(38);
rhs = (steady_state(29));
residual(54) = lhs - rhs;

end
