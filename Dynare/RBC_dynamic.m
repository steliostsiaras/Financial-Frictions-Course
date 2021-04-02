function [residual, g1, g2, g3] = RBC_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(28, 1);
T12 = y(11)^(1-params(5));
T15 = (1-y(13))^params(5);
T16 = T12*T15;
T27 = (1-params(5))*y(11)^((1-params(5))*(1-params(9))-1);
T29 = (1-y(13))^(params(5)*(1-params(9)));
T35 = (-params(5))*y(11)^((1-params(5))*(1-params(9)));
T37 = (1-y(13))^(params(5)*(1-params(9))-1);
T52 = (y(13)*y(18))^params(6);
T55 = y(2)^(1-params(6));
T75 = 1-params(14)*(y(20)-1)^2;
T91 = y(20)^2;
lhs =y(7);
rhs =(T16^(1-params(9))-1)/(1-params(9));
residual(1)= lhs-rhs;
lhs =y(8);
rhs =T27*T29;
residual(2)= lhs-rhs;
lhs =y(9);
rhs =T35*T37;
residual(3)= lhs-rhs;
lhs =y(37)*y(10);
rhs =1;
residual(4)= lhs-rhs;
lhs =(-y(9))/y(8);
rhs =y(12);
residual(5)= lhs-rhs;
lhs =y(14);
rhs =T52*T55;
residual(6)= lhs-rhs;
lhs =y(14)*params(6)/y(13);
rhs =y(12);
residual(7)= lhs-rhs;
lhs =y(14);
rhs =y(11)+y(19)+y(16);
residual(8)= lhs-rhs;
lhs =y(20);
rhs =y(16)/y(3);
residual(9)= lhs-rhs;
lhs =y(15);
rhs =y(16)*T75+y(2)*(1-params(8));
residual(10)= lhs-rhs;
lhs =y(34);
rhs =y(8)*params(7)/y(1);
residual(11)= lhs-rhs;
lhs =y(22);
rhs =y(34)*(y(20)-1)*2*params(14)*T91*y(21);
residual(12)= lhs-rhs;
lhs =y(21)*(T75-(y(20)-1)*params(14)*2*y(20))+y(35);
rhs =1;
residual(13)= lhs-rhs;
lhs =y(33);
rhs =(y(14)*(1-params(6))/y(2)+(1-params(8))*y(21))/y(6);
residual(14)= lhs-rhs;
lhs =y(37)*y(36);
rhs =y(37)*y(10);
residual(15)= lhs-rhs;
lhs =y(19);
rhs =y(13)*y(12)*y(17);
residual(16)= lhs-rhs;
lhs =log(y(18))-log((steady_state(12)));
rhs =params(10)*(log(y(4))-log((steady_state(12))))+params(13)*x(it_, 1);
residual(17)= lhs-rhs;
lhs =log(y(19))-log((steady_state(13)));
rhs =params(11)*(log(y(5))-log((steady_state(13))))+params(13)*x(it_, 2);
residual(18)= lhs-rhs;
lhs =y(24);
rhs =y(14)/(steady_state(8));
residual(19)= lhs-rhs;
lhs =y(29);
rhs =y(15)/(steady_state(9));
residual(20)= lhs-rhs;
lhs =y(28);
rhs =y(16)/(steady_state(10));
residual(21)= lhs-rhs;
lhs =y(25);
rhs =y(11)/(steady_state(5));
residual(22)= lhs-rhs;
lhs =y(27);
rhs =y(12)/(steady_state(6));
residual(23)= lhs-rhs;
lhs =y(26);
rhs =y(13)/(steady_state(7));
residual(24)= lhs-rhs;
lhs =y(23);
rhs =y(10)/(steady_state(4));
residual(25)= lhs-rhs;
lhs =y(30);
rhs =y(15)/y(14);
residual(26)= lhs-rhs;
lhs =y(31);
rhs =y(16)/y(14);
residual(27)= lhs-rhs;
lhs =y(32);
rhs =y(11)/y(14);
residual(28)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(28, 39);

  %
  % Jacobian matrix
  %

T196 = getPowerDeriv(y(11),1-params(5),1);
T197 = T15*T196;
T198 = getPowerDeriv(T16,1-params(9),1);
T203 = (1-params(5))*getPowerDeriv(y(11),(1-params(5))*(1-params(9))-1,1);
T207 = (-params(5))*getPowerDeriv(y(11),(1-params(5))*(1-params(9)),1);
T219 = (-(getPowerDeriv(1-y(13),params(5),1)));
T220 = T12*T219;
T225 = (-(getPowerDeriv(1-y(13),params(5)*(1-params(9)),1)));
T229 = (-(getPowerDeriv(1-y(13),params(5)*(1-params(9))-1,1)));
T232 = getPowerDeriv(y(13)*y(18),params(6),1);
T259 = getPowerDeriv(y(2),1-params(6),1);
  g1(1,7)=1;
  g1(1,11)=(-(T197*T198/(1-params(9))));
  g1(1,13)=(-(T198*T220/(1-params(9))));
  g1(2,8)=1;
  g1(2,11)=(-(T29*T203));
  g1(2,13)=(-(T27*T225));
  g1(3,9)=1;
  g1(3,11)=(-(T37*T207));
  g1(3,13)=(-(T35*T229));
  g1(4,10)=y(37);
  g1(4,37)=y(10);
  g1(5,8)=y(9)/(y(8)*y(8));
  g1(5,9)=(-1)/y(8);
  g1(5,12)=(-1);
  g1(6,13)=(-(T55*y(18)*T232));
  g1(6,14)=1;
  g1(6,2)=(-(T52*T259));
  g1(6,18)=(-(T55*y(13)*T232));
  g1(7,12)=(-1);
  g1(7,13)=(-(y(14)*params(6)))/(y(13)*y(13));
  g1(7,14)=params(6)/y(13);
  g1(8,11)=(-1);
  g1(8,14)=1;
  g1(8,16)=(-1);
  g1(8,19)=(-1);
  g1(9,3)=(-((-y(16))/(y(3)*y(3))));
  g1(9,16)=(-(1/y(3)));
  g1(9,20)=1;
  g1(10,2)=(-(1-params(8)));
  g1(10,15)=1;
  g1(10,16)=(-T75);
  g1(10,20)=(-(y(16)*(-(params(14)*2*(y(20)-1)))));
  g1(11,1)=(-((-(y(8)*params(7)))/(y(1)*y(1))));
  g1(11,8)=(-(params(7)/y(1)));
  g1(11,34)=1;
  g1(12,20)=(-(y(34)*y(21)*(2*params(14)*T91+(y(20)-1)*2*params(14)*2*y(20))));
  g1(12,21)=(-(y(34)*(y(20)-1)*2*params(14)*T91));
  g1(12,22)=1;
  g1(12,34)=(-((y(20)-1)*2*params(14)*T91*y(21)));
  g1(13,20)=y(21)*((-(params(14)*2*(y(20)-1)))-((y(20)-1)*2*params(14)+params(14)*2*y(20)));
  g1(13,21)=T75-(y(20)-1)*params(14)*2*y(20);
  g1(13,35)=1;
  g1(14,14)=(-((1-params(6))/y(2)/y(6)));
  g1(14,2)=(-((-(y(14)*(1-params(6))))/(y(2)*y(2))/y(6)));
  g1(14,6)=(-((-(y(14)*(1-params(6))/y(2)+(1-params(8))*y(21)))/(y(6)*y(6))));
  g1(14,21)=(-((1-params(8))/y(6)));
  g1(14,33)=1;
  g1(15,10)=(-y(37));
  g1(15,36)=y(37);
  g1(15,37)=y(36)-y(10);
  g1(16,12)=(-(y(13)*y(17)));
  g1(16,13)=(-(y(12)*y(17)));
  g1(16,17)=(-(y(13)*y(12)));
  g1(16,19)=1;
  g1(17,4)=(-(params(10)*1/y(4)));
  g1(17,18)=1/y(18);
  g1(17,38)=(-params(13));
  g1(18,5)=(-(params(11)*1/y(5)));
  g1(18,19)=1/y(19);
  g1(18,39)=(-params(13));
  g1(19,14)=(-(1/(steady_state(8))));
  g1(19,24)=1;
  g1(20,15)=(-(1/(steady_state(9))));
  g1(20,29)=1;
  g1(21,16)=(-(1/(steady_state(10))));
  g1(21,28)=1;
  g1(22,11)=(-(1/(steady_state(5))));
  g1(22,25)=1;
  g1(23,12)=(-(1/(steady_state(6))));
  g1(23,27)=1;
  g1(24,13)=(-(1/(steady_state(7))));
  g1(24,26)=1;
  g1(25,10)=(-(1/(steady_state(4))));
  g1(25,23)=1;
  g1(26,14)=(-((-y(15))/(y(14)*y(14))));
  g1(26,15)=(-(1/y(14)));
  g1(26,30)=1;
  g1(27,14)=(-((-y(16))/(y(14)*y(14))));
  g1(27,16)=(-(1/y(14)));
  g1(27,31)=1;
  g1(28,11)=(-(1/y(14)));
  g1(28,14)=(-((-y(11))/(y(14)*y(14))));
  g1(28,32)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(81,3);
T317 = getPowerDeriv(T16,1-params(9),2);
T318 = T197*T317;
T365 = getPowerDeriv(y(13)*y(18),params(6),2);
T366 = y(18)*T365;
T473 = (-((-1)/(y(14)*y(14))));
  v2(1,1)=1;
  v2(1,2)=401;
  v2(1,3)=(-((T198*T15*getPowerDeriv(y(11),1-params(5),2)+T197*T318)/(1-params(9))));
  v2(2,1)=1;
  v2(2,2)=479;
  v2(2,3)=(-((T220*T318+T198*T196*T219)/(1-params(9))));
  v2(3,1)=1;
  v2(3,2)=403;
  v2(3,3)=  v2(2,3);
  v2(4,1)=1;
  v2(4,2)=481;
  v2(4,3)=(-((T220*T220*T317+T198*T12*getPowerDeriv(1-y(13),params(5),2))/(1-params(9))));
  v2(5,1)=2;
  v2(5,2)=401;
  v2(5,3)=(-(T29*(1-params(5))*getPowerDeriv(y(11),(1-params(5))*(1-params(9))-1,2)));
  v2(6,1)=2;
  v2(6,2)=479;
  v2(6,3)=(-(T203*T225));
  v2(7,1)=2;
  v2(7,2)=403;
  v2(7,3)=  v2(6,3);
  v2(8,1)=2;
  v2(8,2)=481;
  v2(8,3)=(-(T27*getPowerDeriv(1-y(13),params(5)*(1-params(9)),2)));
  v2(9,1)=3;
  v2(9,2)=401;
  v2(9,3)=(-(T37*(-params(5))*getPowerDeriv(y(11),(1-params(5))*(1-params(9)),2)));
  v2(10,1)=3;
  v2(10,2)=479;
  v2(10,3)=(-(T207*T229));
  v2(11,1)=3;
  v2(11,2)=403;
  v2(11,3)=  v2(10,3);
  v2(12,1)=3;
  v2(12,2)=481;
  v2(12,3)=(-(T35*getPowerDeriv(1-y(13),params(5)*(1-params(9))-1,2)));
  v2(13,1)=4;
  v2(13,2)=1414;
  v2(13,3)=1;
  v2(14,1)=4;
  v2(14,2)=388;
  v2(14,3)=  v2(13,3);
  v2(15,1)=5;
  v2(15,2)=281;
  v2(15,3)=(-(y(9)*(y(8)+y(8))))/(y(8)*y(8)*y(8)*y(8));
  v2(16,1)=5;
  v2(16,2)=320;
  v2(16,3)=1/(y(8)*y(8));
  v2(17,1)=5;
  v2(17,2)=282;
  v2(17,3)=  v2(16,3);
  v2(18,1)=6;
  v2(18,2)=481;
  v2(18,3)=(-(T55*y(18)*T366));
  v2(19,1)=6;
  v2(19,2)=52;
  v2(19,3)=(-(y(18)*T232*T259));
  v2(20,1)=6;
  v2(20,2)=470;
  v2(20,3)=  v2(19,3);
  v2(21,1)=6;
  v2(21,2)=41;
  v2(21,3)=(-(T52*getPowerDeriv(y(2),1-params(6),2)));
  v2(22,1)=6;
  v2(22,2)=676;
  v2(22,3)=(-(T55*(T232+y(13)*T366)));
  v2(23,1)=6;
  v2(23,2)=486;
  v2(23,3)=  v2(22,3);
  v2(24,1)=6;
  v2(24,2)=665;
  v2(24,3)=(-(T259*y(13)*T232));
  v2(25,1)=6;
  v2(25,2)=57;
  v2(25,3)=  v2(24,3);
  v2(26,1)=6;
  v2(26,2)=681;
  v2(26,3)=(-(T55*y(13)*y(13)*T365));
  v2(27,1)=7;
  v2(27,2)=481;
  v2(27,3)=(-((-(y(14)*params(6)))*(y(13)+y(13))))/(y(13)*y(13)*y(13)*y(13));
  v2(28,1)=7;
  v2(28,2)=520;
  v2(28,3)=(-params(6))/(y(13)*y(13));
  v2(29,1)=7;
  v2(29,2)=482;
  v2(29,3)=  v2(28,3);
  v2(30,1)=9;
  v2(30,2)=81;
  v2(30,3)=(-((-((-y(16))*(y(3)+y(3))))/(y(3)*y(3)*y(3)*y(3))));
  v2(31,1)=9;
  v2(31,2)=588;
  v2(31,3)=(-((-1)/(y(3)*y(3))));
  v2(32,1)=9;
  v2(32,2)=94;
  v2(32,3)=  v2(31,3);
  v2(33,1)=10;
  v2(33,2)=757;
  v2(33,3)=params(14)*2*(y(20)-1);
  v2(34,1)=10;
  v2(34,2)=605;
  v2(34,3)=  v2(33,3);
  v2(35,1)=10;
  v2(35,2)=761;
  v2(35,3)=(-(y(16)*(-(2*params(14)))));
  v2(36,1)=11;
  v2(36,2)=1;
  v2(36,3)=(-((-((-(y(8)*params(7)))*(y(1)+y(1))))/(y(1)*y(1)*y(1)*y(1))));
  v2(37,1)=11;
  v2(37,2)=274;
  v2(37,3)=(-((-params(7))/(y(1)*y(1))));
  v2(38,1)=11;
  v2(38,2)=8;
  v2(38,3)=  v2(37,3);
  v2(39,1)=12;
  v2(39,2)=761;
  v2(39,3)=(-(y(34)*y(21)*(2*params(14)*2*y(20)+2*params(14)*2*y(20)+2*(y(20)-1)*2*params(14))));
  v2(40,1)=12;
  v2(40,2)=800;
  v2(40,3)=(-(y(34)*(2*params(14)*T91+(y(20)-1)*2*params(14)*2*y(20))));
  v2(41,1)=12;
  v2(41,2)=762;
  v2(41,3)=  v2(40,3);
  v2(42,1)=12;
  v2(42,2)=1307;
  v2(42,3)=(-(y(21)*(2*params(14)*T91+(y(20)-1)*2*params(14)*2*y(20))));
  v2(43,1)=12;
  v2(43,2)=775;
  v2(43,3)=  v2(42,3);
  v2(44,1)=12;
  v2(44,2)=1308;
  v2(44,3)=(-((y(20)-1)*2*params(14)*T91));
  v2(45,1)=12;
  v2(45,2)=814;
  v2(45,3)=  v2(44,3);
  v2(46,1)=13;
  v2(46,2)=761;
  v2(46,3)=y(21)*((-(2*params(14)))-(2*params(14)+2*params(14)));
  v2(47,1)=13;
  v2(47,2)=800;
  v2(47,3)=(-(params(14)*2*(y(20)-1)))-((y(20)-1)*2*params(14)+params(14)*2*y(20));
  v2(48,1)=13;
  v2(48,2)=762;
  v2(48,3)=  v2(47,3);
  v2(49,1)=14;
  v2(49,2)=53;
  v2(49,3)=(-((-(1-params(6)))/(y(2)*y(2))/y(6)));
  v2(50,1)=14;
  v2(50,2)=509;
  v2(50,3)=  v2(49,3);
  v2(51,1)=14;
  v2(51,2)=41;
  v2(51,3)=(-((-((-(y(14)*(1-params(6))))*(y(2)+y(2))))/(y(2)*y(2)*y(2)*y(2))/y(6)));
  v2(52,1)=14;
  v2(52,2)=209;
  v2(52,3)=(-((-((1-params(6))/y(2)))/(y(6)*y(6))));
  v2(53,1)=14;
  v2(53,2)=513;
  v2(53,3)=  v2(52,3);
  v2(54,1)=14;
  v2(54,2)=197;
  v2(54,3)=(-((-((-(y(14)*(1-params(6))))/(y(2)*y(2))))/(y(6)*y(6))));
  v2(55,1)=14;
  v2(55,2)=45;
  v2(55,3)=  v2(54,3);
  v2(56,1)=14;
  v2(56,2)=201;
  v2(56,3)=(-((-((-(y(14)*(1-params(6))/y(2)+(1-params(8))*y(21)))*(y(6)+y(6))))/(y(6)*y(6)*y(6)*y(6))));
  v2(57,1)=14;
  v2(57,2)=786;
  v2(57,3)=(-((-(1-params(8)))/(y(6)*y(6))));
  v2(58,1)=14;
  v2(58,2)=216;
  v2(58,3)=  v2(57,3);
  v2(59,1)=15;
  v2(59,2)=1414;
  v2(59,3)=(-1);
  v2(60,1)=15;
  v2(60,2)=388;
  v2(60,3)=  v2(59,3);
  v2(61,1)=15;
  v2(61,2)=1440;
  v2(61,3)=1;
  v2(62,1)=15;
  v2(62,2)=1402;
  v2(62,3)=  v2(61,3);
  v2(63,1)=16;
  v2(63,2)=480;
  v2(63,3)=(-y(17));
  v2(64,1)=16;
  v2(64,2)=442;
  v2(64,3)=  v2(63,3);
  v2(65,1)=16;
  v2(65,2)=636;
  v2(65,3)=(-y(13));
  v2(66,1)=16;
  v2(66,2)=446;
  v2(66,3)=  v2(65,3);
  v2(67,1)=16;
  v2(67,2)=637;
  v2(67,3)=(-y(12));
  v2(68,1)=16;
  v2(68,2)=485;
  v2(68,3)=  v2(67,3);
  v2(69,1)=17;
  v2(69,2)=121;
  v2(69,3)=(-(params(10)*(-1)/(y(4)*y(4))));
  v2(70,1)=17;
  v2(70,2)=681;
  v2(70,3)=(-1)/(y(18)*y(18));
  v2(71,1)=18;
  v2(71,2)=161;
  v2(71,3)=(-(params(11)*(-1)/(y(5)*y(5))));
  v2(72,1)=18;
  v2(72,2)=721;
  v2(72,3)=(-1)/(y(19)*y(19));
  v2(73,1)=26;
  v2(73,2)=521;
  v2(73,3)=(-((-((-y(15))*(y(14)+y(14))))/(y(14)*y(14)*y(14)*y(14))));
  v2(74,1)=26;
  v2(74,2)=560;
  v2(74,3)=T473;
  v2(75,1)=26;
  v2(75,2)=522;
  v2(75,3)=  v2(74,3);
  v2(76,1)=27;
  v2(76,2)=521;
  v2(76,3)=(-((-((-y(16))*(y(14)+y(14))))/(y(14)*y(14)*y(14)*y(14))));
  v2(77,1)=27;
  v2(77,2)=599;
  v2(77,3)=T473;
  v2(78,1)=27;
  v2(78,2)=523;
  v2(78,3)=  v2(77,3);
  v2(79,1)=28;
  v2(79,2)=518;
  v2(79,3)=T473;
  v2(80,1)=28;
  v2(80,2)=404;
  v2(80,3)=  v2(79,3);
  v2(81,1)=28;
  v2(81,2)=521;
  v2(81,3)=(-((-((-y(11))*(y(14)+y(14))))/(y(14)*y(14)*y(14)*y(14))));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),28,1521);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],28,59319);
end
end
end
end
