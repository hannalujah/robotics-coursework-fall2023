clc; clear;

dataId = fopen('data1.txt', 'r');
data = fscanf(dataId,'%d',Inf);
fclose(dataId);

obst_no = data(1);
points_data = ones(obst_no,4);
for i = 1:obst_no
    for j = 1:4
       points_data(i,j) = data(2+4*(i-1)+j-1); 
    end
end

[sizeData,~] = size(data);
P_start = [data(sizeData-3); data(sizeData-2)];
P_end = [data(sizeData-1); data(sizeData)];

X = [points_data(1,1),points_data(1,3)];
Y = [points_data(1,2),points_data(1,4)];
points = [];
polylist = [];
N = 0;
flag = 0; %X does have a number within
for i = 1:obst_no-1
    if flag == 1
        X = [points_data(i+1,1),points_data(i+1,3)];
        Y = [points_data(i+1,2),points_data(i+1,4)];
        flag = 0;
        continue
    end
    
   if points_data(i,3) == points_data(i+1,1) && points_data(i,4) == points_data(i+1,2)
       X = [X,points_data(i+1,3)];
       Y = [Y,points_data(i+1,4)];
   end
   if X(end) == X(1) && Y(end) == Y(1)
       X = X(1:end-1);
       Y = Y(1:end-1);
       points = [points;X',Y'];
       N = N+1;
       pgon = polyshape(X,Y);
       polylist = [polylist,pgon];
       plot(pgon);
       hold on
       X = [];
       Y = [];
       flag = 1; %X is empty
   end 
end

graph = graph_generator(P_start,P_end, points,polylist,N);
dijkstra(P_start',P_end',points,polylist,N);
