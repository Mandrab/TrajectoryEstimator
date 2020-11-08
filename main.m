function main(image_folder)

    images = dir(image_folder + "*.png");           % create a pattern to match images files
    for idx = 1:length(images)
        image_name = image_folder + images(idx).name;
        image = imread(image_name);
        
        position = ball_position(image);
    end
end