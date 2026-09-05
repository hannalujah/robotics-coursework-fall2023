Obst2 = [3,4,5,1]; %this vectors contains the number of sides for each obstacle
n2 = length(Obst2);  % n = number of the obstacles

% saving obstacles data in a cell
B2 = cell(2,n2);
B2{1,1} = Obst2(1); B2{2,1} = [9 6 12; 10 4 4];
B2{1,2} = Obst2(2); B2{2,2} = [4 10 12 6; 12 18 16 10];
B2{1,3} = Obst2(3); B2{2,3} = [11 13 17 19 15; 12 16 16 12 8];
B2{1,4} = Obst2(4); B2{2,4} = [17.5 17.5;10 8];

Xs = [1;10];
Xf = [22;12];
eta = 1;

P = Path_generator(Xs,Xf,eta,B2);

obs2_1 = polyshape(B2{2,1}(1,:), B2{2,1}(2,:));
obs2_2 = polyshape(B2{2,2}(1,:), B2{2,2}(2,:));
obs2_3 = polyshape(B2{2,3}(1,:), B2{2,3}(2,:));
obs2_4_x = B2{2,4}(1,:); obs2_4_y = B2{2,4}(2,:);

plot(obs2_1);
hold on
plot(obs2_2); 
plot(obs2_3);
plot(obs2_4_x, obs2_4_y);

path_x = P(1,:); path_y = P(2,:);
plot(path_x, path_y)