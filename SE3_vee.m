function xi = SE3_vee(xi_wedge)
%SE3_VEE extracts a 6-vector from a 4x4 matrix in the se(3) space.
%
% SYNOPSIS: xi = SE3_vee(xi_wedge)
%
% INPUT xi_wedge is a 4x4 matrix in the se(3) space.
%
% OUTPUT xi is a 6-vector, i.e. xi = (v, w) where v is for translation and w is for axis-angle rotation.
%
% REMARKS
%
% created with MATLAB ver.: 8.0.0.783 (R2012b) on Mac OS X  Version: 10.8.3 Build: 12D78 
%
% created by: Ping-Lin Chang
% DATE: 18-Jun-2013

if ~isequal(-xi_wedge(1:3, 1:3), xi_wedge(1:3, 1:3)')
    error('RoboticVision:SE3_vee:WrongInput', ...
          'Input xi_wedge is not a 4x4 matrix in se(3) space')
end

if ~isnumeric(xi_wedge)
    error('RoboticVision:SE3_vee:NotNumericType', ...
        'Input xi_wedge is not a numeric type.');
end

xi = zeros(6, 1);
xi(1:3) = xi_wedge(1:3, 4);
xi(4:6) = [xi_wedge(3,2); xi_wedge(1,3); xi_wedge(2,1)];

end