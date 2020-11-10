function plot_trajectory(image, balls)
    positions = zeros(length(balls), 3);
    for idx = 1:length(balls)
        positions(idx,:) = [balls(idx).image_position 10];
    end
    image = insertShape(image, 'FilledCircle', positions);
    imshow(image);
end