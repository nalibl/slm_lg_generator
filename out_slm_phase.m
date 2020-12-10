function [ mask ] = out_slm_phase( phase_mask )
%OUT_SLM_PHASE Summary of this function goes here
%   Detailed explanation goes here
    bit_depth = 8;
    max_int = 2^bit_depth - 1;
    total_phase_pos_mod = mod(phase_mask, 2*pi);
    mask = uint8(total_phase_pos_mod / (2*pi) * max_int);
end

