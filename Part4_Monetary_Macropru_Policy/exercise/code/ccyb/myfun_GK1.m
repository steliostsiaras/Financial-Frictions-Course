
function F = myfun_GK1(c,sigmab,ksi,betta,theta)
F(1)=c(2) - (1-sigmab/betta)/(c(1)*(sigmab+ksi)-sigmab/betta); %Equation 1
F(2)=c(2) - ((1-sigmab)+sigmab*c(2)*theta)/(theta-((1-sigmab)+sigmab*c(2)*theta)*(betta*c(1)-1));%Equation 2
end
