function plot_trajectory(image, points)
    % create a vector containing x,y coordinate (on image) and circle size
    positions = zeros(length(points), 3);
    for idx = 1:length(points(:,1))
        positions(idx,:) = [points(idx,:) 20];
    end
    
    % inserts all the circles 'marker' in the image in specified positions
    image = insertShape(image, 'FilledCircle', positions);
    imshow(image);
end