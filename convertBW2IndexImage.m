function indexIm = convertBW2IndexImage(imIn)

% get connected components
cc = bwconncomp(imIn);
% assign unique IDs for each CC
indexIm = zeros(size(imIn));

for i=1:length(cc.PixelIdxList)
    indexIm(cc.PixelIdxList{i}) = i;
end