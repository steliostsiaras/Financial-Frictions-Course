clear all
clc
Phix_value    = (0:1:4)';           % Parameter value grid
rep           = size(Phix_value,1); % Setting index for the loop

for i = 1:rep
phiX   = Phix_value(i);
save Phix_value phiX    % send the parameter value to Dynare

dynare RBC1_inv_adj noclearall
Yres(i,:) = Y_epsA;
Ires(i,:) = I_epsA;
end
%%
plot(Ires')


