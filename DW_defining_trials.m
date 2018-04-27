%%This script is used to cut data in sessions to data in trials.


bml_defaults
ft_defaults

cue = bml_annot_read('annot/cue_presentation.txt');
coding = bml_annot_read('annot/coding.txt');



epoch1=join(...
    coding(:,{'offset_syl3','trial_id','session_id'}),...
    cue(:,{'stimulus_starts','trial_id','session_id'}),...
    'keys',{'session_id','trial_id'});
epoch1.starts = epoch1.stimulus_starts;
epoch1.ends = epoch1.offset_syl3;
epoch1 = bml_annot_table(epoch1);
epoch1 = bml_annot_extend(epoch1,1,1);

cfg=[];
cfg.epoch = epoch1;
cfg.t0='stimulus_starts';
D1=bml_redefinetrial(cfg,D);





