function xi_wedge = SE3_wedge(xi)
%SE3_WEDGE generates a 4x4 matrix given a 6-vector in the twist coordinates
%
% SYNOPSIS: xi_wedge = SE3_wedge(xi)
%
% INPUT xi is a 6-vector in the twist coordinates, i.e. xi = (v, w) where
%       v is for the 3-vector translation and w is for the 3-vector
%       axis-angle rotation.
%
% OUTPUT xi_wedge is a 4x4 matrix in the se(3) space.
%
% REMARKS
%
% created with MATLAB ver.: 8.0.0.783 (R2012b) on Mac OS X  Version: 10.8.3 Build: 12D78 
%
% created by: Ping-Lin Chang
% DATE: 17-Jun-2013

if 6 ~= size(xi, 1)
    error('RoboticVision:SE3_wedge:WrongInput', ...
        'Input xi must be a 6x1 column vector in skew coordinate.');
end

if ~isnumeric(xi)
    error('RoboticVision:SE3_wedge:NotNumericType', ...
        'Input xi is not a numeric type.');
end

xi_wedge = zeros(4, 4);

xi_wedge(1,2) = -xi(6);
xi_wedge(1,3) =  xi(5);
xi_wedge(2,3) = -xi(4);

xi_wedge(2,1) =  xi(6);
xi_wedge(3,1) = -xi(5);
xi_wedge(3,2) =  xi(4);

xi_wedge(1,4) = xi(1);
xi_wedge(2,4) = xi(2);
xi_wedge(3,4) = xi(3);

end
