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

assert(length(T) >= 16);

T(1) = y(27)^2;
TEF_0 = logncdf(y(19),(-0.5)*T(1),y(27));
T(2) = TEF_0;
T(3) = (0.5*T(1)-log(y(19)))/y(27);
T(4) = 1-normcdf(T(3),0,1);
T(5) = T(4)+y(19)*(1-T(2));
T(6) = (-((log(y(19))+T(1)*.5)^2));
T(7) = exp(T(6)/(2*T(1)));
T(8) = (y(1)*(1-params(3)))^(-1);
T(9) = y(4)^params(5);
T(10) = (y(22)*y(7))^params(1);
T(11) = y(10)*T(10);
T(12) = y(4)^(1-params(1));
T(13) = 1-T(5);
T(14) = y(11)/y(5);
T(15) = 1-T(2)-1/(y(19)*y(27)*2.506628274631)*T(7)*y(29);
T(16) = (1-T(2))*(T(5)-T(4)*y(29))+T(13)*T(15);

end
