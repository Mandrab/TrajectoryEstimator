function camera_model = main(images_folder, trajectory_folder, ...
        ball_size, camera_model, chessboard_square_size)
% Given a calibration dataset (or a pre-computed camera_model) and a
%   sequence of images predict the trajectory of the ball
% Input:
%   images_folder: main folder in which reside the datasets (calibration
%       and trajectory). E.g.: ".", "./resources/images", ...
%   trajectory_folder: folder in which trajectory images reside. E.g.:
%       "trajectory"
%   ball_size: size of the ball thrown
%   camera_model: this parameter can be both a string both a pre-calculated
%       camera model. In the first case, it represents the folder in which
%       calibration images reside. E.g.: "calibration"
%   chessboard_square_size: size of the checkboard square used in
%       calibration. If the 'camera_model' is pre-calculated (the parameter
%       is a string), this parameter can be NaN.
% Output:
%   camera_model: the camera_model used/calculated during the prediction
%       (useful to repeat the test)

    % if passed parameter is a string, use it as folder name for
    % calibration images
    if isstring(camera_model)

        % create a pattern to match images files in folder (calibration)
        images = dir(images_folder + "/" + camera_model + "/" + "*.png");
        camera_model = calibration(images, chessboard_square_size);
    end

    % create a pattern to match images files in folder (trajectory)
    images = dir(images_folder + "/" + trajectory_folder + "/" + "*.png");

    % create a data array
    balls_data = [];

    % iterate every image in folder
    for idx = 1:length(images)

        % load image
        image_name = images(idx).folder + "/" + images(idx).name;
        image = imread(image_name);

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % SUB-TASK 1 & 2: Segmenting + ball parameters (image)
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        % search ball position and radius in image
        [ball.position, ball.radius] = ball_data(image);

        % make trajectory prediction if the ball is found
        if not(isnan(ball.position))

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % SUB-TASK 3: ball parameters (world)
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            % get real world position
            ball.world_position = real_world_position( ...
                ball.position, ball.radius, camera_model, ball_size);

            % add ball data to set
            balls_data = [balls_data ball];

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % SUB-TASK 4: Trajectory estimation and prediction
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            % calculate trajectory based on already loaded data
            trajectory = calculate_trajectory(balls_data);

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % SUB-TASK 5: Results visualization
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            % plot calculated trajectory
            plot_trajectory(image, trajectory);
        end
    end
end
