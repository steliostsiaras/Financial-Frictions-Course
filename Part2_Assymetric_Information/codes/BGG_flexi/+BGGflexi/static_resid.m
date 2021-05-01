function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = BGGflexi.static_resid_tt(T, y, x, params);
end
residual = zeros(54, 1);
lhs = y(2);
rhs = T(1)-T(1)*params(3)*params(2);
residual(1) = lhs - rhs;
lhs = y(3);
rhs = params(2);
residual(2) = lhs - rhs;
lhs = y(3)*y(5);
rhs = 1;
residual(3) = lhs - rhs;
lhs = y(2)*(1-params(1))*y(6);
rhs = y(4)*params(4)*T(2);
residual(4) = lhs - rhs;
lhs = y(6);
rhs = T(4)*T(5);
residual(5) = lhs - rhs;
lhs = y(8);
rhs = (1-params(1))*y(6)/y(4);
residual(6) = lhs - rhs;
lhs = y(10);
rhs = params(1)*y(6)/(y(22)*y(7));
residual(7) = lhs - rhs;
lhs = y(7);
rhs = (1-y(33))*y(20)+y(7)*(1-params(6));
residual(8) = lhs - rhs;
lhs = y(32);
rhs = 1;
residual(9) = lhs - rhs;
lhs = y(33);
rhs = params(8)*(y(32)-1)^2;
residual(10) = lhs - rhs;
lhs = y(34);
rhs = (y(32)-1)*2*params(8);
residual(11) = lhs - rhs;
lhs = y(21)*(1-y(33)-y(32)*y(34))+y(34)*y(3)*y(21)*T(6);
rhs = 1;
residual(12) = lhs - rhs;
lhs = y(35);
rhs = T(8);
residual(13) = lhs - rhs;
lhs = y(36);
rhs = 1-normcdf(T(9),0,1);
residual(14) = lhs - rhs;
lhs = y(37);
rhs = y(36)+y(19)*(1-y(35));
residual(15) = lhs - rhs;
lhs = y(38);
rhs = 1-y(35);
residual(16) = lhs - rhs;
lhs = y(39);
rhs = 1/(y(19)*y(27)*2.506628274631)*T(11);
residual(17) = lhs - rhs;
lhs = y(11);
rhs = y(22)*(y(10)+(1-params(6))*y(21))/y(21);
residual(18) = lhs - rhs;
lhs = y(7)*y(21);
rhs = y(15)+y(13);
residual(19) = lhs - rhs;
lhs = y(13);
rhs = y(7)*y(21)*y(11)*(y(26)+params(7))*(1-y(37));
residual(20) = lhs - rhs;
lhs = y(16);
rhs = y(7)*y(21)*y(11)*(1-y(37))*(1-params(7))*(1-y(26));
residual(21) = lhs - rhs;
lhs = y(13)*y(14);
rhs = y(7)*y(21);
residual(22) = lhs - rhs;
lhs = y(11)*y(14)*(y(37)-y(36)*y(29));
rhs = y(5)*(y(14)-1);
residual(23) = lhs - rhs;
lhs = y(19);
rhs = y(12)*(y(7)*y(21)-y(13))/(y(7)*y(21)*y(11));
residual(24) = lhs - rhs;
lhs = y(17);
rhs = y(38)/(y(38)*(y(37)-y(36)*y(29))+(1-y(37))*(y(38)-y(39)*y(29)));
residual(25) = lhs - rhs;
lhs = y(18);
rhs = y(5)*y(17);
residual(26) = lhs - rhs;
lhs = y(11);
rhs = y(18);
residual(27) = lhs - rhs;
lhs = y(6);
rhs = y(20)+y(1)+y(16)+y(23)+y(7)*y(21)*y(11)*y(36)*y(29);
residual(28) = lhs - rhs;
lhs = y(23);
rhs = y(24);
residual(29) = lhs - rhs;
lhs = y(23);
rhs = params(9)*(y(6));
residual(30) = lhs - rhs;
lhs = y(25);
rhs = y(11)-y(5);
residual(31) = lhs - rhs;
lhs = log(y(9));
rhs = log(y(9))*0.75+x(1);
residual(32) = lhs - rhs;
lhs = log(y(31));
rhs = log(y(31))*params(11)+x(2);
residual(33) = lhs - rhs;
lhs = log(y(27)/y(28));
rhs = log(y(27)/y(28))*params(10)+x(4)*0.07;
residual(34) = lhs - rhs;
lhs = log(y(22));
rhs = params(11)*log(y(22))-x(3);
residual(35) = lhs - rhs;
lhs = y(30);
rhs = y(35);
residual(36) = lhs - rhs;
lhs = y(40);
rhs = y(6)/(y(6));
residual(37) = lhs - rhs;
lhs = y(49);
rhs = y(7)/(y(7));
residual(38) = lhs - rhs;
lhs = y(42);
rhs = y(20)/(y(20));
residual(39) = lhs - rhs;
lhs = y(41);
rhs = y(1)/(y(1));
residual(40) = lhs - rhs;
lhs = y(43);
rhs = y(8)/(y(8));
residual(41) = lhs - rhs;
lhs = y(51);
rhs = y(4)/(y(4));
residual(42) = lhs - rhs;
lhs = y(45);
rhs = y(21)/(y(21));
residual(43) = lhs - rhs;
lhs = y(44);
rhs = y(5)/(y(5));
residual(44) = lhs - rhs;
lhs = y(46);
rhs = y(11)/(y(11));
residual(45) = lhs - rhs;
lhs = y(48);
rhs = y(46)-y(44);
residual(46) = lhs - rhs;
lhs = y(47);
rhs = y(13)/(y(13));
residual(47) = lhs - rhs;
lhs = y(50);
rhs = y(17)/(y(17));
residual(48) = lhs - rhs;
lhs = y(53);
rhs = y(22)/(y(22));
residual(49) = lhs - rhs;
lhs = y(52);
rhs = y(14)/(y(14));
residual(50) = lhs - rhs;
lhs = y(54);
rhs = y(15)/(y(15));
residual(51) = lhs - rhs;
lhs = y(26);
rhs = (y(26));
residual(52) = lhs - rhs;
lhs = y(28);
rhs = (y(27));
residual(53) = lhs - rhs;
lhs = y(29);
rhs = (y(29));
residual(54) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
