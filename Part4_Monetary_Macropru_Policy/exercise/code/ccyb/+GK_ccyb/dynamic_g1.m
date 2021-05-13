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
    T = GK_ccyb.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(52, 78);
g1(1,2)=(-(1-params(6)));
g1(1,14)=1;
g1(1,16)=(-(1-y(37)));
g1(1,37)=y(16);
g1(2,3)=(-((-y(16))/(y(3)*y(3))));
g1(2,16)=(-(1/y(3)));
g1(2,36)=1;
g1(3,36)=(-(params(10)*2*(y(36)-1)));
g1(3,37)=1;
g1(4,36)=(-(2*params(10)));
g1(4,38)=1;
g1(5,14)=1;
g1(5,28)=(-y(43));
g1(5,43)=(-y(28));
g1(6,24)=1-y(37)-y(36)*y(38);
g1(6,68)=T(1)*y(69)*y(73);
g1(6,69)=T(1)*y(68)*y(73);
g1(6,36)=y(24)*(-y(38));
g1(6,72)=y(69)*y(68)*y(73)*2*y(72);
g1(6,37)=(-y(24));
g1(6,38)=y(24)*(-y(36));
g1(6,73)=y(69)*y(68)*T(1);
g1(7,13)=1;
g1(7,2)=(-(T(4)*y(41)*getPowerDeriv(y(2),params(1),1)));
g1(7,15)=(-(T(3)*getPowerDeriv(y(15),1-params(1),1)));
g1(7,41)=(-(T(2)*T(4)));
g1(8,17)=(-(T(8)-params(3)*params(2)*T(8)));
g1(8,23)=1;
g1(9,4)=(-((-(y(23)*params(2)))/(y(4)*y(4))));
g1(9,23)=(-(params(2)/y(4)));
g1(9,29)=1;
g1(10,18)=params(2)*y(67)/y(23);
g1(10,23)=y(18)*params(2)*(-y(67))/(y(23)*y(23));
g1(10,67)=y(18)*params(2)*1/y(23);
g1(11,13)=(1-params(1))*y(23);
g1(11,15)=(-(params(4)*T(6)+y(15)*params(4)*getPowerDeriv(y(15),params(5),1)));
g1(11,23)=y(13)*(1-params(1));
g1(12,13)=(-((1-params(1))/y(15)));
g1(12,15)=(-((-(y(13)*(1-params(1))))/(y(15)*y(15))));
g1(12,20)=1;
g1(13,13)=(-(params(1)*1/y(2)));
g1(13,2)=(-(params(1)*(-y(13))/(y(2)*y(2))));
g1(13,21)=1;
g1(14,27)=(-(params(8)*y(40)));
g1(14,30)=1;
g1(14,40)=(-(params(8)*y(27)));
g1(15,22)=(-y(27));
g1(15,24)=y(28);
g1(15,27)=(-y(22));
g1(15,28)=y(24);
g1(16,22)=(-1);
g1(16,24)=y(28);
g1(16,26)=(-1);
g1(16,28)=y(24);
g1(17,1)=T(7);
g1(17,13)=T(7);
g1(17,24)=(-(params(12)*y(28)/(y(13)+y(1)+y(11)+y(12))));
g1(17,28)=(-(params(12)*y(24)/(y(13)+y(1)+y(11)+y(12))));
g1(17,40)=1;
g1(17,11)=T(7);
g1(17,12)=T(7);
g1(18,65)=(-(y(69)*y(70)/(y(40)-y(69)*y(70)*y(71))));
g1(18,27)=1;
g1(18,69)=(-(((y(40)-y(69)*y(70)*y(71))*y(70)*y(65)-y(69)*y(70)*y(65)*(-(y(70)*y(71))))/((y(40)-y(69)*y(70)*y(71))*(y(40)-y(69)*y(70)*y(71)))));
g1(18,70)=(-(((y(40)-y(69)*y(70)*y(71))*y(69)*y(65)-y(69)*y(70)*y(65)*(-(y(69)*y(71))))/((y(40)-y(69)*y(70)*y(71))*(y(40)-y(69)*y(70)*y(71)))));
g1(18,71)=(-((-(y(69)*y(70)*y(65)*(-(y(69)*y(70)))))/((y(40)-y(69)*y(70)*y(71))*(y(40)-y(69)*y(70)*y(71)))));
g1(18,40)=(-((-(y(69)*y(70)*y(65)))/((y(40)-y(69)*y(70)*y(71))*(y(40)-y(69)*y(70)*y(71)))));
g1(19,18)=params(8)*y(6);
g1(19,19)=(-((params(8)+params(9))*y(5)*y(7)));
g1(19,22)=1;
g1(19,5)=(-((params(8)+params(9))*y(19)*y(7)));
g1(19,6)=y(18)*params(8);
g1(19,7)=(-(y(19)*y(5)*(params(8)+params(9))));
g1(20,19)=1;
g1(20,21)=(-(y(43)/y(5)));
g1(20,5)=(-((-(y(43)*(y(21)+(1-params(6))*y(24))))/(y(5)*y(5))));
g1(20,24)=(-((1-params(6))*y(43)/y(5)));
g1(20,43)=(-((y(21)+(1-params(6))*y(24))/y(5)));
g1(21,13)=1;
g1(21,16)=(-1);
g1(21,17)=(-1);
g1(21,32)=(-1);
g1(22,31)=(-1);
g1(22,32)=1;
g1(23,32)=1;
g1(23,42)=(-((steady_state(1))*params(11)));
g1(24,18)=1;
g1(24,66)=(-1);
g1(24,39)=1;
g1(25,18)=1;
g1(25,19)=(-1);
g1(25,33)=1;
g1(26,10)=(-(params(14)*1/y(10)));
g1(26,43)=1/y(43);
g1(26,78)=1;
g1(27,8)=(-(params(13)*1/y(8)));
g1(27,41)=1/y(41);
g1(27,76)=(-1);
g1(28,9)=(-(params(15)*1/y(9)));
g1(28,42)=1/y(42);
g1(28,77)=(-1);
g1(29,16)=(-1);
g1(29,17)=(-1);
g1(29,34)=1;
g1(30,22)=(-(1/y(25)));
g1(30,25)=(-((-y(22))/(y(25)*y(25))));
g1(30,35)=1;
g1(31,24)=(-y(28));
g1(31,25)=1;
g1(31,28)=(-y(24));
g1(32,13)=(-(1/(steady_state(1))));
g1(32,44)=1;
g1(33,34)=(-(1/(steady_state(22))));
g1(33,60)=1;
g1(34,25)=(-(1/(steady_state(13))));
g1(34,62)=1;
g1(35,14)=(-(1/(steady_state(2))));
g1(35,45)=1;
g1(36,17)=(-(1/(steady_state(5))));
g1(36,46)=1;
g1(37,15)=(-(1/(steady_state(3))));
g1(37,47)=1;
g1(38,16)=(-(1/(steady_state(4))));
g1(38,48)=1;
g1(39,18)=(-(1/(steady_state(6))));
g1(39,49)=1;
g1(40,19)=(-(1/(steady_state(7))));
g1(40,50)=1;
g1(41,20)=(-(1/(steady_state(8))));
g1(41,51)=1;
g1(42,21)=(-(1/(steady_state(9))));
g1(42,52)=1;
g1(43,22)=(-(1/(steady_state(10))));
g1(43,53)=1;
g1(44,23)=(-(1/(steady_state(11))));
g1(44,54)=1;
g1(45,24)=(-(1/(steady_state(12))));
g1(45,55)=1;
g1(46,26)=(-(1/(steady_state(14))));
g1(46,56)=1;
g1(47,27)=(-(1/(steady_state(15))));
g1(47,57)=1;
g1(48,31)=(-(1/(steady_state(19))));
g1(48,58)=1;
g1(49,32)=(-(1/(steady_state(20))));
g1(49,59)=1;
g1(50,74)=1;
g1(50,75)=(-1);
g1(50,61)=1;
g1(51,1)=(-1);
g1(51,63)=1;
g1(52,11)=(-1);
g1(52,64)=1;

end
