% read all images
inputDir = '/home/thanuja/RESULTS/cvpr/TED/cnn_stc';
type = 'png';
inputFileList = dir(fullfile(inputDir,strcat('*.',type)));
% for each image, create a subdirectory and copy the image there
for i=1:length(inputFileList)
    filename = strsplit(inputFileList(i).name,'.');
    imgName = filename{1};
    checkAndCreateSubDir(inputDir,imgName);
    source = fullfile(inputDir,inputFileList(i).name);
    dest = fullfile(inputDir,imgName,inputFileList(i).name);
    movefile(source,dest)
end