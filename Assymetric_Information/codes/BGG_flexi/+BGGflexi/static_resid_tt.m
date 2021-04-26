function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 11);

T(1) = (y(1)*(1-params(3)))^(-1);
T(2) = y(4)^params(5);
T(3) = (y(22)*y(7))^params(1);
T(4) = y(10)*T(3);
T(5) = y(4)^(1-params(1));
T(6) = y(32)^2;
T(7) = y(27)^2;
TEF_0 = logncdf(y(19),(-0.5)*T(7),y(27));
T(8) = TEF_0;
T(9) = (0.5*T(7)-log(y(19)))/y(27);
T(10) = (-((log(y(19))+T(7)*.5)^2));
T(11) = exp(T(10)/(2*T(7)));

end
