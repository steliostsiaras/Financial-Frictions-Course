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
    T = RBC1.static_resid_tt(T, y, x, params);
end
residual = zeros(19, 1);
lhs = y(1);
rhs = log(y(5))-params(12)*y(7)^(1+params(13))/(1+params(13));
residual(1) = lhs - rhs;
lhs = y(2);
rhs = 1/y(5);
residual(2) = lhs - rhs;
lhs = y(3);
rhs = (-params(12))*y(7)^params(13);
residual(3) = lhs - rhs;
lhs = y(2);
rhs = y(2)*params(7)*y(4);
residual(4) = lhs - rhs;
lhs = (-y(3))/y(2);
rhs = y(6);
residual(5) = lhs - rhs;
lhs = y(8);
rhs = T(2)*T(3);
residual(6) = lhs - rhs;
lhs = y(8)*params(5)/y(7);
rhs = y(6);
residual(7) = lhs - rhs;
lhs = y(8)*(1-params(5))/y(9);
rhs = y(18);
residual(8) = lhs - rhs;
lhs = y(17);
rhs = y(18)+1-params(8);
residual(9) = lhs - rhs;
lhs = y(8);
rhs = y(5)+y(12)+y(10);
residual(10) = lhs - rhs;
lhs = y(9);
rhs = y(10)+y(9)*(1-params(8));
residual(11) = lhs - rhs;
lhs = y(19);
rhs = params(7);
residual(12) = lhs - rhs;
lhs = y(17)*y(19);
rhs = y(4)*y(19);
residual(13) = lhs - rhs;
lhs = y(12);
rhs = y(8)*params(6);
residual(14) = lhs - rhs;
lhs = y(13);
rhs = y(12);
residual(15) = lhs - rhs;
lhs = log(y(11))-log((y(11)));
rhs = (log(y(11))-log((y(11))))*params(9)+params(11)*x(1);
residual(16) = lhs - rhs;
lhs = y(14);
rhs = y(9)/y(8);
residual(17) = lhs - rhs;
lhs = y(15);
rhs = y(10)/y(8);
residual(18) = lhs - rhs;
lhs = y(16);
rhs = y(5)/y(8);
residual(19) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
