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
    T = GK_calib.static_resid_tt(T, y, x, params);
end
residual = zeros(50, 1);
lhs = y(2);
rhs = (1-y(25))*y(4)+y(2)*(1-params(6));
residual(1) = lhs - rhs;
lhs = y(24);
rhs = 1;
residual(2) = lhs - rhs;
lhs = y(25);
rhs = params(10)*(y(24)-1)^2;
residual(3) = lhs - rhs;
lhs = y(26);
rhs = (y(24)-1)*2*params(10);
residual(4) = lhs - rhs;
lhs = y(2);
rhs = y(16)*y(31);
residual(5) = lhs - rhs;
lhs = y(12)*(1-y(25)-y(24)*y(26))+y(26)*y(12)*y(17)*T(1);
rhs = 1;
residual(6) = lhs - rhs;
lhs = y(1);
rhs = T(3)*T(4);
residual(7) = lhs - rhs;
lhs = y(11);
rhs = T(5)-T(5)*params(3)*params(2);
residual(8) = lhs - rhs;
lhs = y(17);
rhs = params(2);
residual(9) = lhs - rhs;
lhs = params(2)*y(6);
rhs = 1;
residual(10) = lhs - rhs;
lhs = y(1)*(1-params(1))*y(11);
rhs = y(3)*params(4)*T(6);
residual(11) = lhs - rhs;
lhs = y(8);
rhs = y(1)*(1-params(1))/y(3);
residual(12) = lhs - rhs;
lhs = y(9);
rhs = params(1)*y(1)/y(2);
residual(13) = lhs - rhs;
lhs = y(18);
rhs = 1-params(8)+params(8)*y(28)*y(15);
residual(14) = lhs - rhs;
lhs = y(16)*y(12);
rhs = y(15)*y(10);
residual(15) = lhs - rhs;
lhs = y(16)*y(12);
rhs = y(10)+y(14);
residual(16) = lhs - rhs;
lhs = y(15);
rhs = y(6)*y(17)*y(18)/(y(28)-y(17)*y(18)*y(21));
residual(17) = lhs - rhs;
lhs = y(10);
rhs = y(16)*y(12)*y(7)*(params(8)+params(9))-y(14)*y(6)*params(8);
residual(18) = lhs - rhs;
lhs = y(7);
rhs = y(31)*(y(9)+(1-params(6))*y(12))/y(12);
residual(19) = lhs - rhs;
lhs = y(1);
rhs = y(4)+y(5)+y(20);
residual(20) = lhs - rhs;
lhs = y(20);
rhs = y(19);
residual(21) = lhs - rhs;
lhs = y(20);
rhs = y(30)*params(11)*(y(1));
residual(22) = lhs - rhs;
lhs = y(27);
rhs = y(7)-y(6);
residual(23) = lhs - rhs;
lhs = y(21);
rhs = y(7)-y(6);
residual(24) = lhs - rhs;
lhs = log(y(31));
rhs = log(y(31))*params(13)-x(3);
residual(25) = lhs - rhs;
lhs = log(y(29));
rhs = log(y(29))*params(12)+x(1);
residual(26) = lhs - rhs;
lhs = log(y(30));
rhs = log(y(30))*params(14)+x(2);
residual(27) = lhs - rhs;
lhs = y(28);
rhs = (y(28));
residual(28) = lhs - rhs;
lhs = y(22);
rhs = y(4)+y(5);
residual(29) = lhs - rhs;
lhs = y(23);
rhs = y(10)/y(13);
residual(30) = lhs - rhs;
lhs = y(13);
rhs = y(16)*y(12);
residual(31) = lhs - rhs;
lhs = y(32);
rhs = y(1)/(y(1));
residual(32) = lhs - rhs;
lhs = y(48);
rhs = y(22)/(y(22));
residual(33) = lhs - rhs;
lhs = y(50);
rhs = y(13)/(y(13));
residual(34) = lhs - rhs;
lhs = y(33);
rhs = y(2)/(y(2));
residual(35) = lhs - rhs;
lhs = y(34);
rhs = y(5)/(y(5));
residual(36) = lhs - rhs;
lhs = y(35);
rhs = y(3)/(y(3));
residual(37) = lhs - rhs;
lhs = y(36);
rhs = y(4)/(y(4));
residual(38) = lhs - rhs;
lhs = y(37);
rhs = y(6)/(y(6));
residual(39) = lhs - rhs;
lhs = y(38);
rhs = y(7)/(y(7));
residual(40) = lhs - rhs;
lhs = y(39);
rhs = y(8)/(y(8));
residual(41) = lhs - rhs;
lhs = y(40);
rhs = y(9)/(y(9));
residual(42) = lhs - rhs;
lhs = y(41);
rhs = y(10)/(y(10));
residual(43) = lhs - rhs;
lhs = y(42);
rhs = y(11)/(y(11));
residual(44) = lhs - rhs;
lhs = y(43);
rhs = y(12)/(y(12));
residual(45) = lhs - rhs;
lhs = y(44);
rhs = y(14)/(y(14));
residual(46) = lhs - rhs;
lhs = y(45);
rhs = y(15)/(y(15));
residual(47) = lhs - rhs;
lhs = y(46);
rhs = y(19)/(y(19));
residual(48) = lhs - rhs;
lhs = y(47);
rhs = y(20)/(y(20));
residual(49) = lhs - rhs;
lhs = y(49);
rhs = y(38)-y(37);
residual(50) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
