function T = SE3_exp(xi)
%SE3_EXP generates the exponential map of SE(3) given a 6-vector in the twist coordinates.
%
% SYNOPSIS: T = SE3_exp(xi)
%
% INPUT xi is a 6-vector in the twist coordinates in the se(3) space.
%
% OUTPUT T is a 4x4 homogeneorus matrix for SE(3) rigid-body transformation.
%
% REMARKS
%
% created with MATLAB ver.: 8.0.0.783 (R2012b) on Mac OS X  Version: 10.8.3 Build: 12D78 
%
% created by: Ping-Lin Chang
% DATE: 18-Jun-2013

if ~isequal(size(xi), [6 1])
    error('RoboticVision:SE3_exp:WrongInput', ...
          'Input xi must be a 3-vector')
end

if ~isnumeric(xi)
    error('RoboticVision:SE3_exp:NotNumericType', ...
        'Input xi is not a numeric type.');
end

w_wedge = SO3_wedge(xi(4:6));
w_norm = norm(xi(4:6));

T = eye(4);
if w_norm ~= 0
    T(1:3, 1:3) = SO3_exp(xi(4:6));
    A = eye(3) + ...
        w_wedge/(w_norm^2)*(1-cos(w_norm)) + ...
        (w_wedge^2)/(w_norm^3)*(w_norm-sin(w_norm));    
    T(1:3, 4) = A*xi(1:3);
else
    T(1:3, 4) = xi(1:3);
end

end