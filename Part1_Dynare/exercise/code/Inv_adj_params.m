clear all
clc
Phix_value    = (0:1:4)';           % Parameter value grid
rep           = size(Phix_value,1); % Setting index for the loop

for i = 1:rep
phiX   = Phix_value(i);             % Give to Phix the value of every iteration
save Phix_value phiX                % send the parameter value to Dynare

dynare RBC1_inv_adj noclearall      % Run the mod file every time 
% importantly set noclearall, otherwise 
% Dynare erases all data in the workspace

Yres(i,:) = Y_epsA; % thake the IRF of every variable and add it to the new 40xrep matrix
Ires(i,:) = I_epsA;
Cres(i,:) = C_epsA;
Hres(i,:) = H_epsA;
end
%%
subplot(2,2,1)
plot(Yres')
set(gca, 'FontName', 'Lucida Fax')
set(gca, 'FontSize', 12)
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on';
axis tight;
title('Output')
ylabel('%\Delta from SS')
subplot(2,2,2)
plot(Ires')
set(gca, 'FontName', 'Lucida Fax')
set(gca, 'FontSize', 12)
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on';
axis tight;
title('Investment')
ylabel('%\Delta from SS')
subplot(2,2,3)
plot(Cres')
set(gca, 'FontName', 'Lucida Fax')
set(gca, 'FontSize', 12)
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on';
axis tight;
title('Consumption')
ylabel('%\Delta from SS')
subplot(2,2,4)
plot(Hres')
set(gca, 'FontName', 'Lucida Fax')
set(gca, 'FontSize', 12)
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on';
axis tight;
title('Hours')
ylabel('%\Delta from SS')
legend('\phi_x=0 ', '\phi_x=1 ','\phi_x=2 ', '\phi_x=3 ','\phi_x=4 ')
