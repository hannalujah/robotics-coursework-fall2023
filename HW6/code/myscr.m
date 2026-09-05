X = [points_data(1,1),points_data(1,3)];
Y = [points_data(1,2),points_data(1,4)];
N = 0;
for i = 1:obst_no-1
   if points_data(i,3) == points_data(i+1,1) && points_data(i,4) == points_data(i+1,2)
       X = [X,points_data(i+1,3)];
       Y = [Y,points_data(i+1,4)];
   end
   if X(end) == X(1) && Y(end) == Y(1)
       X = X(1:end-1);
       Y = Y(1:end-1);
       N = N+1;
       pgon = polyshape(X,Y);
       plot(pgon);
       hold on
       X = [];
       Y = [];
   end 
   
end