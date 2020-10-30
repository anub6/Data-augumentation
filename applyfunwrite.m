function []= applyfunwrite(tempstruct,fun_var,write_path)
num_files= max(size(tempstruct));
cd(write_path)
for i= 1:num_files
    audio_in=tempstruct(i);
     if fun_var==1 
        file_pre= 'noise';
        [audio_out,fs]= applyNoise(audio_in.arr,0.2,1,16000);
         %Can change third and second arguements for SNR levels aurguments 
        s= strcat(file_pre,num2str(i),'.wav');
        audiowrite(s,audio_out,fs);
    elseif fun_var==2
        file_pre= 'pitch_shift';
        [audio_out,fs]= applyPitchShift(audio_in.arr,1,3,16000);
        %change the second and third arguement for semitone 
        s= strcat(file_pre,num2str(i),'.wav');
        fs= cell2mat(fs);
        audiowrite(s,audio_out,fs);
    elseif fun_var == 3
        file_pre= 'gain';
        [audio_out,fs]= applyGain(audio_in.arr,1,4,16000);
        %change the second and third arguement to adjust gain levels in dB
        %(min, max)
        s= strcat(file_pre,num2str(i),'.wav');
        audiowrite(s,audio_out,fs);
    elseif fun_var == 4
        file_pre= 'impulse';
        %This imitates background noises of various backgrounds
        x= input( [ ' What kind of background noise do you want to add'   ...
                    '1-great hall, 2- classroom , 3- Octogon1 '...
                    '4-GoogleNexusOneFrontSpeaker, 5-GoogleNexusOneFrontMic' ...
                    '6-VinylPlayer1960']);
                %If anything else is entered it adds great hall
                [audio_out, fs]= applyImpulseResponse(audio_in.arr,x,16000);
                s= strcat(file_pre,num2str(i),'.wav');
                audio_write(s,audio_out,fs);
    end
end