function R = SO3_exp(w)
%SO3_EXP generates the exponential map of SO(3) given a 3-vector.
%
% SYNOPSIS: R = SO3_exp(w)
%
% INPUT w is a 3-vector for axis-angle rotation in so(3).
%
% OUTPUT R is the generated 3x3 rotation matrix in SO(3).
%
% REMARKS
%
% created with MATLAB ver.: 8.0.0.783 (R2012b) on Mac OS X  Version: 10.8.3 Build: 12D78 
%
% created by: Ping-Lin Chang
% DATE: 16-Jun-2013

if ~isequal(size(w), [3 1])
    error('Ariel:SO3_exp:WrongInput', ...
          'w must be a 3-vector');
end

if ~isnumeric(w)
    error('Ariel:SO3_exp:NotNumericType', ...
          'Input w is not a numeric type.');
end

w_wedge = SO3_wedge(w);

theta = norm(w);

if theta ~= 0
    c = w_wedge/theta;
    R = eye(3) + c * sin(theta) + c^2 * (1 - cos(theta));
else
    R = eye(3);
end

end