clear;
prompt = 'Altitude in Ft : '; % Input the Altitude
H_ft = input(prompt);
H = H_ft*0.3048; %Converting the altitude in the m
[P1,T1,rho1] = Alt_profile(H); % computing the atmosphere properties 
prompt2 = 'velocity in Ft/s: '; %Input velocity in ft/s
u1_ft = input(prompt2);
% u1_ft = (4000:100:20000);
u1 = u1_ft*0.3048; % converting to m/s
rho2 = rho1/0.1; %Initial guess
%  for i = 1:size(u1,2)
  gamma1 = 1.4; % Assuming incoming specific heat ratio as 1.4
  R = 287; % Gas constant
  Cp1 = (gamma1*R)/(gamma1-1); %Assuming perfect gas at station 1
  h1 = Cp1*T1; % computing enthalpy
  M1= u1/sqrt(1.4*287*T1);% Mach number at station 1
  rho_ratio_old = rho1/rho2; % Initial rhoratio guess
  rho_ratio_diff = rho_ratio_old; 
  iter = 1;
  tol = 1E-8; 
%    fileID = fopen('res3.txt','w');
 while rho_ratio_diff > tol
     if(iter > 50)
         tol = 1E-5;
         break;
     end   
   rho2 = rho1/rho_ratio_old;
   P2 = P1+rho1*u1*u1*(1-rho_ratio_old);
   h2 = h1+(u1*u1*(1/2)*(1-(rho_ratio_old)^2));
   X = log10(P2/1.013E5);
   Y = log10(rho2/1.225);
   Z = X-Y;
   gamma = coefficients_P(X,Y,Z); %Gamma for computing rho2
   rho_ratio_new = rho1/((P2/h2)*(gamma/(gamma-1))); %Finding rho2 explicitly
   rho_ratio_diff = abs(rho_ratio_old - rho_ratio_new);  
   rho_ratio_old = rho_ratio_new;
   iter = iter+1;
 end 

    rho2_rho1 = rho2/rho1;
    X2 =  log10(P2/1.013E5);
    Y2 = log10(rho2/1.225);
    gamma_2 = coefficients_T(X,Y,Z); %Gamma for computing T2;
    T_0_ref = 288.16/1.80; %T0 in Rankine, converting to K;
    T2 = T_0_ref*10^(gamma_2);
    T2_T1 = T2/T1;
    P2_P1 = P2/P1;
  fprintf('rho2/rho1 = %.5f \n',rho2_rho1);
  fprintf('T2/T1 = %.5f\n',T2_T1);
  fprintf('P2/P1 = %.5f\n',P2_P1);
%  end







