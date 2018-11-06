P1 = 5.405E4;%Pa
T1 = -17.47+273;%K
M1 = 6.0;
gamma1 = 1.4;
R = 287;
Cp1 = (gamma1*R)/(gamma1-1);
h1 = Cp1*T1;
u1 = M1*sqrt(1.4*287*T1);
rho1 = (P1/(287*T1));%kg/m^3
rho_ratio_old = 0.1;
rho_ratio_diff = rho_ratio_old;
while rho_ratio_diff > 1E-3
  rho2 = rho1*rho_ratio_old;
  P2 = P1+rho1*u1*u1*(1-rho_ratio_old);
  h2 = h1+(u1*u1*(1/2)*(1-(rho_ratio_old)^2));
  X = log(P2/1.013E5);
  Y = log(rho2/1.225);
  Z = X-Y;
  gamma = coefficients(X,Y,Z);
  rho_ratio_new = ((P2/h2)*(gamma/(gamma-1)))/rho1;
  rh0_ratio_diff = abs(rho_ratio_old - rho_ratio_new);  
  rho_ratio_old = rho_ratio_new; 
end; 

rho2 = rho_ratio_old*rho1;