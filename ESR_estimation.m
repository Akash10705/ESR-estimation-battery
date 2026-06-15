function ESR = ESR_Estimator(V_adc, Gain_Amp)
persistent ESR_filt
if isempty(ESR_filt)
    ESR_filt = 0;
end
I_CAP_STEP = 0.3;
K = 10;
ESR_inst = (K * abs(V_adc)) / (Gain_Amp * I_CAP_STEP);
alpha = 0.05;
ESR_filt = alpha * ESR_inst + (1 - alpha) * ESR_filt;
ESR = ESR_filt;
End

%upload this in the Matlab Function block for ESR scaling and estimation
