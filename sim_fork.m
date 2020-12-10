function [] = sim_fork()
%LG_FUNC

mask_width = 3e3;
grid_unit = 1.0;
res = [mask_width, mask_width]/grid_unit;
theta = 0.0775;
transv_grid_x = grid_unit*((-res(1)/2):(res(1)/2 - 1));
transv_grid_y = grid_unit*((-res(2)/2):(res(2)/2 - 1));
[x,y] = meshgrid(transv_grid_x, transv_grid_y);
oam_complex = lg_func(res, grid_unit,1, 100, [0,0]);
linear_phase = gen_linear_phase(res,theta,0,grid_unit);
total_complex = oam_complex.*exp(1i*linear_phase);
mask = double(angle(total_complex)>0);

out = fftshift(fft2(mask.*oam_complex));
figure;imagesc(abs(out).^2);
end

