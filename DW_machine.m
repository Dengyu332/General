% select machine

Choice=input('Please specify mac(1) or linux(2):');

if Choice ==2
        dionysis = '/media/dionysis/';
        dropbox = '/home/Dengyu/Dropbox (Brain Modulation Lab)/';


elseif Choice == 1;
    dionysis = '/Volumes/Nexus/';
    
    dropbox = '/Users/Dengyu/Dropbox (Brain Modulation Lab)/';
  
else %% to be modified

    
    docDir = '\\136.142.16.9\Nexus\Users\pwjones\docs\ET-PD project';
    codeDir = '\\136.142.16.9\Nexus\Users\pwjones\code\SpeechPilotPD-ET';
    datadir='\\136.142.16.9\Nexus\Electrophysiology_Data\DBS_Intraop_Recordings';
    figDir = '\\136.142.16.9\Nexus\Users\dwang\ET-PD\Results\Figures';
    savedDataDir = '\\136.142.16.9\Nexus\Users\dwang\ET-PD\datafiles';
end
