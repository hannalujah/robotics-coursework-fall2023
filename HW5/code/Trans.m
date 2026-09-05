function T = Trans(axis, distance)
%Homogenous transformation along "axis" for the amount of "distance"

axis = upper(axis);
switch axis
    case 'X'
        T = [1 0 0 distance; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    case 'Y'
        T = [1 0 0 0; 0 1 0 distance; 0 0 1 0 ; 0 0 0 1];
    case 'Z'
        T = [1 0 0 0; 0 1 0 0; 0 0 1 distance; 0 0 0 1];
        
end