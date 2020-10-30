# Data-augumentation
The following document outlines the main information for using the functions in this folder to generate files
for data augumentation.
* NEED MATLAB 2020a or above*
The toolbox used for the implementions of the functions and its documentation is available at:
https://arxiv.org/ftp/arxiv/papers/1912/1912.05472.pdf
The actual files used can be downloaded from:
https://github.com/LorisNanni/Audiogmenter

Make sure that the folder that holds the folder Audiogmenter23Aprile.part1.rar is added to the MATLAB search path
Since the files call the functions directly.

The main function to be used is :
Test2_file.m 
The first directory path is the folder the one that holds the folders with speaker folders. It is assumed
that every speaker has had multiple seassions and multiple clips in one session.
ALSO Assumed that all signals sessions are sampled at 16KHz and the augumented data is written at same frequency.
We can select the percentage of data to be augumented by setting the variable per in this file. If all the data is to 
be augumented use per= 1;
Select the kind of augumentation to be performed when prompted by Test2_file.m
1- Noise  (SNR default set to min=0.2 max= 1)
2- Pitch Shift  (Semitone shift min = 1, max= 3)
3- Gain (min amplitude gain= 1, max=4)
4- Impulse Response( Mimics background noise) (Choice of backgrounds available)
0- If you have performed all augumentations and want to end the program

The details of the changing the SNR levels, Pitch Shifts, Gains and impulse response can be changed from file
applyfunwrite.m

The details of the functions itself can be found in the aforementioned toolb
