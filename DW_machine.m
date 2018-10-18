% select machine

Choice=input('Please specify mac(1), linux(2) or Windows(3):');

if Choice ==2
        dionysis = '/media/dionysis/';
        dropbox = '/home/Dengyu/Dropbox (Brain Modulation Lab)/Functions/Dengyu/';


elseif Choice == 1;
    dionysis = '/Volumes/Nexus/';
    
    dropbox = '/Users/Dengyu/Dropbox (Brain Modulation Lab)/Functions/Dengyu/';
  
else % windows

    dropbox = 'E:\LeadDBSpractice\Dengyu\git\';
    dionysis = '\\136.142.16.9\Nexus\';
    %codeDir = '\\136.142.16.9\Nexus\Users\pwjones\code\SpeechPilotPD-ET';
    %datadir='\\136.142.16.9\Nexus\Electrophysiology_Data\DBS_Intraop_Recordings';
    %figDir = '\\136.142.16.9\Nexus\Users\dwang\ET-PD\Results\Figures';
    %savedDataDir = '\\136.142.16.9\Nexus\Users\dwang\ET-PD\datafiles';
end
