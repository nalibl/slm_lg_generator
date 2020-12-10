function [ mask ] = gen_linear_phase( res, theta, phi, pix_size)
%GEN_LINEAR_PHASE Summary of this function goes here
%   Detailed explanation goes here
    if nargin < 4       
        pix_size = 15; % um 
    end
    wl = 1.55; % um
    spatial_vec_x = (1:res(1))*pix_size;
    spatial_vec_y = (1:res(2))*pix_size;
    [mesh_x, mesh_y] = meshgrid(spatial_vec_x, spatial_vec_y);
    k_0 = 2*pi/wl;
    mask = k_0 * (sin(theta)*mesh_x + sin(phi)*mesh_y);
end

