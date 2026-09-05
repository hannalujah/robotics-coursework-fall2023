function [Jv, Jw] = JcbCalc(DH, Q)

s = size(DH);
n = s(1);
H = sym(eye(4));

for k = 1:n
       H = H*Rot('Z',DH(k,1))*Trans('Z',DH(k,2))* Trans('X',DH(k,3))*Rot('X', DH(k,4));
end

R = H(1:3, 1:3);
O0On = H(1:3, 4);

Jv = sym(eye(3,n));

for k = 1:3
   for t = 1:n
       Jv(k,t) = diff(O0On(k), Q(t));
   end
end

Jw = sym(eye(3,n));
for k = 1:3
   for m = 1:n
       Jw(k,m) = 0;
       for j = 1:3
           switch k
               case 1
                   Jw(k,m) = Jw(k,m) + diff(R(3,j), Q(m))*R(2,j); 
               case 2
                   Jw(k,m) = Jw(k,m) + diff(R(1,j), Q(m))*R(3,j);
               case 3
                   Jw(k,m) = Jw(k,m) + diff(R(2,j), Q(m))*R(1,j);
           end
       end
   end  
end

end