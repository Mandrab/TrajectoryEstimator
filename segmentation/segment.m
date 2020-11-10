function mask = segment(image)
% Segment the image in order to extract a mask of a ball
% Input:
%   image: in which search the ball
% Output:
%   mask: of the ball or NaN if the ball has not been found TODO

    % extract a dirt ball mask through thresholding
    raw_mask = binarize(image);
    %imshow(image);

    % improve mask quality (more homogeneous, trying to remove noise)
    mask = homogenizes(raw_mask);
    imshow(mask);

end
