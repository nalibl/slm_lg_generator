function [ res ] = inv_sinc( vals, interp_size)
%INV_SINC Summary of this function goes here
%   Detailed explanation goes here
    x_ref = linspace(-pi, -eps, interp_size);
%     x_ref = - logspace(log10(eps), log10(pi), interp_size);
    ref_sample = sin(x_ref)./x_ref;
    vals_size = size(vals);
    res_flat = interp1(ref_sample, x_ref, vals(:));
    res = reshape(res_flat, vals_size);
end

