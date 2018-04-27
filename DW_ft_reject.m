% add ft and bml function to path
ft_defaults
bml_defaults




cfg=[];
cfg.method='summary';
cfg.channel='ecog*';
ft_rejectvisual(cfg,D)


cfg=[];
cfg.hpfilter = 'yes';
cfg.hpfreq = 30;
D_hp = ft_preprocessing(cfg,D);

cfg=[];
cfg.method='summary';
cfg.channel='ecog*';
ft_rejectvisual(cfg,D_hp)


cfg=[];
cfg.method='trial';
cfg.channel='ecog*';
cfg.trials = [148,149,150];
ft_rejectvisual(cfg,D_hp)



