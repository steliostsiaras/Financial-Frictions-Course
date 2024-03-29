function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = BGGflexi.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(54, 80);
g1(1,1)=(-((-params(3))*T(11)));
g1(1,12)=(-(T(11)-params(3)*params(2)*(-params(3))*T(12)));
g1(1,65)=params(3)*params(2)*T(12);
g1(1,13)=1;
g1(2,2)=(-((-(y(13)*params(2)))/(y(2)*y(2))));
g1(2,13)=(-(params(2)/y(2)));
g1(2,14)=1;
g1(3,66)=y(16);
g1(3,16)=y(66);
g1(4,13)=(1-params(1))*y(17);
g1(4,15)=(-(params(4)*T(1)+y(15)*params(4)*getPowerDeriv(y(15),params(5),1)));
g1(4,17)=y(13)*(1-params(1));
g1(5,15)=(-(T(3)*getPowerDeriv(y(15),1-params(1),1)));
g1(5,17)=1;
g1(5,3)=(-(T(4)*y(20)*y(32)*T(13)));
g1(5,20)=(-(T(2)*T(4)));
g1(5,32)=(-(T(4)*y(20)*y(3)*T(13)));
g1(6,15)=(-((-((1-params(1))*y(17)))/(y(15)*y(15))));
g1(6,17)=(-((1-params(1))/y(15)));
g1(6,19)=1;
g1(7,17)=(-(params(1)/(y(32)*y(3))));
g1(7,3)=(-((-(y(32)*params(1)*y(17)))/(y(32)*y(3)*y(32)*y(3))));
g1(7,21)=1;
g1(7,32)=(-((-(y(3)*params(1)*y(17)))/(y(32)*y(3)*y(32)*y(3))));
g1(8,3)=(-(1-params(6)));
g1(8,18)=1;
g1(8,30)=(-(1-y(43)));
g1(8,43)=y(30);
g1(9,7)=(-((-y(30))/(y(7)*y(7))));
g1(9,30)=(-(1/y(7)));
g1(9,42)=1;
g1(10,42)=(-(params(8)*2*(y(42)-1)));
g1(10,43)=1;
g1(11,42)=(-(2*params(8)));
g1(11,44)=1;
g1(12,66)=T(5)*y(70)*y(72);
g1(12,31)=1-y(43)-y(42)*y(44);
g1(12,70)=T(5)*y(66)*y(72);
g1(12,42)=y(31)*(-y(44));
g1(12,71)=y(66)*y(70)*y(72)*2*y(71);
g1(12,43)=(-y(31));
g1(12,44)=y(31)*(-y(42));
g1(12,72)=y(66)*y(70)*T(5);
g1(13,29)=(-T(14));
g1(13,37)=(-(T(16)+T(15)*(-0.5)*2*y(37)));
g1(13,45)=1;
g1(14,29)=(-(1/y(29)))/y(37)*T(17);
g1(14,37)=T(17)*(y(37)*0.5*2*y(37)-(0.5*T(6)-log(y(29))))/(y(37)*y(37));
g1(14,46)=1;
g1(15,29)=(-(1-y(45)));
g1(15,45)=y(29);
g1(15,46)=(-1);
g1(15,47)=1;
g1(16,45)=1;
g1(16,48)=1;
g1(17,29)=(-(T(10)*(-(y(37)*2.506628274631))/(y(29)*y(37)*2.506628274631*y(29)*y(37)*2.506628274631)+1/(y(29)*y(37)*2.506628274631)*T(10)*(-(1/y(29)*2*(log(y(29))+T(6)*.5)))/(2*T(6))));
g1(17,37)=(-(T(10)*(-(y(29)*2.506628274631))/(y(29)*y(37)*2.506628274631*y(29)*y(37)*2.506628274631)+1/(y(29)*y(37)*2.506628274631)*T(10)*(2*T(6)*(-(2*(log(y(29))+T(6)*.5)*.5*2*y(37)))-T(9)*2*2*y(37))/(2*T(6)*2*T(6))));
g1(17,49)=1;
g1(18,21)=(-(y(32)/y(8)));
g1(18,22)=1;
g1(18,8)=(-((-(y(32)*(y(21)+(1-params(6))*y(31))))/(y(8)*y(8))));
g1(18,31)=(-(y(32)*(1-params(6))/y(8)));
g1(18,32)=(-((y(21)+(1-params(6))*y(31))/y(8)));
g1(19,18)=y(31);
g1(19,23)=(-1);
g1(19,25)=(-1);
g1(19,31)=y(18);
g1(20,3)=(-(y(8)*y(22)*(y(36)+params(7))*(1-y(47))));
g1(20,22)=(-(y(3)*y(8)*(y(36)+params(7))*(1-y(47))));
g1(20,23)=1;
g1(20,8)=(-(y(3)*y(22)*(y(36)+params(7))*(1-y(47))));
g1(20,36)=(-(y(3)*y(8)*y(22)*(1-y(47))));
g1(20,47)=(-(y(3)*y(8)*y(22)*(-(y(36)+params(7)))));
g1(21,3)=(-(y(8)*y(22)*(1-y(47))*(1-params(7))*(1-y(36))));
g1(21,22)=(-(y(3)*y(8)*(1-y(47))*(1-params(7))*(1-y(36))));
g1(21,26)=1;
g1(21,8)=(-(y(3)*y(22)*(1-y(47))*(1-params(7))*(1-y(36))));
g1(21,36)=(-(y(3)*y(8)*y(22)*(1-y(47))*(-(1-params(7)))));
g1(21,47)=(-(y(3)*y(8)*y(22)*(-((1-params(7))*(1-y(36))))));
g1(22,18)=(-y(31));
g1(22,23)=y(24);
g1(22,24)=y(23);
g1(22,31)=(-y(18));
g1(23,67)=(-(y(24)-1));
g1(23,68)=y(24)*(y(74)-y(39)*y(73));
g1(23,24)=y(68)*(y(74)-y(39)*y(73))-y(67);
g1(23,39)=y(24)*y(68)*(-y(73));
g1(23,73)=y(24)*y(68)*(-y(39));
g1(23,74)=y(24)*y(68);
g1(24,3)=(-((y(3)*y(22)*y(8)*y(8)*y(5)-y(5)*(y(3)*y(8)-y(6))*y(22)*y(8))/(y(3)*y(22)*y(8)*y(3)*y(22)*y(8))));
g1(24,22)=(-((-(y(3)*y(8)*y(5)*(y(3)*y(8)-y(6))))/(y(3)*y(22)*y(8)*y(3)*y(22)*y(8))));
g1(24,5)=(-((y(3)*y(8)-y(6))/(y(3)*y(22)*y(8))));
g1(24,6)=(-((-y(5))/(y(3)*y(22)*y(8))));
g1(24,29)=1;
g1(24,8)=(-((y(3)*y(22)*y(8)*y(3)*y(5)-y(5)*(y(3)*y(8)-y(6))*y(3)*y(22))/(y(3)*y(22)*y(8)*y(3)*y(22)*y(8))));
g1(25,27)=1;
g1(25,39)=(-((-(y(48)*(y(48)*(-y(46))+(1-y(47))*(-y(49)))))/T(18)));
g1(25,46)=(-((-(y(48)*y(48)*(-y(39))))/T(18)));
g1(25,47)=(-((-(y(48)*(y(48)-(y(48)-y(49)*y(39)))))/T(18)));
g1(25,48)=(-((y(48)*(y(47)-y(46)*y(39))+(1-y(47))*(y(48)-y(49)*y(39))-y(48)*(1-y(47)+y(47)-y(46)*y(39)))/T(18)));
g1(25,49)=(-((-(y(48)*(1-y(47))*(-y(39))))/T(18)));
g1(26,16)=(-y(27));
g1(26,27)=(-y(16));
g1(26,28)=1;
g1(27,68)=1;
g1(27,69)=(-1);
g1(28,12)=(-1);
g1(28,17)=1;
g1(28,3)=(-(y(8)*y(22)*y(46)*y(39)));
g1(28,22)=(-(y(3)*y(8)*y(46)*y(39)));
g1(28,26)=(-1);
g1(28,30)=(-1);
g1(28,8)=(-(y(3)*y(22)*y(46)*y(39)));
g1(28,33)=(-1);
g1(28,39)=(-(y(3)*y(8)*y(46)*y(22)));
g1(28,46)=(-(y(3)*y(8)*y(22)*y(39)));
g1(29,33)=1;
g1(29,34)=(-1);
g1(30,33)=1;
g1(31,16)=1;
g1(31,68)=(-1);
g1(31,35)=1;
g1(32,4)=(-(0.75*1/y(4)));
g1(32,20)=1/y(20);
g1(32,77)=(-1);
g1(33,11)=(-(params(11)*1/y(11)));
g1(33,41)=1/y(41);
g1(33,78)=(-1);
g1(34,10)=(-(params(10)*1/y(38)/(y(10)/y(38))));
g1(34,37)=1/y(38)/(y(37)/y(38));
g1(34,38)=(-y(37))/(y(38)*y(38))/(y(37)/y(38))-params(10)*(-y(10))/(y(38)*y(38))/(y(10)/y(38));
g1(34,80)=(-1);
g1(35,9)=(-(params(11)*1/y(9)));
g1(35,32)=1/y(32);
g1(35,79)=1;
g1(36,40)=1;
g1(36,45)=(-1);
g1(37,17)=(-(1/(steady_state(6))));
g1(37,50)=1;
g1(38,18)=(-(1/(steady_state(7))));
g1(38,59)=1;
g1(39,30)=(-(1/(steady_state(20))));
g1(39,52)=1;
g1(40,12)=(-(1/(steady_state(1))));
g1(40,51)=1;
g1(41,19)=(-(1/(steady_state(8))));
g1(41,53)=1;
g1(42,15)=(-(1/(steady_state(4))));
g1(42,61)=1;
g1(43,31)=(-(1/(steady_state(21))));
g1(43,55)=1;
g1(44,16)=(-(1/(steady_state(5))));
g1(44,54)=1;
g1(45,22)=(-(1/(steady_state(11))));
g1(45,56)=1;
g1(46,75)=1;
g1(46,76)=(-1);
g1(46,58)=1;
g1(47,23)=(-(1/(steady_state(13))));
g1(47,57)=1;
g1(48,27)=(-(1/(steady_state(17))));
g1(48,60)=1;
g1(49,32)=(-(1/(steady_state(22))));
g1(49,63)=1;
g1(50,24)=(-(1/(steady_state(14))));
g1(50,62)=1;
g1(51,25)=(-(1/(steady_state(15))));
g1(51,64)=1;
g1(52,36)=1;
g1(53,38)=1;
g1(54,39)=1;

end
