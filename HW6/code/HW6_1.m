clc; clear;
Obst = [3,4,5]; %this vectors contains the number of sides for each obstacle
n = length(Obst);  % n = number of the obstacles

% saving obstacles data in a cell
B = cell(2,n);
B{1,1} = Obst(1); B{2,1} = [9 6 12; 10 4 4];
B{1,2} = Obst(2); B{2,2} = [4 10 12 6; 12 18 16 10];
B{1,3} = Obst(3); B{2,3} = [11 13 17 19 15; 12 16 16 12 8];

Xs = [1;10];
Xf = [22;12];
eta = 1;


P = Path_generator(Xs,Xf,eta,B);

% plotting obstacles
obs1 = polyshape(B{2,1}(1,:), B{2,1}(2,:));
obs2 = polyshape(B{2,2}(1,:), B{2,2}(2,:));
obs3 = polyshape(B{2,3}(1,:), B{2,3}(2,:));

plot(obs1);
hold on
plot(obs2); 
plot(obs3);

path_x = P(1,:); path_y = P(2,:);
plot(path_x, path_y)

