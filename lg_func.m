function [complex_beam] = lg_func(grid_size, grid_unit,l_order, beam_width, shift)
%LG_FUNC
% l_order = l_order mode
% A = Amplitude
% beam_width = FWHM

%Define working grid size and resolution.

transv_grid_x = grid_unit*((-grid_size(1)/2):(grid_size(1)/2 - 1));
transv_grid_y = grid_unit*((-grid_size(2)/2):(grid_size(2)/2 - 1));
[x,y] = meshgrid(transv_grid_x, transv_grid_y);
x_shifted = x - shift(1);
y_shifted = y - shift(2);

%Laguerre-Gauss equaiton: 
%(ref: N. Hodgson, 'Laser Resonators and Beam Propagation'.(Pg 222)) 
t = (x_shifted.^2 + y_shifted.^2)/(beam_width^2);
phi = l_order.*atan2(y_shifted,x_shifted);
term1 =((sqrt(2)*sqrt(x_shifted.^2 + y_shifted.^2)/beam_width)).^abs(l_order);
% term2 =laguerreL(0,l_order,2.*t);
term3 = exp(-t);
term4 = exp(1i*phi);
complex_beam = term1.*term3.*term4;
end

