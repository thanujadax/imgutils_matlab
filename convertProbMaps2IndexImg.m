function convertProbMaps2IndexImg(inputDir,outputDir,inputFmt,thresh)
% threshold the probability map at given level and create index image

% inputDir = '/home/thanuja/RESULTS/isbi2012/001/png';
% outputDir = '/home/thanuja/RESULTS/isbi2012/001/bw';


% read list of png files to convert to bw
% fmt = 'png';

inputFileList = dir(fullfile(inputDir,strcat('*.',inputFmt)));
for i=1:length(inputFileList)
    imIn = double(imread(fullfile(inputDir,inputFileList(i).name),inputFmt));
    imIn = imIn./max(max(imIn));
    imIn = im2bw(imIn,thresh);
    indIm = convertBW2IndexImage(imIn);
    
    indIm = indIm./(max(max(indIm)));
    outputFileName = fullfile(outputDir,inputFileList(i).name);
    imwrite(indIm,outputFileName);
end