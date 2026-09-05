function dijkstra(Ps,Pf,points,polylist,N)

allPoints = flip([Ps;points;Pf]);
[number,~] = size(allPoints);

notMet = remove_row(allPoints,Pf);
X = Pf;
X_previous = [0,0];
Pdata = ones(number,3);
Pdata(1,1:2) = Pf; Pdata(1,3) = 0;
for j = 2:number
    Pdata(j,1:2) = allPoints(j,:);
    Pdata(j,3) = 1000;
end

while X(:) ~= Ps(:)
   neighbors = [];
   dis = [];
   n_neighbors = 0;
   [row,~] = size(notMet);
for j = 1:row
      lineseg = [X;notMet(j,:)];
      IN = [];
      for k = 1:N
         [in,~] = intersect(polylist(k),lineseg);
         IN = [IN;in];
      end
        if isempty(IN)
            neighbors = [neighbors;notMet(j,:)];
            n_neighbors = n_neighbors + 1;
            dis = [dis; norm(X-notMet(j,:))];
        end
end
    %find current node in Pdata
    for j = 1:number
        if X(1) == Pdata(j,1) && X(2) == Pdata(j,2)
            current = j;
            dis_current = Pdata(j,3);
        end
    end

    for j = 1:number
       for k = 1:n_neighbors
          if Pdata(j,1) == neighbors(k,1) && Pdata(j,2) == neighbors(k,2)
             dis(k) = norm(neighbors(k,:) - X) + dis_current; 
             Pdata(j,3) = dis(k);
          end
       end
    end


   least_distant = 1;
   least_distance = dis(1);
   
   for j = 2:n_neighbors
      if dis(j) <= least_distance
         least_distance = dis(j);
         least_distant = j;
      end
   end
   
   pathX = [X(1), neighbors(least_distant,1)];
   pathY = [X(2), neighbors(least_distant,2)];
   plot(pathX,pathY,'g');
   X_previous = X;
   notMet = remove_row(notMet,X_previous);
   X = neighbors(least_distant,:);
    
end

pathX = [X(1), Ps(1)];
pathY = [X(2), Ps(2)];
plot(pathX,pathY,'g');
end