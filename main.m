function main(images_folder, camera_model, ball_size)

    % create a pattern to match images files in folder
    images = dir(images_folder + "*.png");
    
    % create a data array
    balls_data = [];

    for idx = 1:length(images)
        image_name = images_folder + images(idx).name;
        image = imread(image_name);

        % find ball position in image
        balls_data(idx).image_position = ball_position(image);
        
        % TODO calculate ball speed
        %balls_data(idx).speed = ???
        
        % TODO get real world position
        balls_data(idx).world_position = to_real_world(...
            balls_data(idx).image_position, ...
            camera_model, ...
            ball_size ...
        );
        
        % TODO calculate trajectory
        
        % TODO plot result trajectory
    end
end
