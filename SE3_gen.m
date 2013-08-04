function [g1, g2, g3, g4, g5, g6] = SE3_gen
%SE3_GEN returns the generators of SE(3)
%
% SYNOPSIS: [g1, g2, g3, g4, g5, g6] = SE3_gen
%
% INPUT Nan
%
% OUTPUT Generators of SE(3) group
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
g4 = zeros(4, 4);
g5 = zeros(4, 4);
g6 = zeros(4, 4);

g1(1, 4) = 1;
g2(2, 4) = 1;
g3(3, 4) = 1;

g4(3, 2) = 1;
g4(2, 3) = -1;

g5(3, 1) = -1;
g5(1, 3) = 1;

g6(2, 1) = 1;
g6(1, 2) = -1;

end