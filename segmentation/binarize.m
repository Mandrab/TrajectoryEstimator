function bw = binarize(image)
% Detect components of the image that respect the thresholds (hue,
%   saturation, value/brightness)
% Input:
%   image: to binarize with thresholds
% Output:
%   bw: binarized (bw) image

    % convert image into HSV color space
    image = rgb2hsv(image);

    % define thresholds for channel 1 based on histogram settings
    hueMin = 0.061;
    hueMax = 0.935;

    % define thresholds for channel 2 based on histogram settings
    saturationThreshold = 0.585;

    % define thresholds for channel 3 based on histogram settings
    valueThreshold = 0.230;

    % create mask based on chosen histogram thresholds
    bw = (image(:,:,1) <= hueMin | image(:,:,1) >= hueMax) ...
        & image(:,:,2) >= saturationThreshold ...
        & image(:,:,3) >= valueThreshold;

end
