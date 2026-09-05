function [theta1_1,theta1_2,theta2_1, theta2_2 ,d1, d2] = InvKin(x,y,z)

theta1_1 = (180/pi)*atan(y/x);
theta1_2 = 180+theta1_1;

c = sqrt(x^2+y^2+(z-310)^2); %c = d + 300

d1 = c - 300;
d2 = -c - 300;

b = x / (cosd(theta1_1)*(d1+300)); %b = cos theta2

theta2_1 = (180/pi)*acos(b);
theta2_2 = -theta2_1;

end