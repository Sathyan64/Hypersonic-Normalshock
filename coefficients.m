function [gamma] = coefficients_T(X,Y,Z)
if Y > -0.50
    if Z <= 0.30
      c1=1.40000;
      c2=0.00000;
      c3=0.00000;
      c4=0.00000;
      c5=0.00000;
      c6=0.00000;
      c7=0.00000;
      c8=0.00000;
      c9=0.00000;
      c10=0.0000;
      c11=0.0000;
    elseif Z > 0.30 && Z<= 1.15
      c1=1.42598;
      c2=0.000918;
      c3=-0.092209;
      c4=-0.002226;
      c5=0.019772;
      c6=-0.036600;
      c7=-0.077469;
      c8=0.043878;
      c9=-15.0;
      c10=-1.0;
      c11=-1.040;
    elseif Z > 1.15 && Z<= 1.60
      c1=1.64689;
      c2=-0.062133;
      c3=-0.334994;
      c4=0.063612;
      c5=-0.038332;
      c6=-0.014468;
      c7=0.073421;
      c8=-0.002442;
      c9=-15.0;
      c10=-1.0;
      c11=-1.360;
    else
      c1=1.48558;
      c2=-0.453562;
      %% 
      c3=0.152096;
      %% 
      c4=0.303350;
      c5=-0.459282;
      c6=0.448395;
      c7=0.220546;
      c8=-0.292293;
      c9=-10.0;
      c10=-1.0;
      c11=-1.600; 
    end
elseif Y > -4.50 && Y<= -0.5
    if Z <= 0.30
      c1=1.40000;
      c2=0.00000;
      c3=0.00000;
      c4=0.00000;
      c5=0.00000;
      c6=0.00000;
      c7=0.00000;
      c8=0.00000;
      c9=0.00000;
      c10=0.0000;
      c11=0.0000;
   elseif Z > 0.30 && Z<= 0.98
      c1=1.42176;
      c2=-0.000366;
      c3=-0.083614;
      c4=0.000675;
      c5=0.005272;
      c6=-0.115853;
      c7=-0.007363;
      c8=0.146179;
      c9=-20.0;
      c10=-1.0;
      c11=-0.860;
    elseif Z > 0.98 && Z<= 1.38
      c1=1.74436;
      c2=-0.035354;
      c3=-0.415045;
      c4=0.061921;
      c5=0.018536;
      c6=0.043582;
      c7=0.044353;
      c8=-0.049750;
      c9=-20.0;
      c10=-1.04;
      c11=-1.336;
    elseif Z > 1.38 && Z<= 2.04
      c1=1.49674;
      c2=-0.021583;
      c3=-0.197008;
      c4=0.030886;
      c5=-0.157738;
      c6=-0.009158;
      c7=0.123213;
      c8=-0.006553;
      c9=-10.0;
      c10=-1.05;
      c11=-1.895;
    else
      c1=1.10421;
      c2=-0.033664;
      c3=0.031768;
      c4=0.024335;
      c5=-0.178802;
      c6=-0.017456;
      c7=0.080373;
      c8=0.002511;
      c9=-15.0;
      c10=-1.08;
      c11=-2.650; 
    end
 elseif Y > -7 && Y<= -4.5
     if Z < 0.398
      c1=1.40000;
      c2=0.00000;
      c3=0.00000;
      c4=0.00000;
      c5=0.00000;
      c6=0.00000;
      c7=0.00000;
      c8=0.00000;
      c9=0.00000;
      c10=0.0000;
      c11=0.0000;
  
    elseif Z > 0.398 && Z<= 0.87
      c1=1.47003;
      c2=0.007939;
      c3=-0.244205;
      c4=-0.025607;
      c5=0.872248;
      c6=0.049452;
      c7=-0.764158;
      c8=0.000147;
      c9=-20.0;
      c10=-1.0;
      c11=-0.742; 
   elseif Z > 0.87 && Z<= 1.27
      c1=3.18652;
      c2=0.13793;
      c3=-1.89529;
      c4=-0.103490;
      c5=-2.14572;
      c6=-0.272717;
      c7=2.06586;
      c8=0.223046;
      c9=-15.0;
      c10=-1.0;
      c11=-1.041;
   elseif Z > 1.27 && Z<= 1.863
      c1=1.63963;
      c2=-0.001004;
      c3=-0.303549;
      c4=0.016464;
      c5=-0.852169;
      c6=-0.101237;
      c7=0.503123;
      c8=0.043580;
      c9=-10.0;
      c10=-1.0;
      c11=-1.544;
     else   
      c1=1.55889;
      c2=0.055932;
      c3=-0.211764;
      c4=-0.023548;
      c5=-0.549041;
      c6=-0.101758;
      c7=0.276732;
      c8=0.046031;
      c9=-15.0;
      c10=-1.0;
      c11=-2.250;
     end   
end
% gamma = [c1;c2;c3;c4;c5;c6;c7;c8;c9;c10;c11];
gamma = c1+c2*Y+c3*Z+c4*Y*Z+ ((c5+c6*Y+c7*Z+c8*Y*Z)/(1+exp(c9*(X+c10*Y+c11))));
