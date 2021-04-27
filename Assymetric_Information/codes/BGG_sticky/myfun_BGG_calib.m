function F = myfun_BGG_calib(c,p_mom,ksie,rho,phie_mom,R)
%phie_mom=phi 1 sigmae
%rho=rho 2 sigm_omega
%c(3)=fnGam
%c(4)=fnG
%c(5)=DGam
%c(6)=DG
%p_mom=p 3 mon
%c(8)=psi
F=[phie_mom-1/((c(1)+ksie)*(1-c(3))*rho*R); %Eq 1
phie_mom + (R/((rho*R)*(c(3)-c(7)*c(4))-R)); %Eq 2
rho   - (c(5)/((c(3)-c(7)*c(4))*c(5)+(1-c(3))*(c(5)-c(7)*c(6)))); %rho
p_mom - (logncdf(exp(c(8)),-0.5*(c(2))^2,c(2))); %p
c(4)  - (1- normcdf((0.5*(c(2))^2 -log(exp(c(8))))/c(2),0,1)); %fnG
c(3)  - (c(4)+exp(c(8))*(1-p_mom)); %fnGam
c(5)  - (1-p_mom); %DGam
c(6)  - (1/(exp(c(8))*c(2)*sqrt(2*(4*atan(1))))*exp(-((log(exp(c(8)))+.5*(c(2))^2)^2)/(2*(c(2))^2)));]; %DG
end

