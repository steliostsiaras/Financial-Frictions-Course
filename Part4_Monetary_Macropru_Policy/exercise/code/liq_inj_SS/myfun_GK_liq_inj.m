
function F = myfun_GK_liq_inj(c,sigmab,ksi,betta,theta,omega,chim)
F(1)=c(2) - (1-sigmab/betta)*(1-omega*chim)/(c(1)*(sigmab+ksi)-sigmab/betta + omega*sigmab*chim*(1/betta-c(1))); %Equation 1
F(2)=c(2) - ((1-sigmab)+sigmab*c(2)*theta)/(theta-((1-sigmab)+sigmab*c(2)*theta)*(betta*c(1)-1));%Equation 2
end
