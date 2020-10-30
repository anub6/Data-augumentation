%function to load all of the clips of a speaker and select data to augument
function struct_f= load_vc(speak_path)
spn= dir(speak_path);
struct_f= struct('arr',{}); count= 1;
for i= 1:max(size(spn))
    if spn(i).isdir 
        if min(size(find(spn(i).name=='.')))==0  %To avoiod the directories ., .. that show in windows
            temp_path= spn(i).name;
            cd(fullfile(speak_path,temp_path))
            spn1= dir(pwd);
            for j= 1:max(size(spn1))
                temp_ext=split(spn1(j).name, "."); %split name in two
                if string(temp_ext(max(size(temp_ext))))== 'wav' && min(size(find(spn(i).name=='.')))==0
                    struct_f(count).arr= importdata(fullfile(pwd,spn1(j).name)); %Load the aufio file
                    count= count+1;
                end
            end
        end
    end
end

            
end