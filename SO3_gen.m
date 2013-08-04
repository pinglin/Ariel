function [g1, g2, g3] = SO3_gen
%SO3_GEN returns the generators of SO(3)
%
% SYNOPSIS: [g1 g2 g3] = SO3_gen
%
% INPUT Nan
%
% OUTPUT Generators of SO(3) group
%
% REMARKS
%
% created with MATLAB ver.: 8.0.0.783 (R2012b) on Mac OS X  Version: 10.8.3 Build: 12D78 
%
% created by: Ping-Lin Chang
% DATE: 19-Jun-2013

g1 = zeros(4, 4);
g2 = zeros(4, 4);
g3 = zeros(4, 4);

g1(3, 2) = 1;
g1(2, 3) = -1;

g2(3, 1) = -1;
g2(1, 3) = 1;

g3(2, 1) = 1;
g3(1, 2) = -1;

end