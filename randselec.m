function rand_struct= randselec(instruct,per)
num_ses= max(size(instruct));
new_num_ses= per*num_ses;
rand_struct= struct('arr',{});
rand_index= randi( [1 num_ses],1,new_num_ses);
for i=1: new_num_ses
    temp_struct= instruct(rand_index(i)).arr;
    rand_struct(i).arr= temp_struct.data;
end    
end