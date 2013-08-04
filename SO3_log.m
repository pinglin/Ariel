function w = SO3_log(R)
% SO3_LOG generates the logarithmic map of SO(3) given a 3x3 rotation matrix.
%
% SYNOPSIS: w = SO3_log(R)
%
% INPUT R is a 3x3 rotation matrix in SO(3).
%
% OUTPUT w is a 3-vector for axis-angle rotation in so(3).
%
% REMARKS
%
% created with MATLAB ver.: 8.0.0.783 (R2012b) on Mac OS X  Version: 10.8.3 Build: 12D78 
%
% created by: Ping-Lin Chang
% DATE: 16-Jun-2013

if ~(abs(eye(3) - R*R') < epsm)    
    error('RoboticVision:SO3_log:WrongInput', ...
        'Input R is not a rotation matrix')
end

if ~isnumeric(R)
    error('RoboticVision:SO3_log:NotNumericType', ...
        'Input R is not a numeric type.');
end

t = trace(R);
theta = acos((t-1)/2);

if t >= 3-eps
    w_wedge = (0.5-(t-3)/12+(t-1)^2/60)*(R-R');
else
    w_wedge = (R-R')*theta/(2*sin(theta));
end

w = SO3_vee(w_wedge);

end