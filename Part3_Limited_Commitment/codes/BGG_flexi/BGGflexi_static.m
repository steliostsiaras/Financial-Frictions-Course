function [residual, g1, g2, g3] = BGGflexi_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 46, 1);

%
% Model equations
%

TEF_0 = logncdf(y(19),(-0.5)*y(27)^2,y(27));
p__ = TEF_0;
fnG__ = 1-normcdf((0.5*y(27)^2-log(y(19)))/y(27),0,1);
fnGam__ = fnG__+y(19)*(1-p__);
DGam__ = 1-p__;
DG__ = 1/(y(19)*y(27)*2.506628274631)*exp((-((log(y(19))+y(27)^2*.5)^2))/(2*y(27)^2));
T49 = (y(1)*(1-params(3)))^(-1);
T71 = y(4)^params(5);
T78 = (y(22)*y(7))^params(1);
T79 = y(10)*T78;
T80 = y(4)^(1-params(1));
T136 = y(11)/y(5);
lhs =y(2);
rhs =T49-T49*params(3)*params(2);
residual(1)= lhs-rhs;
lhs =y(3);
rhs =y(2)*params(2)/y(2);
residual(2)= lhs-rhs;
lhs =y(3)*y(5);
rhs =1;
residual(3)= lhs-rhs;
lhs =y(2)*(1-params(1))*y(6);
rhs =y(4)*params(4)*T71;
residual(4)= lhs-rhs;
lhs =y(6);
rhs =T79*T80;
residual(5)= lhs-rhs;
lhs =y(8);
rhs =(1-params(1))*y(6)/y(4);
residual(6)= lhs-rhs;
lhs =y(9);
rhs =params(1)*y(6)/(y(22)*y(7));
residual(7)= lhs-rhs;
lhs =y(7);
rhs =y(22)*(y(20)+y(7)*(1-params(6)));
residual(8)= lhs-rhs;
lhs =y(21);
rhs =1;
residual(9)= lhs-rhs;
lhs =y(11);
rhs =y(22)*(y(9)+(1-params(6))*y(21))/y(21);
residual(10)= lhs-rhs;
lhs =y(7)*y(21);
rhs =y(15)+y(13);
residual(11)= lhs-rhs;
lhs =y(13);
rhs =y(7)*y(21)*y(11)*(y(26)+params(7))*(1-fnGam__);
residual(12)= lhs-rhs;
lhs =y(16);
rhs =y(7)*y(21)*y(11)*(1-fnGam__)*(1-params(7))*(1-y(26));
residual(13)= lhs-rhs;
lhs =y(13)*y(14);
rhs =y(7)*y(21);
residual(14)= lhs-rhs;
residual(15) = y(7)*(1-T136*(fnGam__-fnG__*y(29)))-y(13);
lhs =y(19);
rhs =y(15)*y(12)/(y(7)*y(21)*y(11));
residual(16)= lhs-rhs;
lhs =y(17);
rhs =DGam__/((fnGam__-fnG__*y(29))*DGam__+(1-fnGam__)*(DGam__-y(29)*DG__));
residual(17)= lhs-rhs;
lhs =y(18);
rhs =y(5)*y(17);
residual(18)= lhs-rhs;
lhs =y(11);
rhs =y(18);
residual(19)= lhs-rhs;
lhs =y(6);
rhs =y(20)+y(1)+y(16)+y(23)+y(7)*y(21)*y(11)*fnG__*y(29);
residual(20)= lhs-rhs;
lhs =y(23);
rhs =y(24);
residual(21)= lhs-rhs;
lhs =y(23);
rhs =params(10)*(y(6));
residual(22)= lhs-rhs;
lhs =y(25);
rhs =y(11)-y(5);
residual(23)= lhs-rhs;
lhs =log(y(10));
rhs =log(y(10))*0.75+x(1);
residual(24)= lhs-rhs;
lhs =log(y(31));
rhs =log(y(31))*params(18)+x(2);
residual(25)= lhs-rhs;
lhs =log(y(27)/y(28));
rhs =log(y(27)/y(28))*params(17)+x(4)*0.07;
residual(26)= lhs-rhs;
lhs =log(y(22));
rhs =params(18)*log(y(22))+x(3);
residual(27)= lhs-rhs;
lhs =y(30);
rhs =p__;
residual(28)= lhs-rhs;
lhs =y(32);
rhs =y(6)/(y(6));
residual(29)= lhs-rhs;
lhs =y(41);
rhs =y(7)/(y(7));
residual(30)= lhs-rhs;
lhs =y(34);
rhs =y(20)/(y(20));
residual(31)= lhs-rhs;
lhs =y(33);
rhs =y(1)/(y(1));
residual(32)= lhs-rhs;
lhs =y(35);
rhs =y(8)/(y(8));
residual(33)= lhs-rhs;
lhs =y(43);
rhs =y(4)/(y(4));
residual(34)= lhs-rhs;
lhs =y(37);
rhs =y(21)/(y(21));
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(5)/(y(5));
residual(36)= lhs-rhs;
lhs =y(38);
rhs =y(11)/(y(11));
residual(37)= lhs-rhs;
lhs =y(40);
rhs =y(38)-y(36);
residual(38)= lhs-rhs;
lhs =y(39);
rhs =y(13)/(y(13));
residual(39)= lhs-rhs;
lhs =y(42);
rhs =y(17)/(y(17));
residual(40)= lhs-rhs;
lhs =y(45);
rhs =y(22)/(y(22));
residual(41)= lhs-rhs;
lhs =y(44);
rhs =y(14)/(y(14));
residual(42)= lhs-rhs;
lhs =y(46);
rhs =y(15)/(y(15));
residual(43)= lhs-rhs;
lhs =y(26);
rhs =(y(26));
residual(44)= lhs-rhs;
lhs =y(28);
rhs =(y(27));
residual(45)= lhs-rhs;
lhs =y(29);
rhs =(y(29));
residual(46)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(46, 46);

  %
  % Jacobian matrix
  %

T12 = y(27)^2;
T17 = 0.5*T12-log(y(19));
T18 = T17/y(27);
T39 = (-((log(y(19))+T12*.5)^2));
T42 = exp(T39/(2*T12));
T278 = (1-params(3))*getPowerDeriv(y(1)*(1-params(3)),(-1),1);
T323 = getPowerDeriv(y(22)*y(7),params(1),1);
T409 = exp((-(T18*T18))/2)/2.506628274631;
T411 = (-((-(1/y(19)))/y(27)*T409));
TEFD_fdd_0_1 = jacob_element('logncdf',1,{y(19),(-0.5)*T12,y(27)});
T412 = TEFD_fdd_0_1;
TEFD_fdd_0_2 = jacob_element('logncdf',2,{y(19),(-0.5)*T12,y(27)});
T413 = TEFD_fdd_0_2;
TEFD_fdd_0_3 = jacob_element('logncdf',3,{y(19),(-0.5)*T12,y(27)});
T414 = TEFD_fdd_0_3;
T418 = T411+1-p__+y(19)*(-T412);
T419 = (-T418);
T459 = ((fnGam__-fnG__*y(29))*DGam__+(1-fnGam__)*(DGam__-y(29)*DG__))*((fnGam__-fnG__*y(29))*DGam__+(1-fnGam__)*(DGam__-y(29)*DG__));
T533 = (-(T409*(y(27)*0.5*2*y(27)-T17)/(y(27)*y(27))))+y(19)*(-(T414+T413*(-0.5)*2*y(27)));
T534 = (-T533);
T585 = 1/y(28)/(y(27)/y(28));
T591 = (-y(27))/(y(28)*y(28))/(y(27)/y(28));
  g1(1,1)=(-(T278-params(3)*params(2)*T278));
  g1(1,2)=1;
  g1(2,3)=1;
  g1(3,3)=y(5);
  g1(3,5)=y(3);
  g1(4,2)=(1-params(1))*y(6);
  g1(4,4)=(-(params(4)*T71+y(4)*params(4)*getPowerDeriv(y(4),params(5),1)));
  g1(4,6)=y(2)*(1-params(1));
  g1(5,4)=(-(T79*getPowerDeriv(y(4),1-params(1),1)));
  g1(5,6)=1;
  g1(5,7)=(-(T80*y(10)*y(22)*T323));
  g1(5,10)=(-(T78*T80));
  g1(5,22)=(-(T80*y(10)*y(7)*T323));
  g1(6,4)=(-((-((1-params(1))*y(6)))/(y(4)*y(4))));
  g1(6,6)=(-((1-params(1))/y(4)));
  g1(6,8)=1;
  g1(7,6)=(-(params(1)/(y(22)*y(7))));
  g1(7,7)=(-((-(y(22)*params(1)*y(6)))/(y(22)*y(7)*y(22)*y(7))));
  g1(7,9)=1;
  g1(7,22)=(-((-(y(7)*params(1)*y(6)))/(y(22)*y(7)*y(22)*y(7))));
  g1(8,7)=1-y(22)*(1-params(6));
  g1(8,20)=(-y(22));
  g1(8,22)=(-(y(20)+y(7)*(1-params(6))));
  g1(9,21)=1;
  g1(10,9)=(-(y(22)/y(21)));
  g1(10,11)=1;
  g1(10,21)=(-((y(21)*y(22)*(1-params(6))-y(22)*(y(9)+(1-params(6))*y(21)))/(y(21)*y(21))));
  g1(10,22)=(-((y(9)+(1-params(6))*y(21))/y(21)));
  g1(11,7)=y(21);
  g1(11,13)=(-1);
  g1(11,15)=(-1);
  g1(11,21)=y(7);
  g1(12,7)=(-(y(21)*y(11)*(y(26)+params(7))*(1-fnGam__)));
  g1(12,11)=(-(y(7)*y(21)*(y(26)+params(7))*(1-fnGam__)));
  g1(12,13)=1;
  g1(12,19)=(-(y(7)*y(21)*y(11)*(y(26)+params(7))*T419));
  g1(12,21)=(-(y(7)*y(11)*(y(26)+params(7))*(1-fnGam__)));
  g1(12,26)=(-(y(7)*y(21)*y(11)*(1-fnGam__)));
  g1(12,27)=(-(y(7)*y(21)*y(11)*(y(26)+params(7))*T534));
  g1(13,7)=(-(y(21)*y(11)*(1-fnGam__)*(1-params(7))*(1-y(26))));
  g1(13,11)=(-(y(7)*y(21)*(1-fnGam__)*(1-params(7))*(1-y(26))));
  g1(13,16)=1;
  g1(13,19)=(-(y(7)*y(21)*y(11)*(1-params(7))*(1-y(26))*T419));
  g1(13,21)=(-(y(7)*y(11)*(1-fnGam__)*(1-params(7))*(1-y(26))));
  g1(13,26)=(-(y(7)*y(21)*y(11)*(1-fnGam__)*(-(1-params(7)))));
  g1(13,27)=(-(y(7)*y(21)*y(11)*(1-params(7))*(1-y(26))*T534));
  g1(14,7)=(-y(21));
  g1(14,13)=y(14);
  g1(14,14)=y(13);
  g1(14,21)=(-y(7));
  g1(15,5)=y(7)*(-((fnGam__-fnG__*y(29))*(-y(11))/(y(5)*y(5))));
  g1(15,7)=1-T136*(fnGam__-fnG__*y(29));
  g1(15,11)=y(7)*(-((fnGam__-fnG__*y(29))*1/y(5)));
  g1(15,13)=(-1);
  g1(15,19)=y(7)*(-(T136*(T418-y(29)*T411)));
  g1(15,27)=y(7)*(-(T136*(T533-y(29)*(-(T409*(y(27)*0.5*2*y(27)-T17)/(y(27)*y(27)))))));
  g1(15,29)=y(7)*(-(T136*(-fnG__)));
  g1(16,7)=(-((-(y(15)*y(12)*y(21)*y(11)))/(y(7)*y(21)*y(11)*y(7)*y(21)*y(11))));
  g1(16,11)=(-((-(y(7)*y(21)*y(15)*y(12)))/(y(7)*y(21)*y(11)*y(7)*y(21)*y(11))));
  g1(16,12)=(-(y(15)/(y(7)*y(21)*y(11))));
  g1(16,15)=(-(y(12)/(y(7)*y(21)*y(11))));
  g1(16,19)=1;
  g1(16,21)=(-((-(y(15)*y(12)*y(7)*y(11)))/(y(7)*y(21)*y(11)*y(7)*y(21)*y(11))));
  g1(17,17)=1;
  g1(17,19)=(-((((fnGam__-fnG__*y(29))*DGam__+(1-fnGam__)*(DGam__-y(29)*DG__))*(-T412)-DGam__*(DGam__*(T418-y(29)*T411)+(fnGam__-fnG__*y(29))*(-T412)+(DGam__-y(29)*DG__)*T419+(1-fnGam__)*((-T412)-y(29)*(T42*(-(y(27)*2.506628274631))/(y(19)*y(27)*2.506628274631*y(19)*y(27)*2.506628274631)+1/(y(19)*y(27)*2.506628274631)*T42*(-(1/y(19)*2*(log(y(19))+T12*.5)))/(2*T12)))))/T459));
  g1(17,27)=(-((((fnGam__-fnG__*y(29))*DGam__+(1-fnGam__)*(DGam__-y(29)*DG__))*(-(T414+T413*(-0.5)*2*y(27)))-DGam__*(DGam__*(T533-y(29)*(-(T409*(y(27)*0.5*2*y(27)-T17)/(y(27)*y(27)))))+(fnGam__-fnG__*y(29))*(-(T414+T413*(-0.5)*2*y(27)))+(DGam__-y(29)*DG__)*T534+(1-fnGam__)*((-(T414+T413*(-0.5)*2*y(27)))-y(29)*(T42*(-(y(19)*2.506628274631))/(y(19)*y(27)*2.506628274631*y(19)*y(27)*2.506628274631)+1/(y(19)*y(27)*2.506628274631)*T42*(2*T12*(-(2*(log(y(19))+T12*.5)*.5*2*y(27)))-T39*2*2*y(27))/(2*T12*2*T12)))))/T459));
  g1(17,29)=(-((-(DGam__*(DGam__*(-fnG__)+(1-fnGam__)*(-DG__))))/T459));
  g1(18,5)=(-y(17));
  g1(18,17)=(-y(5));
  g1(18,18)=1;
  g1(19,11)=1;
  g1(19,18)=(-1);
  g1(20,1)=(-1);
  g1(20,6)=1;
  g1(20,7)=(-(y(21)*y(11)*fnG__*y(29)));
  g1(20,11)=(-(y(7)*y(21)*fnG__*y(29)));
  g1(20,16)=(-1);
  g1(20,19)=(-(y(7)*y(21)*y(11)*y(29)*T411));
  g1(20,20)=(-1);
  g1(20,21)=(-(y(7)*y(11)*fnG__*y(29)));
  g1(20,23)=(-1);
  g1(20,27)=(-(y(7)*y(21)*y(11)*y(29)*(-(T409*(y(27)*0.5*2*y(27)-T17)/(y(27)*y(27))))));
  g1(20,29)=(-(y(7)*y(21)*fnG__*y(11)));
  g1(21,23)=1;
  g1(21,24)=(-1);
  g1(22,6)=(-params(10));
  g1(22,23)=1;
  g1(23,5)=1;
  g1(23,11)=(-1);
  g1(23,25)=1;
  g1(24,10)=1/y(10)-0.75*1/y(10);
  g1(25,31)=1/y(31)-params(18)*1/y(31);
  g1(26,27)=T585-params(17)*T585;
  g1(26,28)=T591-params(17)*T591;
  g1(27,22)=1/y(22)-params(18)*1/y(22);
  g1(28,19)=(-T412);
  g1(28,27)=(-(T414+T413*(-0.5)*2*y(27)));
  g1(28,30)=1;
  g1(29,6)=(-(((y(6))-y(6))/((y(6))*(y(6)))));
  g1(29,32)=1;
  g1(30,7)=(-(((y(7))-y(7))/((y(7))*(y(7)))));
  g1(30,41)=1;
  g1(31,20)=(-(((y(20))-y(20))/((y(20))*(y(20)))));
  g1(31,34)=1;
  g1(32,1)=(-(((y(1))-y(1))/((y(1))*(y(1)))));
  g1(32,33)=1;
  g1(33,8)=(-(((y(8))-y(8))/((y(8))*(y(8)))));
  g1(33,35)=1;
  g1(34,4)=(-(((y(4))-y(4))/((y(4))*(y(4)))));
  g1(34,43)=1;
  g1(35,21)=(-(((y(21))-y(21))/((y(21))*(y(21)))));
  g1(35,37)=1;
  g1(36,5)=(-(((y(5))-y(5))/((y(5))*(y(5)))));
  g1(36,36)=1;
  g1(37,11)=(-(((y(11))-y(11))/((y(11))*(y(11)))));
  g1(37,38)=1;
  g1(38,36)=1;
  g1(38,38)=(-1);
  g1(38,40)=1;
  g1(39,13)=(-(((y(13))-y(13))/((y(13))*(y(13)))));
  g1(39,39)=1;
  g1(40,17)=(-(((y(17))-y(17))/((y(17))*(y(17)))));
  g1(40,42)=1;
  g1(41,22)=(-(((y(22))-y(22))/((y(22))*(y(22)))));
  g1(41,45)=1;
  g1(42,14)=(-(((y(14))-y(14))/((y(14))*(y(14)))));
  g1(42,44)=1;
  g1(43,15)=(-(((y(15))-y(15))/((y(15))*(y(15)))));
  g1(43,46)=1;
  g1(45,27)=(-1);
  g1(45,28)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],46,2116);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],46,97336);
end
end
end
end
