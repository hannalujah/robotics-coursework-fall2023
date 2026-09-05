clc; clear;

%Robot 2
syms theta1;
syms d1; 
syms d2;

DH2 = [theta1, d1, 0, 0;
      -90, 22.5, -45, -90;
      0, d2 + 30, 0, 0];

Q2 = [theta1; d1; d2];

[Jv_2, Jw_2] = JcbCalc(DH2,Q2);

Jv_2
Jw_2

%Robot 3
syms theta1;
syms theta2; 
syms d;

DH3 = [theta1, 310, 0, 0;
      90, 0, 0, 90;
      theta2, 0, 300+d, 0];
  
Q3 = [theta1; theta2; d];

[Jv_3, Jw_3] = JcbCalc(DH3, Q3);

Jv_3
Jw_3
  
  