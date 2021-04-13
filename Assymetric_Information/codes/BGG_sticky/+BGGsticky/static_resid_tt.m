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

assert(length(T) >= 32);

T(1) = (-1);
T(2) = (y(1)-y(1)*params(3))^T(1);
T(3) = y(4)^params(5);
T(4) = y(4)^(1-params(1));
T(5) = y(7)^params(1);
T(6) = y(10)*T(5);
T(7) = y(39)^2;
TEF_0 = logncdf(y(19),(-0.5)*T(7),y(39));
T(8) = TEF_0;
T(9) = (0.5*T(7)-log(y(19)))/y(39);
T(10) = (-((log(y(19))+T(7)*.5)^2));
T(11) = exp(T(10)/(2*T(7)));
T(12) = y(30)^((-params(18))*params(15));
T(13) = y(32)*params(16)*T(12);
T(14) = y(30)^params(15);
T(15) = y(30)^(params(18)*(-params(15)));
T(16) = y(30)^(params(15)-1);
T(17) = y(30)^(params(18)*(1-params(15)));
T(18) = y(34)*params(15)/(params(15)-1)/y(33);
T(19) = y(66)/(y(66));
T(20) = y(6)/(y(6))/T(19);
T(21) = (y(61)-params(3)*y(61))^T(1);
T(22) = y(64)^params(5);
T(23) = y(64)^(1-params(1));
T(24) = y(67)^params(1);
T(25) = params(21)^2;
T(26) = sqrt(1-T(25));
T(27) = params(22)*T(26);
T(28) = params(21)^3;
T(29) = params(21)^4;
T(30) = params(21)^5;
T(31) = params(21)^6;
T(32) = params(21)^7;

end
