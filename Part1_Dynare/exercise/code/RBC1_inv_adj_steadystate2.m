function [ys_, params, info] = RBC1_inv_adj_steadystate2(ys_, exo_, params)
% Steady state generated by Dynare preprocessor
    info = 0;
    ys_(11)=params(11);
    ys_(4)=1.0/params(7);
    ys_(14)=(1-params(5))/(ys_(4)-1+params(8));
    ys_(15)=(1-params(5))*params(8)/(ys_(4)-1+params(8));
    ys_(16)=1-ys_(15)-params(6);
    ys_(7)=(params(5)*1/params(13)/ys_(16))^(1/(1+params(14)));
    ys_(8)=ys_(11)*ys_(7)*ys_(14)^((1-params(5))/params(5));
    ys_(12)=params(6)*ys_(8);
    ys_(13)=ys_(12);
    ys_(9)=ys_(14)*ys_(8);
    ys_(10)=ys_(15)*ys_(8);
    ys_(5)=ys_(16)*ys_(8);
    ys_(6)=params(5)*ys_(8)/ys_(7);
    ys_(18)=(1-params(5))*ys_(8)/ys_(9);
    ys_(17)=(1-params(5))*ys_(8)/ys_(9)+1-params(8);
    ys_(1)=log(ys_(5))-params(13)*ys_(7)^(1+params(14))/(1+params(14));
    ys_(2)=1/ys_(5);
    ys_(3)=(-params(13))*ys_(7)^params(14);
    ys_(19)=params(7);
    ys_(20)=1;
    ys_(21)=1;
    % Auxiliary equations
    check_=0;
end
