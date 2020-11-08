function main(image_folder)

    % create a pattern to match images files in folder
    images = dir(image_folder + "*.png");

    for idx = 1:length(images)
        image_name = image_folder + images(idx).name;
        image = imread(image_name);

        % find real world ball position
        position = ball_position(image);
    end
end