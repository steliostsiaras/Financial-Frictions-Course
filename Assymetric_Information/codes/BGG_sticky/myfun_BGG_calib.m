function F = myfun_BGG_calib(c,p_mom,ksie,rho,phie_mom,R)
%phie_mom=phi 1sigmae
%rho=rho 2sigmapsi
%c(3)=fnGam
%c(4)=fnG
%c(5)=DGam
%c(6)=DG
%p_mom=p 3mon
%c(8)=psi
F=[phie_mom-1/((c(1)+ksie)*(1-c(3))*rho*R);
phie_mom + (R/((rho*R)*(c(3)-c(7)*c(4))-R));
rho-(c(5)/((c(3)-c(7)*c(4))*c(5)+(1-c(3))*(c(5)-c(7)*c(6))));
p_mom- (logncdf(exp(c(8)),-0.5*(c(2))^2,c(2)));
c(4)-(1- normcdf((0.5*(c(2))^2 -log(exp(c(8))))/c(2),0,1));
c(3)-(c(4)+exp(c(8))*(1-p_mom));
c(5)-(1-p_mom);
c(6)-(1/(exp(c(8))*c(2)*sqrt(2*(4*atan(1))))*exp(-((log(exp(c(8)))+.5*(c(2))^2)^2)/(2*(c(2))^2)));];
end
%% 
%phie_mom=Rk
%rho=Ne
%c(3)=K
%c(4)=Y
%c(5)=C
%c(6)=Ce
%p_mom=L
%c(8)=Rl
%c(9)=psi
%c(10)=Z
%c(11)=p
%c(12)=fnG
%c(13)=fnGam
%c(14)=DGam
%c(15)=DG
%c(16)=rho
%c(17)=I
%c(18)=w
%c(19)=labour
