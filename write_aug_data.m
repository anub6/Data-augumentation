function []= write_aug_data(voice_samp,fun_var,file_pre,write_path)
cd(write_path)
%Check the labels of speakers match before copying augumented data
%Folders for the speakers made in the beginning vs speaker_names in
%voice_samp
spn= dir; count=1;
for i=1:max(size(spn))
    if min(size(find(spn(i).name=='.')))==0%avoiding .,..
        if spn(i).name == voice_samp(count).speaker_name
            %Require pwd here to be write_path since checking against
            %speakers
            cd (fullfile(pwd,voice_samp(count).speaker_name))
            if exist(file_pre,'file')== 0  %Checking for previous versions
                mkdir(file_pre)
            else
                spn2= fullfile(pwd,file_pre);
                cd(spn2)
                %Write the modified files for that function
                temp_struct= voice_samp(count).audfiles;
                applyfunwrite(temp_struct,fun_var,spn2)
            end
            count= count+1;
            cd(write_path)
        end
    end
end
                
end