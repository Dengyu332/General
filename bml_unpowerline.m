function dataoi_up = bml_unpowerline(dataoi_raw)

% This function follows bml_loaded_epoch. Takes in raw data, remove DC offset and then unpowerline
% contains a local function unpowerline2, which is the exact copy of
% Ahmad's unpowerline2 function

% returns data that is DC-removed and unpowerlined

dataoi_up = dataoi_raw;

for sub_session = 1:length(dataoi_raw.trial);
    temp = dataoi_raw.trial{sub_session}';
    temp=bsxfun(@minus,temp,mean(temp,1));
    temp_up = unpowerline2(temp,dataoi_raw.hdr.Fs,1);
    dataoi_up.trial{sub_session} = temp_up';
    
end

function [dataout]=unpowerline2(datain,sr,bandwidth)
%[data]=unpowerline(data,sr,bandwidth)
%
%
%accepts vector or 2D matrix of time-series [time,channel] to notch filter
%in both forward and reverse direction at 60Hz and all harmonics up to the
%nyquist frequency; 
%
%data is sampled at 'sr' samples per second (default=1000 Hz);
%
%individual notches are n*60Hz +/- bandwidth (in Hz; defaul=1 Hz);
%
%
%TAW_070914

%initialize variables
[r,~]=size(datain);
if ~exist('sr','var')
    sr=1e3;
end
if ~exist('bandwidth','var')
    bandwidth=1;
end
isr=1/sr;
center=60:60:floor(sr/2);
bands=[center-bandwidth;center+bandwidth]';
time=isr:isr:r*isr;
ts=timeseries(datain,time);
m=mean(datain,1);
%forward
ts=idealfilter(ts,bands,'notch');

%reverse
ts.data=ts.data(end:-1:1,:);
ts=idealfilter(ts,bands,'notch');

%flip
dataout=ts.data(end:-1:1,:);
dataout=bsxfun(@plus,dataout,m);