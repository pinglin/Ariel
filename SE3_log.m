function xi = SE3_log(T)
%SE3_LOG generates the logarithmic map of SE(3) given a 4x4 rigid-body transformation matrix.
%
% SYNOPSIS: xi = SE3_log(T)
%
% INPUT T is a 4x4 homogeneous rigid-body transformation matrix in SE(3).
%
% OUTPUT xi is a 6-vector for the twist coordinates in the se(3) space.
%
% REMARKS
%
% created with MATLAB ver.: 8.0.0.783 (R2012b) on Mac OS X  Version: 10.8.3 Build: 12D78 
%
% created by: Ping-Lin Chang
% DATE: 19-Jun-2013

if ~isequal(size(T), [4 4])
    error('RoboticVision:SE3_log:WrongInput', ...
          'Input T must be a 4x4 matrix')
end

if ~isnumeric(T)
    error('RoboticVision:SE3_log:NotNumericType', ...
        'Input T is not a numeric type.');
end

xi = zeros(6, 1);

% Rotation part
R = T(1:3, 1:3);
t = trace(R);
theta = acos((t-1)/2);

if t >= 3-eps
    w_wedge = (0.5-(t-3)/12+(t-1)^2/60)*(R-R');
else
    w_wedge = (R-R')*theta/(2*sin(theta));
end

w = SO3_vee(w_wedge);
xi(4:6) = w;

% Translation part
w_norm = norm(w);
if w_norm ~= 0
    A_inv = eye(3) - ...
            0.5*w_wedge + ...
            (2*sin(w_norm)-w_norm*(1+cos(w_norm)))/ ...
            (2*w_norm^2*sin(w_norm))*w_wedge^2;
    xi(1:3) = A_inv*T(1:3, 4);
else
    xi(1:3) = T(1:3, 4);
end

end