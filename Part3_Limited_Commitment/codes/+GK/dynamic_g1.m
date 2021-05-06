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
    T = GK.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(49, 72);
g1(1,1)=(-(1-params(6)));
g1(1,11)=1;
g1(1,13)=(-(1-y(34)));
g1(1,34)=y(13);
g1(2,2)=(-((-y(13))/(y(2)*y(2))));
g1(2,13)=(-(1/y(2)));
g1(2,33)=1;
g1(3,33)=(-(params(10)*2*(y(33)-1)));
g1(3,34)=1;
g1(4,33)=(-(2*params(10)));
g1(4,35)=1;
g1(5,11)=1;
g1(5,25)=(-y(39));
g1(5,39)=(-y(25));
g1(6,21)=1-y(34)-y(33)*y(35);
g1(6,62)=T(1)*y(63)*y(67);
g1(6,63)=T(1)*y(62)*y(67);
g1(6,33)=y(21)*(-y(35));
g1(6,66)=y(63)*y(62)*y(67)*2*y(66);
g1(6,34)=(-y(21));
g1(6,35)=y(21)*(-y(33));
g1(6,67)=y(63)*y(62)*T(1);
g1(7,10)=1;
g1(7,1)=(-(T(4)*y(37)*getPowerDeriv(y(1),params(1),1)));
g1(7,12)=(-(T(3)*getPowerDeriv(y(12),1-params(1),1)));
g1(7,37)=(-(T(2)*T(4)));
g1(8,14)=(-(T(7)-params(3)*params(2)*T(7)));
g1(8,20)=1;
g1(9,3)=(-((-(y(20)*params(2)))/(y(3)*y(3))));
g1(9,20)=(-(params(2)/y(3)));
g1(9,26)=1;
g1(10,15)=params(2)*y(61)/y(20);
g1(10,20)=y(15)*params(2)*(-y(61))/(y(20)*y(20));
g1(10,61)=y(15)*params(2)*1/y(20);
g1(11,10)=(1-params(1))*y(20);
g1(11,12)=(-(params(4)*T(6)+y(12)*params(4)*getPowerDeriv(y(12),params(5),1)));
g1(11,20)=y(10)*(1-params(1));
g1(12,10)=(-((1-params(1))/y(12)));
g1(12,12)=(-((-(y(10)*(1-params(1))))/(y(12)*y(12))));
g1(12,17)=1;
g1(13,10)=(-(params(1)*1/y(1)));
g1(13,1)=(-(params(1)*(-y(10))/(y(1)*y(1))));
g1(13,18)=1;
g1(14,24)=(-(params(8)*params(7)));
g1(14,27)=1;
g1(15,19)=(-y(24));
g1(15,21)=y(25);
g1(15,24)=(-y(19));
g1(15,25)=y(21);
g1(16,19)=(-1);
g1(16,21)=y(25);
g1(16,23)=(-1);
g1(16,25)=y(21);
g1(17,59)=(-(y(63)*y(64)/(params(7)-y(63)*y(64)*y(65))));
g1(17,24)=1;
g1(17,63)=(-(((params(7)-y(63)*y(64)*y(65))*y(64)*y(59)-y(63)*y(64)*y(59)*(-(y(64)*y(65))))/((params(7)-y(63)*y(64)*y(65))*(params(7)-y(63)*y(64)*y(65)))));
g1(17,64)=(-(((params(7)-y(63)*y(64)*y(65))*y(63)*y(59)-y(63)*y(64)*y(59)*(-(y(63)*y(65))))/((params(7)-y(63)*y(64)*y(65))*(params(7)-y(63)*y(64)*y(65)))));
g1(17,65)=(-((-(y(63)*y(64)*y(59)*(-(y(63)*y(64)))))/((params(7)-y(63)*y(64)*y(65))*(params(7)-y(63)*y(64)*y(65)))));
g1(18,15)=params(8)*y(5);
g1(18,16)=(-((params(8)+params(9))*y(4)*y(6)));
g1(18,19)=1;
g1(18,4)=(-((params(8)+params(9))*y(16)*y(6)));
g1(18,5)=y(15)*params(8);
g1(18,6)=(-(y(16)*y(4)*(params(8)+params(9))));
g1(19,16)=1;
g1(19,18)=(-(y(39)/y(4)));
g1(19,4)=(-((-(y(39)*(y(18)+(1-params(6))*y(21))))/(y(4)*y(4))));
g1(19,21)=(-((1-params(6))*y(39)/y(4)));
g1(19,39)=(-((y(18)+(1-params(6))*y(21))/y(4)));
g1(20,10)=1;
g1(20,13)=(-1);
g1(20,14)=(-1);
g1(20,29)=(-1);
g1(21,28)=(-1);
g1(21,29)=1;
g1(22,29)=1;
g1(22,38)=(-(params(11)*(steady_state(1))));
g1(23,15)=1;
g1(23,60)=(-1);
g1(23,36)=1;
g1(24,15)=1;
g1(24,16)=(-1);
g1(24,30)=1;
g1(25,9)=(-(params(13)*1/y(9)));
g1(25,39)=1/y(39);
g1(25,72)=1;
g1(26,7)=(-(params(12)*1/y(7)));
g1(26,37)=1/y(37);
g1(26,70)=(-1);
g1(27,8)=(-(params(14)*1/y(8)));
g1(27,38)=1/y(38);
g1(27,71)=(-1);
g1(28,13)=(-1);
g1(28,14)=(-1);
g1(28,31)=1;
g1(29,19)=(-(1/y(22)));
g1(29,22)=(-((-y(19))/(y(22)*y(22))));
g1(29,32)=1;
g1(30,21)=(-y(25));
g1(30,22)=1;
g1(30,25)=(-y(21));
g1(31,10)=(-(1/(steady_state(1))));
g1(31,40)=1;
g1(32,31)=(-(1/(steady_state(22))));
g1(32,56)=1;
g1(33,22)=(-(1/(steady_state(13))));
g1(33,58)=1;
g1(34,11)=(-(1/(steady_state(2))));
g1(34,41)=1;
g1(35,14)=(-(1/(steady_state(5))));
g1(35,42)=1;
g1(36,12)=(-(1/(steady_state(3))));
g1(36,43)=1;
g1(37,13)=(-(1/(steady_state(4))));
g1(37,44)=1;
g1(38,15)=(-(1/(steady_state(6))));
g1(38,45)=1;
g1(39,16)=(-(1/(steady_state(7))));
g1(39,46)=1;
g1(40,17)=(-(1/(steady_state(8))));
g1(40,47)=1;
g1(41,18)=(-(1/(steady_state(9))));
g1(41,48)=1;
g1(42,19)=(-(1/(steady_state(10))));
g1(42,49)=1;
g1(43,20)=(-(1/(steady_state(11))));
g1(43,50)=1;
g1(44,21)=(-(1/(steady_state(12))));
g1(44,51)=1;
g1(45,23)=(-(1/(steady_state(14))));
g1(45,52)=1;
g1(46,24)=(-(1/(steady_state(15))));
g1(46,53)=1;
g1(47,28)=(-(1/(steady_state(19))));
g1(47,54)=1;
g1(48,29)=(-(1/(steady_state(20))));
g1(48,55)=1;
g1(49,68)=1;
g1(49,69)=(-1);
g1(49,57)=1;

end
