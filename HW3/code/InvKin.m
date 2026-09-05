function [theta1_1,theta1_2,theta2_1, theta2_2 ,d1, d2] = InvKin(x,y,z)

theta1_1 = (180/pi)*atan(x/y);
theta1_2 = 180-theta1_1;
%c = d + 300 , b = cos theta 2
alpha = sind(theta1_1);
beta = cosd(theta1_1);

c = sqrt(((x^2-y^2)/(alpha^2-beta^2))+(z-310)^2);

d1 = c - 300;
d2 = -c - 300;

b = sqrt((x^2-y^2)/(alpha^2-beta^2)/c^2);
b1 = b; b2 = -b;

theta2_1 = (180/pi)*acos(b1);
theta2_2 = (180/pi)*acos(b2);

end