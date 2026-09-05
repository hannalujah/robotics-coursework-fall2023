function graph = graph_generator(Ps,Pf,points,polylist,N)

allP = [Ps';points;Pf'];
s = size(allP);
number = s(1);
graph = [];
max_graph_lines = factorial(number)/(2*factorial(number-2));

for i = 1:max_graph_lines-1
    for j = 1:max_graph_lines+1
        if i+j <= number
            lineseg = [allP(i,:);allP(i+j,:)];
            IN = [];
            for k = 1:N
                [in,~] = intersect(polylist(k),lineseg);
                IN = [IN,in];
            end
            if isempty(IN)
                    lineX = [lineseg(:,1)'];
                    lineY =[lineseg(:,2)']; 
                    plot(lineX,lineY,'r');
                    hold on
                    graph = [graph; lineX, lineY];
            end
        end
    end
end

end