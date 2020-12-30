function [ slm_mask ] = slm_amp_phase( field)
%SLM_AMP_PHASE Summary of this function goes here
%   Detailed explanation goes here
    amp = abs(field);
    phase = angle(field);
    norm_amp = amp / max(amp(:));
    m_func = 1 + inv_sinc(norm_amp, 1000)/pi;
    f_func = phase - pi*m_func;
    slm_mask = m_func .* mod(f_func, 2*pi);
end

