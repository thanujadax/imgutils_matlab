function imOut = growCCs(imIn,inds)

% grows the connected components in imIn by 1 pixel in a 4 neighborhood
% input image should be a binarized 2D matrix
% if inds=1, the output image will be an index image.
% if inds=0, the output image will be a binary image

cc = bwconncomp(imIn);
[sizeR,sizeC] = size(imIn);
imOut = zeros(sizeR,sizeC);

if(inds>0)
    for i=1:length(cc.PixelIdxList)
        % for each cc get the expanded 4nh pixel set and set a unique ID i
        nh4pixels = get4nhpixels(cc.PixelIdxList{i},sizeR,sizeC);
        imOut(nh4pixels) = i;
    end
else
    for i=1:length(cc.PixelIdxList)
        % for each cc get the expanded 4nh pixel set and set to 1
        nh4pixels = get4nhpixels(cc.PixelIdxList{i},sizeR,sizeC);
        imOut(nh4pixels) = 1;
    end
end
% normalize imOut
imOut = imOut./(max(max(imOut)));