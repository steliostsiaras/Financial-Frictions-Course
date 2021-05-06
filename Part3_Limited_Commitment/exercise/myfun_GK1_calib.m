
function F = myfun_GK1_calib(c,sigmab,ksi,betta,phi_mom)
F(1)=phi_mom - (1-sigmab/betta)/(c(1)*(sigmab+ksi)-sigmab/betta); %Equation 1
F(2)=phi_mom - ((1-sigmab)+sigmab*phi_mom*c(2))/(c(2)-((1-sigmab)+sigmab*phi_mom*c(2))*(betta*c(1)-1));%Equation 2
end
