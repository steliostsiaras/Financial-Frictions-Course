function [residual, g1, g2, g3] = BGGflexi_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(46, 1);
TEF_0 = logncdf(y(30),(-0.5)*y(38)^2,y(38));
p__ = TEF_0;
fnG__ = 1-normcdf((0.5*y(38)^2-log(y(30)))/y(38),0,1);
fnGam__ = fnG__+y(30)*(1-p__);
DGam__ = 1-p__;
DG__ = 1/(y(30)*y(38)*2.506628274631)*exp((-((log(y(30))+y(38)^2*.5)^2))/(2*y(38)^2));
T68 = (y(12)*(1-params(3)))^(-1);
T92 = y(15)^params(5);
T99 = (y(33)*y(3))^params(1);
T100 = y(21)*T99;
T101 = y(15)^(1-params(1));
T128 = 1+params(8)/2*(y(31)/y(7)-1)^2;
T137 = y(58)*params(8)*(y(61)/y(31)-1);
T138 = (y(61)/y(31))^2;
T177 = y(22)/y(2);
lhs =y(13);
rhs =T68-T68*params(3)*params(2);
residual(1)= lhs-rhs;
lhs =y(14);
rhs =y(13)*params(2)/y(1);
residual(2)= lhs-rhs;
lhs =y(58)*y(16);
rhs =1;
residual(3)= lhs-rhs;
lhs =y(13)*(1-params(1))*y(17);
rhs =y(15)*params(4)*T92;
residual(4)= lhs-rhs;
lhs =y(17);
rhs =T100*T101;
residual(5)= lhs-rhs;
lhs =y(19);
rhs =(1-params(1))*y(17)/y(15);
residual(6)= lhs-rhs;
lhs =y(20);
rhs =params(1)*y(17)/(y(33)*y(3));
residual(7)= lhs-rhs;
lhs =y(18);
rhs =y(33)*(y(31)+y(3)*(1-params(6)));
residual(8)= lhs-rhs;
lhs =y(32);
rhs =T128+y(31)*params(8)*(y(31)/y(7)-1)/y(7)-T137*T138;
residual(9)= lhs-rhs;
lhs =y(22);
rhs =y(33)*(y(20)+(1-params(6))*y(32))/y(8);
residual(10)= lhs-rhs;
lhs =y(18)*y(32);
rhs =y(26)+y(24);
residual(11)= lhs-rhs;
lhs =y(24);
rhs =y(3)*y(8)*y(22)*(y(37)+params(7))*(1-fnGam__);
residual(12)= lhs-rhs;
lhs =y(27);
rhs =y(3)*y(8)*y(22)*(1-fnGam__)*(1-params(7))*(1-y(37));
residual(13)= lhs-rhs;
lhs =y(24)*y(25);
rhs =y(18)*y(32);
residual(14)= lhs-rhs;
residual(15) = y(3)*(1-T177*(fnGam__-fnG__*y(40)))-y(5);
lhs =y(30);
rhs =y(23)*y(6)/(y(3)*y(22)*y(8));
residual(16)= lhs-rhs;
lhs =y(28);
rhs =DGam__/((fnGam__-fnG__*y(40))*DGam__+(1-fnGam__)*(DGam__-y(40)*DG__));
residual(17)= lhs-rhs;
lhs =y(29);
rhs =y(16)*y(28);
residual(18)= lhs-rhs;
lhs =y(59);
rhs =y(60);
residual(19)= lhs-rhs;
lhs =y(17);
rhs =y(12)+y(27)+y(34)+y(31)*T128+y(3)*y(8)*y(22)*fnG__*y(40);
residual(20)= lhs-rhs;
lhs =y(34);
rhs =y(35);
residual(21)= lhs-rhs;
lhs =y(34);
rhs =params(10)*(steady_state(6));
residual(22)= lhs-rhs;
lhs =y(36);
rhs =y(59)-y(16);
residual(23)= lhs-rhs;
lhs =log(y(21));
rhs =0.75*log(y(4))+x(it_, 1);
residual(24)= lhs-rhs;
lhs =log(y(42));
rhs =params(18)*log(y(11))+x(it_, 2);
residual(25)= lhs-rhs;
lhs =log(y(38)/y(39));
rhs =params(17)*log(y(10)/y(39))+x(it_, 4)*0.07;
residual(26)= lhs-rhs;
lhs =log(y(33));
rhs =params(18)*log(y(9))+x(it_, 3);
residual(27)= lhs-rhs;
lhs =y(41);
rhs =p__;
residual(28)= lhs-rhs;
lhs =y(43);
rhs =y(17)/(steady_state(6));
residual(29)= lhs-rhs;
lhs =y(52);
rhs =y(18)/(steady_state(7));
residual(30)= lhs-rhs;
lhs =y(45);
rhs =y(31)/(steady_state(20));
residual(31)= lhs-rhs;
lhs =y(44);
rhs =y(12)/(steady_state(1));
residual(32)= lhs-rhs;
lhs =y(46);
rhs =y(19)/(steady_state(8));
residual(33)= lhs-rhs;
lhs =y(54);
rhs =y(15)/(steady_state(4));
residual(34)= lhs-rhs;
lhs =y(48);
rhs =y(32)/(steady_state(21));
residual(35)= lhs-rhs;
lhs =y(47);
rhs =y(16)/(steady_state(5));
residual(36)= lhs-rhs;
lhs =y(49);
rhs =y(22)/(steady_state(11));
residual(37)= lhs-rhs;
lhs =y(51);
rhs =y(63)-y(62);
residual(38)= lhs-rhs;
lhs =y(50);
rhs =y(24)/(steady_state(13));
residual(39)= lhs-rhs;
lhs =y(53);
rhs =y(28)/(steady_state(17));
residual(40)= lhs-rhs;
lhs =y(56);
rhs =y(33)/(steady_state(22));
residual(41)= lhs-rhs;
lhs =y(55);
rhs =y(25)/(steady_state(14));
residual(42)= lhs-rhs;
lhs =y(57);
rhs =y(26)/(steady_state(15));
residual(43)= lhs-rhs;
lhs =y(37);
rhs =(steady_state(26));
residual(44)= lhs-rhs;
lhs =y(39);
rhs =(steady_state(27));
residual(45)= lhs-rhs;
lhs =y(40);
rhs =(steady_state(29));
residual(46)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(46, 67);

  %
  % Jacobian matrix
  %

T12 = y(38)^2;
T19 = 0.5*T12-log(y(30));
T20 = T19/y(38);
T49 = (-((log(y(30))+T12*.5)^2));
T52 = exp(T49/(2*T12));
T335 = (1-params(3))*getPowerDeriv(y(12)*(1-params(3)),(-1),1);
T379 = getPowerDeriv(y(33)*y(3),params(1),1);
T452 = exp((-(T20*T20))/2)/2.506628274631;
T454 = (-((-(1/y(30)))/y(38)*T452));
TEFD_fdd_0_1 = jacob_element('logncdf',1,{y(30),(-0.5)*T12,y(38)});
T455 = TEFD_fdd_0_1;
TEFD_fdd_0_2 = jacob_element('logncdf',2,{y(30),(-0.5)*T12,y(38)});
T456 = TEFD_fdd_0_2;
TEFD_fdd_0_3 = jacob_element('logncdf',3,{y(30),(-0.5)*T12,y(38)});
T457 = TEFD_fdd_0_3;
T461 = T454+1-p__+y(30)*(-T455);
T462 = (-T461);
T502 = ((fnGam__-fnG__*y(40))*DGam__+(1-fnGam__)*(DGam__-y(40)*DG__))*((fnGam__-fnG__*y(40))*DGam__+(1-fnGam__)*(DGam__-y(40)*DG__));
T514 = params(8)/2*(-y(31))/(y(7)*y(7))*2*(y(31)/y(7)-1);
T527 = params(8)/2*2*(y(31)/y(7)-1)*1/y(7);
T620 = (-(T452*(y(38)*0.5*2*y(38)-T19)/(y(38)*y(38))))+y(30)*(-(T457+T456*(-0.5)*2*y(38)));
T621 = (-T620);
  g1(1,12)=(-(T335-params(3)*params(2)*T335));
  g1(1,13)=1;
  g1(2,1)=(-((-(y(13)*params(2)))/(y(1)*y(1))));
  g1(2,13)=(-(params(2)/y(1)));
  g1(2,14)=1;
  g1(3,58)=y(16);
  g1(3,16)=y(58);
  g1(4,13)=(1-params(1))*y(17);
  g1(4,15)=(-(params(4)*T92+y(15)*params(4)*getPowerDeriv(y(15),params(5),1)));
  g1(4,17)=y(13)*(1-params(1));
  g1(5,15)=(-(T100*getPowerDeriv(y(15),1-params(1),1)));
  g1(5,17)=1;
  g1(5,3)=(-(T101*y(21)*y(33)*T379));
  g1(5,21)=(-(T99*T101));
  g1(5,33)=(-(T101*y(21)*y(3)*T379));
  g1(6,15)=(-((-((1-params(1))*y(17)))/(y(15)*y(15))));
  g1(6,17)=(-((1-params(1))/y(15)));
  g1(6,19)=1;
  g1(7,17)=(-(params(1)/(y(33)*y(3))));
  g1(7,3)=(-((-(y(33)*params(1)*y(17)))/(y(33)*y(3)*y(33)*y(3))));
  g1(7,20)=1;
  g1(7,33)=(-((-(y(3)*params(1)*y(17)))/(y(33)*y(3)*y(33)*y(3))));
  g1(8,3)=(-(y(33)*(1-params(6))));
  g1(8,18)=1;
  g1(8,31)=(-y(33));
  g1(8,33)=(-(y(31)+y(3)*(1-params(6))));
  g1(9,58)=T138*params(8)*(y(61)/y(31)-1);
  g1(9,7)=(-(T514+(y(7)*y(31)*params(8)*(-y(31))/(y(7)*y(7))-y(31)*params(8)*(y(31)/y(7)-1))/(y(7)*y(7))));
  g1(9,31)=(-(T527+(params(8)*(y(31)/y(7)-1)+y(31)*params(8)*1/y(7))/y(7)-(T138*y(58)*params(8)*(-y(61))/(y(31)*y(31))+T137*(-y(61))/(y(31)*y(31))*2*y(61)/y(31))));
  g1(9,61)=T138*y(58)*params(8)*1/y(31)+T137*2*y(61)/y(31)*1/y(31);
  g1(9,32)=1;
  g1(10,20)=(-(y(33)/y(8)));
  g1(10,22)=1;
  g1(10,8)=(-((-(y(33)*(y(20)+(1-params(6))*y(32))))/(y(8)*y(8))));
  g1(10,32)=(-(y(33)*(1-params(6))/y(8)));
  g1(10,33)=(-((y(20)+(1-params(6))*y(32))/y(8)));
  g1(11,18)=y(32);
  g1(11,24)=(-1);
  g1(11,26)=(-1);
  g1(11,32)=y(18);
  g1(12,3)=(-(y(8)*y(22)*(y(37)+params(7))*(1-fnGam__)));
  g1(12,22)=(-(y(3)*y(8)*(y(37)+params(7))*(1-fnGam__)));
  g1(12,24)=1;
  g1(12,30)=(-(y(3)*y(8)*y(22)*(y(37)+params(7))*T462));
  g1(12,8)=(-(y(3)*y(22)*(y(37)+params(7))*(1-fnGam__)));
  g1(12,37)=(-(y(3)*y(8)*y(22)*(1-fnGam__)));
  g1(12,38)=(-(y(3)*y(8)*y(22)*(y(37)+params(7))*T621));
  g1(13,3)=(-(y(8)*y(22)*(1-fnGam__)*(1-params(7))*(1-y(37))));
  g1(13,22)=(-(y(3)*y(8)*(1-fnGam__)*(1-params(7))*(1-y(37))));
  g1(13,27)=1;
  g1(13,30)=(-(y(3)*y(8)*y(22)*(1-params(7))*(1-y(37))*T462));
  g1(13,8)=(-(y(3)*y(22)*(1-fnGam__)*(1-params(7))*(1-y(37))));
  g1(13,37)=(-(y(3)*y(8)*y(22)*(1-fnGam__)*(-(1-params(7)))));
  g1(13,38)=(-(y(3)*y(8)*y(22)*(1-params(7))*(1-y(37))*T621));
  g1(14,18)=(-y(32));
  g1(14,24)=y(25);
  g1(14,25)=y(24);
  g1(14,32)=(-y(18));
  g1(15,2)=y(3)*(-((fnGam__-fnG__*y(40))*(-y(22))/(y(2)*y(2))));
  g1(15,3)=1-T177*(fnGam__-fnG__*y(40));
  g1(15,22)=y(3)*(-((fnGam__-fnG__*y(40))*1/y(2)));
  g1(15,5)=(-1);
  g1(15,30)=y(3)*(-(T177*(T461-y(40)*T454)));
  g1(15,38)=y(3)*(-(T177*(T620-y(40)*(-(T452*(y(38)*0.5*2*y(38)-T19)/(y(38)*y(38)))))));
  g1(15,40)=y(3)*(-(T177*(-fnG__)));
  g1(16,3)=(-((-(y(23)*y(6)*y(22)*y(8)))/(y(3)*y(22)*y(8)*y(3)*y(22)*y(8))));
  g1(16,22)=(-((-(y(23)*y(6)*y(3)*y(8)))/(y(3)*y(22)*y(8)*y(3)*y(22)*y(8))));
  g1(16,23)=(-(y(6)/(y(3)*y(22)*y(8))));
  g1(16,6)=(-(y(23)/(y(3)*y(22)*y(8))));
  g1(16,30)=1;
  g1(16,8)=(-((-(y(23)*y(6)*y(3)*y(22)))/(y(3)*y(22)*y(8)*y(3)*y(22)*y(8))));
  g1(17,28)=1;
  g1(17,30)=(-((((fnGam__-fnG__*y(40))*DGam__+(1-fnGam__)*(DGam__-y(40)*DG__))*(-T455)-DGam__*(DGam__*(T461-y(40)*T454)+(fnGam__-fnG__*y(40))*(-T455)+(DGam__-y(40)*DG__)*T462+(1-fnGam__)*((-T455)-y(40)*(T52*(-(y(38)*2.506628274631))/(y(30)*y(38)*2.506628274631*y(30)*y(38)*2.506628274631)+1/(y(30)*y(38)*2.506628274631)*T52*(-(1/y(30)*2*(log(y(30))+T12*.5)))/(2*T12)))))/T502));
  g1(17,38)=(-((((fnGam__-fnG__*y(40))*DGam__+(1-fnGam__)*(DGam__-y(40)*DG__))*(-(T457+T456*(-0.5)*2*y(38)))-DGam__*(DGam__*(T620-y(40)*(-(T452*(y(38)*0.5*2*y(38)-T19)/(y(38)*y(38)))))+(fnGam__-fnG__*y(40))*(-(T457+T456*(-0.5)*2*y(38)))+(DGam__-y(40)*DG__)*T621+(1-fnGam__)*((-(T457+T456*(-0.5)*2*y(38)))-y(40)*(T52*(-(y(30)*2.506628274631))/(y(30)*y(38)*2.506628274631*y(30)*y(38)*2.506628274631)+1/(y(30)*y(38)*2.506628274631)*T52*(2*T12*(-(2*(log(y(30))+T12*.5)*.5*2*y(38)))-T49*2*2*y(38))/(2*T12*2*T12)))))/T502));
  g1(17,40)=(-((-(DGam__*(DGam__*(-fnG__)+(1-fnGam__)*(-DG__))))/T502));
  g1(18,16)=(-y(28));
  g1(18,28)=(-y(16));
  g1(18,29)=1;
  g1(19,59)=1;
  g1(19,60)=(-1);
  g1(20,12)=(-1);
  g1(20,17)=1;
  g1(20,3)=(-(y(8)*y(22)*fnG__*y(40)));
  g1(20,22)=(-(y(3)*y(8)*fnG__*y(40)));
  g1(20,27)=(-1);
  g1(20,30)=(-(y(3)*y(8)*y(22)*y(40)*T454));
  g1(20,7)=(-(y(31)*T514));
  g1(20,31)=(-(T128+y(31)*T527));
  g1(20,8)=(-(y(3)*y(22)*fnG__*y(40)));
  g1(20,34)=(-1);
  g1(20,38)=(-(y(3)*y(8)*y(22)*y(40)*(-(T452*(y(38)*0.5*2*y(38)-T19)/(y(38)*y(38))))));
  g1(20,40)=(-(y(3)*y(8)*fnG__*y(22)));
  g1(21,34)=1;
  g1(21,35)=(-1);
  g1(22,34)=1;
  g1(23,16)=1;
  g1(23,59)=(-1);
  g1(23,36)=1;
  g1(24,4)=(-(0.75*1/y(4)));
  g1(24,21)=1/y(21);
  g1(24,64)=(-1);
  g1(25,11)=(-(params(18)*1/y(11)));
  g1(25,42)=1/y(42);
  g1(25,65)=(-1);
  g1(26,10)=(-(params(17)*1/y(39)/(y(10)/y(39))));
  g1(26,38)=1/y(39)/(y(38)/y(39));
  g1(26,39)=(-y(38))/(y(39)*y(39))/(y(38)/y(39))-params(17)*(-y(10))/(y(39)*y(39))/(y(10)/y(39));
  g1(26,67)=(-0.07);
  g1(27,9)=(-(params(18)*1/y(9)));
  g1(27,33)=1/y(33);
  g1(27,66)=(-1);
  g1(28,30)=(-T455);
  g1(28,38)=(-(T457+T456*(-0.5)*2*y(38)));
  g1(28,41)=1;
  g1(29,17)=(-(1/(steady_state(6))));
  g1(29,43)=1;
  g1(30,18)=(-(1/(steady_state(7))));
  g1(30,52)=1;
  g1(31,31)=(-(1/(steady_state(20))));
  g1(31,45)=1;
  g1(32,12)=(-(1/(steady_state(1))));
  g1(32,44)=1;
  g1(33,19)=(-(1/(steady_state(8))));
  g1(33,46)=1;
  g1(34,15)=(-(1/(steady_state(4))));
  g1(34,54)=1;
  g1(35,32)=(-(1/(steady_state(21))));
  g1(35,48)=1;
  g1(36,16)=(-(1/(steady_state(5))));
  g1(36,47)=1;
  g1(37,22)=(-(1/(steady_state(11))));
  g1(37,49)=1;
  g1(38,62)=1;
  g1(38,63)=(-1);
  g1(38,51)=1;
  g1(39,24)=(-(1/(steady_state(13))));
  g1(39,50)=1;
  g1(40,28)=(-(1/(steady_state(17))));
  g1(40,53)=1;
  g1(41,33)=(-(1/(steady_state(22))));
  g1(41,56)=1;
  g1(42,25)=(-(1/(steady_state(14))));
  g1(42,55)=1;
  g1(43,26)=(-(1/(steady_state(15))));
  g1(43,57)=1;
  g1(44,37)=1;
  g1(45,39)=1;
  g1(46,40)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],46,4489);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],46,300763);
end
end
end
end
