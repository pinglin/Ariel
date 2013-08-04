function w = SO3_vee(w_wedge)
%SO3_VEE extracts a 3-vector from a skew-symmetric matrix.
%
% SYNOPSIS: w = SO3_vee(w_wedge)
%
% INPUT w_wedge is a skew-symmetric matrix.
%
% OUTPUT w is a 3-vector.
%
% REMARKS
%
% created with MATLAB ver.: 8.0.0.783 (R2012b) on Mac OS X  Version: 10.8.3 Build: 12D78 
%
% created by: Ping-Lin Chang
% DATE: 16-Jun-2013

if ~isequal(-w_wedge, w_wedge')
    error('RoboticVision:SO3_vee:WrongInput', ...
          'Input w_wedge must be a 3x3 skew-symmetric matrix')
end

if ~isnumeric(w_wedge)
    error('RoboticVision:SO3_vee:NotNumericType', ...
        'Input w_wedge is not a numeric type.');
end

w = [w_wedge(3,2); w_wedge(1,3); w_wedge(2,1)];

end