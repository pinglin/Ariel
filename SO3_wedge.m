function w_wedge = SO3_wedge(w)
%SO3_WEDGE generates a skew-symmetric matrix given a 3-vector w
%
% SYNOPSIS: w_wedge = SO3_wedge(w)
%
% INPUT w is a 3-vector for axis-angle representation.
%
% OUTPUT w_wedge is a skew-symmetric matrix that is w_wedge^T = -w_wedge.
%
% REMARKS
%
% created with MATLAB ver.: 8.0.0.783 (R2012b) on Mac OS X  Version: 10.8.3 Build: 12D78 
%
% created by: Ping-Lin Chang
% DATE: 16-Jun-2013

if 3 ~= size(w, 1)
    error('RoboticVision:SO3_wedge:WrongInput', ...
    'Input w must be a 3x1 column vector in skew coordinate.');
end

if ~isnumeric(w)
    error('RoboticVision:SO3_wedge:NotNumericType', 'Input w is not a numeric type.');
end

w_wedge = zeros(3,3);

w_wedge(1,2) = -w(3);
w_wedge(1,3) =  w(2);
w_wedge(2,3) = -w(1);

w_wedge(2,1) =  w(3);
w_wedge(3,1) = -w(2);
w_wedge(3,2) =  w(1);

end