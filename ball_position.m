function [coordinates, radius] = ball_position(image)
    %%%%%%%%%%%%%%%%%%%%%%%%% Segmenting the ball %%%%%%%%%%%%%%%%%%%%%%%%%

    % thresholding to extract a first approximation of a ball's 'mask' 
    raw_mask = create_mask(image);
    %imshow(raw_mask);

    % obtain a 'better quality' (more omogeneous) mask for the ball
    mask = segment_image(image, raw_mask);
    %imshow(mask);

    %%%%%%%%%%%%%%% Calculating the ball parameters (image) %%%%%%%%%%%%%%%

    %perim = bwperim(bw_mask);
    %perim = sum(sum(perim));
    
    %area = bwarea(bw_mask);
    %r = sqrt(area/pi)
    
    properties = regionprops(mask, {'Centroid', 'EquivDiameter'});
    coordinates = properties.Centroid;
    radius = properties.EquivDiameter / 2;
end