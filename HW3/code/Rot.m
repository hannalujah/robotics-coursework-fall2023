function R = Rot(axis, angle)
%Homogenous rotation about "axis" for "angle" degrees

axis = upper(axis);
switch axis
    case 'X'
        R = [1 0 0 0; 0 cosd(angle) -sind(angle) 0; 0 sind(angle) cosd(angle) 0; 0 0 0 1];
    case 'Y'
        R = [cosd(angle) 0 sind(angle) 0; 0 1 0 0; -sind(angle) 0 cosd(angle) 0 ; 0 0 0 1];
    case 'Z'
        R = [cosd(angle) -sind(angle) 0 0; sind(angle) cosd(angle) 0 0; 0 0 1 0; 0 0 0 1];

end