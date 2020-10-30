%%
%sampling frequency is assumed 16KHZ everywhere in all speaker sessions
%Make sure the augumentation toolbox is part of your MATLAB search path
cd 'C:\Users\Owner\Desktop\thesis\TIMIT\TRAIN'
spn= dir;
main_d= pwd;
cd ..\.
cd Augumented_data
data_sav= pwd;
voice_samp= struct('speaker_name',{},'all_files',{});speaker_num=0;
for i= 1:max(size(spn))
    if spn(i).isdir 
        if min(size(find(spn(i).name=='.')))==0
            if exist(spn(i).name, 'file')==0 %Put only so we don't get repeatition while testing
                mkdir (pwd,spn(i).name) 
                %get information of all speakers
            end
            speaker_num= speaker_num+1;
            voice_samp(speaker_num).speaker_name= spn(i).name;
        end
    end
end
%%
%choosing how much of data you wanna augument
%Assume here that each speaker has multiple sessions so we first combine
%all recordings
per= 0.6; 
for i=1:speaker_num
    temp_s= voice_samp(i).speaker_name;
    cd(fullfile(main_d,temp_s))
    voice_samp(i).all_files= load_vc(pwd);    
end
clear i temp_s spn
voice_samp= select_data_aug(voice_samp,per);
%For acessing one particular file
%voice_samp(speaker_num).audfiles(sound_samp).arr

%%
%Making new folders and writing augumented files
%New files for functions noise,pitch shift,apply gain, apply impluse
%response with respective numbers
fun_var= input('Which function do you wanna apply on the dataset');
while fun_var ~= 0
    if fun_var==1 
        file_pre= 'noise';
    elseif fun_var==2
        file_pre= 'pitch_shift';
    elseif fun_var == 3
        file_pre= 'gain';
    elseif file_pre == 4
        file_pre= 'impulse';
    end
        write_aug_data(voice_samp,fun_var,file_pre,data_sav);
        fun_var= input('Press next function number 1/2/3/4 for more functions or 0 to finish');
end
cd 'C:\Users\Owner\Desktop\thesis\data Augumentattion\MATLAB code'