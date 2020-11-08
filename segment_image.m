function [BW,maskedImage] = segment_image(RGB, MASK)

    % Convert RGB image into L*a*b* color space.
    X = rgb2lab(RGB);

    % Create empty mask.
    BW = false(size(X,1),size(X,2));

    % Load Mask
    BW = MASK;

    % Fill holes
    BW = imfill(BW, 'holes');

    % Open mask with disk
    radius = 2;
    decomposition = 8;
    se = strel('disk', radius, decomposition);
    BW = imopen(BW, se);

    % Close mask with disk
    radius = 25;
    decomposition = 0;
    se = strel('disk', radius, decomposition);
    BW = imclose(BW, se);

    % Create masked image.
    maskedImage = RGB;
    maskedImage(repmat(~BW,[1 1 3])) = 0;
end