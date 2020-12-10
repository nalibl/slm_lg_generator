function send_slm_image( ImageData )
%SEND_SLM_IMAGE Summary of this function goes here
%   Detailed explanation goes here
def_path = 'C:\Users\ady-lab\Desktop\slm\m_funcs';
addpath([def_path '\..']);
slm_lut = BNS_ReadLUTFile([def_path '\..\LUT_Files\slm4309_at1550_P8.lut']);     % Reading the LUT file
handles.slm_lut = slm_lut;
handles.apply_optimization = false;
FrameNum = 1;
BNS_LoadImageFrame(FrameNum, ImageData, handles ); % image load to the PCI card memory
BNS_SendImageFrameToSLM(FrameNum);   
end