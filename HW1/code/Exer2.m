clc
clear

O11 = [0,0,0,1]'; %Homogenous representation of O1 in Frame 1
a = 20;
b = 20;
c = 40;
d = 15; 
e = 15;

%Homogenous transformation from Frame 0 to Frame 1 using matrix
%multiplication
H01 = Trans('Y',a+b)*Trans('Z',e+5)*Trans('X',5)*Rot('Y',-90);

O01 = H01*O11 %Homogenous representation of O1 in Frame 0