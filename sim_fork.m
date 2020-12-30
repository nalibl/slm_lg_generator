function [] = sim_fork()
%LG_FUNC

mask_width = 1.5e3;
grid_unit = 1.0;
res = [mask_width, mask_width]/grid_unit;
theta = 0.15;
phi = 0;
width = 200;
lg_order = 1;
shift = [0,0];
if false
    oam_complex = lg_func(res, grid_unit,lg_order, width,shift );
    linear_phase = mod(gen_linear_phase(res,theta,phi,grid_unit), 2*pi);
    dislocation = angle(oam_complex.*exp(1i*linear_phase));
    dislocation_offset = dislocation - min(dislocation(:));
    dislocation_norm = dislocation_offset/max(dislocation_offset(:));
    to_img = gray2ind(dislocation_norm);
    imwrite(to_img,jet,'./fork_2.png')
    figure;imagesc(dislocation);
end
if true
    oam_complex = lg_func(res, grid_unit, lg_order, width, shift);
    linear_phase = gen_linear_phase(res,theta,phi);
    total_complex = oam_complex.*exp(1i*(linear_phase));
    total_phase = slm_amp_phase( total_complex);
    total_phase_pos = total_phase + min(total_phase(:));
    mask = total_phase_pos;
    mask(floor(size(mask,1)/2)+1, floor(size(mask,2)/2)+1) = 0;
    mask_pad = mask;
%     mask_pad = padarray(mask,[1000, 1000]);
    figure;imagesc(mask_pad);
    out = fftshift(fft2(mask_pad));
    figure;imagesc(log(abs(out).^2));
end

% out = fftshift(fft2(mask));
% figure;imagesc(abs(out).^2);
end

