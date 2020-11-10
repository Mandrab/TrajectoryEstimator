function [coordinates, radius] = ball_data(image)
% Scan the image to find and extract info about the ball like position and
%   radius
% Input:
%   image: in which resides the ball from which obtain data
% Output:
%   coordinates: of the ball or NaN if there is no ball in the image
%   radius: of the ball or NaN if there is no ball in the image

    % minimum area that must be present in image to be considered a ball
    minimum_area = 0;

    % add the path of the functions to use
    addpath('./segmentation/');

    % get the mask of the ball from the image
    mask = segment(image);

    % check area of the elements in the mask
    area = bwarea(mask);

    if area > minimum_area
        % obtain data about the ball
        properties = regionprops(mask, {'Centroid', 'EquivDiameter'});

        % set return variables
        coordinates = properties.Centroid;
        diameter = properties.EquivDiameter;
        radius = diameter / 2;
    else
        % no ball can be found in the image
        coordinates = NaN;
        radius = NaN;
    end
end
