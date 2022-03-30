function out = quantization( input, bits)
%  This routine takes a signal and generates a quantized version of the 
%   signal.  Quantization level is determined by the bits argument assuming
%   that the signal is normalized to the full range of the quantizer.
% Inut arguments 
%   input    input signal
%   bts     specifies quajntization level in terms of the number of bits.
%            (must be between 3 and 16)
if bits < 3 || bits > 16
    disp('Error: bits argument must be between 3 and 16')
    return
end
scale = 2^bits/(max(input));   % Find scale to normalize signal
out = round(input*scale);    % Quantize scaled signal
out = out/scale;             % Re-normalize signal






