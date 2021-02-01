function plot_trajectory(image, points)
% Graphically plot the trajectory of the ball
% Input:
%   image: to show and on which draw the trajectory
%   points: of the trajectory to draw

    % marker shape type
    marker_type = 'FilledCircle';

    % marker size in the image
    marker_size = 20;

    % number of information needed to draw the marker (x,y,size)
    marker_data_size = 3;

    % index of columns
    x_column = 1;

    % create a vector containing x,y coordinate (on image) and circle size
    positions = zeros(length(points), marker_data_size);
    for idx = 1:length(points(:, x_column))
        positions(idx,:) = [points(idx,:) marker_size];
    end

    % inserts all the circles 'marker' in the image in specified positions
    image = insertShape(image, marker_type, positions);
    imshow(image);
end
