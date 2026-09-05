theta1 = [130,30,90];
theta2 = [10,50,20];
d = [20,80,250];

P30 = ones(4,3);
H03 = ones(4,4);

for i = 1:3
    H30 = Rot('Z',theta1(i))*Trans('Z',310)*Rot('Z',90)*Rot('X',90)*Rot('Z',theta2(i))*Trans('X',300+d(i));
    P33 = [0;0;0;1];
    P30(:,i) = H30*P33;
end

P30

[theta11,theta12,theta21,theta22,d1,d2] = InvKin(-516.8,0,498.1)

