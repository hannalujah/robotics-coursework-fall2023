%% Q1

clc; clear;

syms theta1;
syms theta2;
syms d;

H03 = Rot('Z', theta1)*Trans('Z', 310)*Rot('X', 90)*Rot('Z', theta2)*Trans('X', 300+d);
OoO3 = H03(1:3, 4);

%mode 1
Xi = [284.829;-164.446;190.293];
[t11, t12, t21, t22, d1, d2] = InvKin(Xi(1),Xi(2),Xi(3));

%mode2
Xf = [91.203;340.373;605.682];
[th11, th12, th21, th22, d11, d22] = InvKin(Xf(1),Xf(2),Xf(3));

t = 0:0.005:1;
theta1 = (-30 + 315*t.^2 - 210*t.^3)*(pi/180);
theta2 = (20 + 60*t.^2 - 40*t.^3)*(pi/180);
distance = (50 + 330*t.^2 - 220*t.^3)/1000;

%% Q2

v_max = 300;
a_max = (9.81*1000)/4;
delta_s = sqrt(((Xf(1)-Xi(1)))^2+((Xf(2)-Xi(2))^2)+((Xf(3)-Xi(3))^2));

ta = v_max/a_max;
td = delta_s / v_max;
tf = td + ta;

t1 = 0:0.01:ta;
t2 = ta:0.01:td;
t3 = td:0.01:tf;
s1 = 0.5*a_max*t1.^2;
s2 = v_max*(t2-0.5*ta);
s3 = v_max*(t3-td) + a_max*td*(t3 - td) - .5*a_max*(t3.^2-td^2) + v_max*(td - .5*ta);

unit_x = (Xf - Xi)/delta_s;
s_len = length(s1)+length(s2)+length(s3)-2;
Xs = ones(3, s_len);

for i = 1:length(s1)
Xs(:,i) = Xi + s1(i).*unit_x;
end

for i = 1:length(s2)
   Xs(:,i+length(s1)) = Xi + s2(i).*unit_x; 
end

for i = 1:length(s3)
   Xs(:,i+length(s1)+length(s2)) = Xi + s3(i).*unit_x; 
end

Q = ones(3, s_len); %joint variables
for i = 1:s_len
   x = Xs(1, i); y = Xs(2, i); z = Xs(3, i);
   [a,b,c,d,e,f] = InvKin(x,y,z);
    Q(1, i) = a; 
    Q(2, i) = c;
    Q(3, i) = e;
end

tt = 0:0.01:tf;
theta1_2 = Q(1, :)*(pi/180);
theta2_2 = Q(2, :)*(pi/180);
dis = Q(3, :)/1000;