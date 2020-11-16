function mask = homogenizes(mask)
% Trasform the mask making it more homogeneous and removing noise throught
%   use of morphological operations
% Input:
%   image: from which remove noise and make more homogeneous
% Output:
%   mask: the image without noise and holes

    % fill holes
    mask = imfill(mask, 'holes');

    % open mask with disk
    radius = 5;
    decomposition = 0;

    % create a morphological structuring element
    se = strel('disk', radius, decomposition);

    % execute opening operation
    mask = imopen(mask, se);

    % close mask with disk
    radius = 10;
    decomposition = 0;

    % create a morphological structuring element
    se = strel('disk', radius, decomposition);

    %execute closing operation
    mask = imclose(mask, se);

end
