function voice_sampf = select_data_aug(voice_samp,per)
speaker_num= max(size(voice_samp));
voice_sampf= struct('speaker_name',{},'audfiles',{});  % holding new files with new percentage files, randomanized
for i= 1:speaker_num
   voice_sampf(i).speaker_name= voice_samp(i).speaker_name; 
   %Now we randomly select the files from each speaker set regardless of
   %session
   temp_struct= voice_samp(i).all_files;
   %Pass this temp_struct to select p percentage of files and assign to
   %final structure
   voice_sampf(i).audfiles= randselec(temp_struct,per);
end