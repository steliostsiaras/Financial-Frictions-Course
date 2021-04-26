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

assert(length(T) >= 34);

T(1) = (-1);
T(2) = (y(1)-y(1)*params(3))^T(1);
T(3) = y(4)^params(5);
T(4) = y(4)^(1-params(1));
T(5) = y(7)^params(1);
T(6) = y(10)*T(5);
T(7) = y(87)^2;
T(8) = y(39)^2;
TEF_0 = logncdf(y(19),(-0.5)*T(8),y(39));
T(9) = TEF_0;
T(10) = (0.5*T(8)-log(y(19)))/y(39);
T(11) = (-((log(y(19))+T(8)*.5)^2));
T(12) = exp(T(11)/(2*T(8)));
T(13) = y(30)^((-params(17))*params(14));
T(14) = y(32)*params(15)*T(13);
T(15) = y(30)^params(14);
T(16) = y(30)^(params(17)*(-params(14)));
T(17) = y(30)^(params(14)-1);
T(18) = y(30)^(params(17)*(1-params(14)));
T(19) = y(34)*params(14)/(params(14)-1)/y(33);
T(20) = y(66)/(y(66));
T(21) = y(6)/(y(6))/T(20);
T(22) = (y(61)-params(3)*y(61))^T(1);
T(23) = y(64)^params(5);
T(24) = y(64)^(1-params(1));
T(25) = y(67)^params(1);
T(26) = y(79)^2;
T(27) = params(20)^2;
T(28) = sqrt(1-T(27));
T(29) = params(21)*T(28);
T(30) = params(20)^3;
T(31) = params(20)^4;
T(32) = params(20)^5;
T(33) = params(20)^6;
T(34) = params(20)^7;

end
