function mat_modif = remove_row(matrix,row)
       [m,~] = size(matrix);
       for i = 1:m
          if matrix(i,1) == row(1) && matrix(i,2) == row(2)
             matrix(i,:) = []; 
             break;
          end
       end
       
       mat_modif = matrix;
end