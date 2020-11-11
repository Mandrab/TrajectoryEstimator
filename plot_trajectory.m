function plot_trajectory(image, points)
% Graphically plot the trajectory of the ball
% Input:
%   image: to show and on which draw the trajectory
%   points: of the trajectory to draw

    % create a vector containing x,y coordinate (on image) and circle size
    positions = zeros(length(points), 3);
    for idx = 1:length(points(:,1))
        positions(idx,:) = [points(idx,:) 20];
    end

    % inserts all the circles 'marker' in the image in specified positions
    image = insertShape(image, 'FilledCircle', positions);
    imshow(image);
end
