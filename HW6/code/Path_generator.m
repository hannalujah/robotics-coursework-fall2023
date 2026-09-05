function P = Path_generator(Xs, Xf, eta, B)

%Xs is the starting point
%Xf is the finishing point
%eta is our chosen scaling factor
%B is the cell in which we have stored obstacle data

k = 1; %just a variable to keep track of the number of the points in the path
X = []; %initiating the path points matrix
X(:,k) = Xs; %starting point
[~,n] = size(B); %n: the number of the obstacles

while norm(Xf-X(:,k)) > 0.1 %the threshold we chose to get to Xf
    x = X(:,k); %making things a shade simpler
    F_att = -eta*(x-Xf); %attraction force calculated
    F_rep = zeros(2,n);
    
    for i = 1:n %we're gonna find Bi for n objects
       m = B{1,i}; %m: number of the points of the object i-th
       points = B{2,i}; %coordinates of those points
       B_dis = ones(2,m); 
       for j = 1:m
           p1 = points(:,j);
           if j == m
               p2 = points(:,1);
           else
               p2 = points(:,j+1);
           end
           
           if m == 1
               p2 = points(:,2);
           end
           
           side = p2 - p1; %one side of the polygon
           rot_mat = [0 -1; 1 0]; %rotation matrix (for 90 degrees)
           D = [side, rot_mat*side]; 
           coeff = D\(x - p1); %coeff consists of alpha and beta
           alpha = coeff(1); %we just needed one of them, so we choose alpha
           
           if alpha > 0 && alpha < 1 %finding where Bi of this side lies on
               Bf = alpha*(p2 - p1) + p1;
           elseif alpha <= 0
               Bf = p1;
           else
               Bf = p2;
           end
           
           B_dis(:,j) = Bf; %Bi for one side found, got called Bf, and saved
       end
       
       Bi = B_dis(:,1); %comparing all Bi's to find the closest one to x
       if m > 1
            for j = 2:m
                if norm(x - B_dis(:,j)) < norm(x - Bi)
                    Bi = B_dis(:,j); 
                end
            end
       end
       % Bi found
      
       ro_i = norm(Bi - x); %calculating the repulsive forces
       alpha_i = 1;
       ro_oi = 2; %alpha_i and ro_oi are the same for all obstacles
       if ro_i <= ro_oi
            F_rep(:,i) = alpha_i*(1/ro_i^3)*((1/ro_i) - (1/ro_oi))*(x-Bi);
       end
    end
    
    sumFrep = zeros(2,1); %summing up the repulsive forces now
    for t = 1:n
        sumFrep(1) = sumFrep(1) + F_rep(1,t);
        sumFrep(2) = sumFrep(2) + F_rep(2,t);
    end
    
    F = F_att + sumFrep; %total force be like:
    Fd = F / norm(F); %here comes the unit vector of the path we pave
    eps = 0.1; %and here is the step
    X(:, k+1) = x + eps*Fd; %next point of the path
    k = k+1; %let's do it all over
    
end

X(:,k) = Xf; %adding our last point to the path
P = X; %path generated

end



