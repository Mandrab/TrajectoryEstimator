function [BW,maskedRGBImage] = create_mask(RGB)

    % Convert RGB image to chosen color space
    I = rgb2hsv(RGB);

    % Define thresholds for channel 1 based on histogram settings
    channel1Min = 0.935;
    channel1Max = 0.061;

    % Define thresholds for channel 2 based on histogram settings
    channel2Min = 0.585;
    channel2Max = 1.000;

    % Define thresholds for channel 3 based on histogram settings
    channel3Min = 0.230;
    channel3Max = 1.000;

    % Create mask based on chosen histogram thresholds
    sliderBW = ( (I(:,:,1) >= channel1Min) | (I(:,:,1) <= channel1Max) ) & ...
        (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
        (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
    BW = sliderBW;

    % Initialize output masked image based on input image.
    maskedRGBImage = RGB;

    % Set background pixels where BW is false to zero.
    maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end
