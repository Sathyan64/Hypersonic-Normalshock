clear;
prompt = 'Incoming Mach number : ';
M1 = input(prompt);
prompt2 = 'Altitude in feet : ';
H_f = input(prompt2);
H = H_f*0.3048;
[P1,T1,rho1] = Alt_profile(H);
gamma1 = 1.4;
R = 287;
Cp1 = (gamma1*R)/(gamma1-1);
h1 = Cp1*T1;
u1 = M1*sqrt(1.4*287*T1);

rho_ratio_old = 0.1;
rho_ratio_diff = rho_ratio_old;
iter = 1;
tol = 1E-10; 
fileID = fopen('res2.txt','w');
while rho_ratio_diff > tol
 rho2 = rho1/rho_ratio_old;
 P2 = P1+rho1*u1*u1*(1-rho_ratio_old);
 h2 = h1+(u1*u1*(1/2)*(1-(rho_ratio_old)^2));
 X = log(P2/1.013E5);
 Y = log(rho2/1.225);
 Z = X-Y;
 gamma = coefficients_P(X,Y,Z);
 rho_ratio_new = rho1/((P2/h2)*(gamma/(gamma-1)));
 rho_ratio_diff = abs(rho_ratio_old - rho_ratio_new);  
 rho_ratio_old = rho_ratio_new;
 fprintf(fileID,'%d , %.4f, %.4f, %.4f\n',iter,gamma,real(rho2), imag(rho2));
 iter = iter+1;
end 
fclose(fileID);
rho2_rho1 = rho2/rho1;
gamma_2 = coefficients_T(X,Y,Z);
T_0_ref = 288.16;
T2 = T_0_ref*exp(gamma_2);

