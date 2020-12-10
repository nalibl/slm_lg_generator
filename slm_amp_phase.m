function [ slm_mask ] = slm_amp_phase( field, slm_period, x_blazed_flag)
%SLM_AMP_PHASE Summary of this function goes here
%   Detailed explanation goes here
    amp = abs(field);
    phase = angle(field);
    norm_amp = amp / max(amp(:));
    m_func = 1 + inv_sinc(norm_amp, 1000)/pi;
    f_func = phase - pi*m_func;
    [X, Y] = meshgrid(1:size(f_func,1), 1:size(f_func,2));
%     if x_blazed_flag
%         slm_mask = m_func .* mod(f_func + 2*pi*X/slm_period, 2*pi);
%     else
%         slm_mask = m_func .* mod(f_func + 2*pi*Y/slm_period, 2*pi);
%     end    
    if false
        m_func_mask = double(imfill(m_func > 0.5, round(size(field)/2)));
%         m_func = 1;
%         m_func = m_func.*m_func_mask;
        m_func = m_func_mask;
        f_func = phase;
    end
    slm_mask = m_func .* mod(f_func, 2*pi);
end

