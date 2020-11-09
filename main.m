function main(images_folder, ball_size)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Constants %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    CALIBRATION_FOLDER = images_folder + "calibration_images/";
    TRAJECTORY_FOLDER = images_folder + "trajectory_1/";

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Setup %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % create a pattern to match images files in folder
    images = dir(CALIBRATION_FOLDER + "*.png");
    camera_model = calibration(images, 40);

    %%%%%%%%%%%%%%%%%%%%%%%% Trajectory Estimation %%%%%%%%%%%%%%%%%%%%%%%%

    % create a pattern to match images files in folder
    images = dir(TRAJECTORY_FOLDER + "*.png");

    % create a data array
    balls_data = [];

    for idx = 1:length(images)
        image_name = images(idx).folder + "/" + images(idx).name;
        image = imread(image_name);

        % find ball position in image
        [balls_data(idx).image_position, balls_data(idx).image_radius] =...
            ball_position(image);
        
        % TODO calculate ball speed
        %balls_data(idx).speed = ???
        
        % TODO get real world position
        balls_data(idx).world_position = to_real_world(...
            balls_data(idx).image_position, ...
            balls_data(idx).image_radius, ...
            camera_model, ...
            ball_size ...
        );
        
        % TODO calculate trajectory
        
        % TODO plot result trajectory
    end
end
