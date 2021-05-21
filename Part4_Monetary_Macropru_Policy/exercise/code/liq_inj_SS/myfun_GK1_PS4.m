
function F = myfun_GK1_PS4(c,sigmab,ksi,betta,theta,chi_m,omega)
tempi = sigmab*((1/betta)*(1-chi_m) + (omega*c(1) + (1-omega)*(1/betta))*chi_m);
F(1)=c(2) - ((1-sigmab/betta)*(1-omega*chi_m)/(c(1)*(sigmab+ksi)-tempi)); %Equation 1
F(2)=c(2) - ((1-sigmab)+sigmab*c(2)*theta)/(theta-((1-sigmab)+sigmab*c(2)*theta)*(betta*c(1)-1));%Equation 2
end
