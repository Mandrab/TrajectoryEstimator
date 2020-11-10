function mask = homogenizes(mask)
% Trasform the mask making it more homogeneous and removing noise throught
%   use of morphological operations
% Input:
%   image: from which remove noise and make more homogeneous
% Output:
%   mask: the image without noise and holes

    % fill holes
    mask = imfill(mask, 'holes');

    % Open mask with disk
    radius = 3;
    decomposition = 0;
    se = strel('disk', radius, decomposition);
    mask = imopen(mask, se);

    % Close mask with disk
    radius = 10;
    decomposition = 0;
    se = strel('disk', radius, decomposition);
    mask = imclose(mask, se);

end
