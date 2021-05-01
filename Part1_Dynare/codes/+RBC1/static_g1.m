function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = RBC1.static_g1_tt(T, y, x, params);
end
g1 = zeros(19, 19);
g1(1,1)=1;
g1(1,5)=(-(1/y(5)));
g1(1,7)=params(12)*getPowerDeriv(y(7),1+params(13),1)/(1+params(13));
g1(2,2)=1;
g1(2,5)=(-((-1)/(y(5)*y(5))));
g1(3,3)=1;
g1(3,7)=(-((-params(12))*getPowerDeriv(y(7),params(13),1)));
g1(4,2)=1-params(7)*y(4);
g1(4,4)=(-(y(2)*params(7)));
g1(5,2)=y(3)/(y(2)*y(2));
g1(5,3)=(-1)/y(2);
g1(5,6)=(-1);
g1(6,7)=(-(T(3)*y(11)*getPowerDeriv(y(7),params(5),1)));
g1(6,8)=1;
g1(6,9)=(-(T(2)*getPowerDeriv(y(9),1-params(5),1)));
g1(6,11)=(-(T(1)*T(3)));
g1(7,6)=(-1);
g1(7,7)=(-(y(8)*params(5)))/(y(7)*y(7));
g1(7,8)=params(5)/y(7);
g1(8,8)=(1-params(5))/y(9);
g1(8,9)=(-(y(8)*(1-params(5))))/(y(9)*y(9));
g1(8,18)=(-1);
g1(9,17)=1;
g1(9,18)=(-1);
g1(10,5)=(-1);
g1(10,8)=1;
g1(10,10)=(-1);
g1(10,12)=(-1);
g1(11,9)=1-(1-params(8));
g1(11,10)=(-1);
g1(12,19)=1;
g1(13,4)=(-y(19));
g1(13,17)=y(19);
g1(13,19)=y(17)-y(4);
g1(14,8)=(-params(6));
g1(14,12)=1;
g1(15,12)=(-1);
g1(15,13)=1;
g1(16,11)=T(4)-params(9)*T(4);
g1(17,8)=(-((-y(9))/(y(8)*y(8))));
g1(17,9)=(-(1/y(8)));
g1(17,14)=1;
g1(18,8)=(-((-y(10))/(y(8)*y(8))));
g1(18,10)=(-(1/y(8)));
g1(18,15)=1;
g1(19,5)=(-(1/y(8)));
g1(19,8)=(-((-y(5))/(y(8)*y(8))));
g1(19,16)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
