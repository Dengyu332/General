function data_ds = bml_rs_1000(dataoi)

% This function follows bml_unpowerline. Takes in unpowerlined data and
% resampled to 1khz. Call ft_resampledata (modified version)

cfg=[]; cfg.resamplefs = 6000;
cfg.feedback='no';
mp=ft_resampledata(cfg,dataoi);

cfg=[]; cfg.resamplefs = 1000;
cfg.feedback='no';
data_ds=ft_resampledata(cfg,mp);