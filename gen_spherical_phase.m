function [ mask ] = gen_spherical_phase( res, prop_z, shift)
%GEN_SPHERICAL_PHASE Summary of this function goes here
%   Detailed explanation goes here
    wl=1.55; % um
    pix_size = 15; % um
    l_x = res(1)*pix_size; % um 
    l_y = res(2)*pix_size; % um
    spectral_vec_x = (-0.5/pix_size):(1/l_x):(0.5/pix_size - 1/l_x);
    spectral_vec_y = (-0.5/pix_size):(1/l_y):(0.5/pix_size - 1/l_y);
    [mesh_x, mesh_y] = meshgrid(spectral_vec_x - shift(1)/l_x, spectral_vec_y - shift(2)/l_y);    
    mask = 2*pi*prop_z*real(sqrt((1/wl^2-mesh_x.^2-mesh_y.^2)));
end

