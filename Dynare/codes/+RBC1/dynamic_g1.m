function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = RBC1.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(19, 26);
g1(1,4)=1;
g1(1,8)=(-(1/y(8)));
g1(1,10)=params(12)*getPowerDeriv(y(10),1+params(13),1)/(1+params(13));
g1(2,5)=1;
g1(2,8)=(-((-1)/(y(8)*y(8))));
g1(3,6)=1;
g1(3,10)=(-((-params(12))*getPowerDeriv(y(10),params(13),1)));
g1(4,5)=1;
g1(4,23)=(-(params(7)*y(7)));
g1(4,7)=(-(params(7)*y(23)));
g1(5,5)=y(6)/(y(5)*y(5));
g1(5,6)=(-1)/y(5);
g1(5,9)=(-1);
g1(6,10)=(-(T(3)*y(14)*getPowerDeriv(y(10),params(5),1)));
g1(6,11)=1;
g1(6,2)=(-(T(2)*getPowerDeriv(y(2),1-params(5),1)));
g1(6,14)=(-(T(1)*T(3)));
g1(7,9)=(-1);
g1(7,10)=(-(y(11)*params(5)))/(y(10)*y(10));
g1(7,11)=params(5)/y(10);
g1(8,11)=(1-params(5))/y(2);
g1(8,2)=(-(y(11)*(1-params(5))))/(y(2)*y(2));
g1(8,21)=(-1);
g1(9,20)=1;
g1(9,21)=(-1);
g1(10,8)=(-1);
g1(10,11)=1;
g1(10,13)=(-1);
g1(10,15)=(-1);
g1(11,2)=(-(1-params(8)));
g1(11,12)=1;
g1(11,13)=(-1);
g1(12,1)=(-((-(y(5)*params(7)))/(y(1)*y(1))));
g1(12,5)=(-(params(7)/y(1)));
g1(12,22)=1;
g1(13,7)=(-y(25));
g1(13,24)=y(25);
g1(13,25)=y(24)-y(7);
g1(14,11)=(-params(6));
g1(14,15)=1;
g1(15,15)=(-1);
g1(15,16)=1;
g1(16,3)=(-(params(9)*1/y(3)));
g1(16,14)=1/y(14);
g1(16,26)=(-params(11));
g1(17,11)=(-((-y(12))/(y(11)*y(11))));
g1(17,12)=(-(1/y(11)));
g1(17,17)=1;
g1(18,11)=(-((-y(13))/(y(11)*y(11))));
g1(18,13)=(-(1/y(11)));
g1(18,18)=1;
g1(19,8)=(-(1/y(11)));
g1(19,11)=(-((-y(8))/(y(11)*y(11))));
g1(19,19)=1;

end
