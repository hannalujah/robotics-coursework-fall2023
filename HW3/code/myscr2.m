syms theta1;
syms theta2;
syms d;

H30 = Rot('Z',theta1)*Trans('Z',310)*Rot('Z',90)*Rot('X',90)*Rot('Z',theta2)*Trans('X',300+d);

H30*[0;0;0;1]




