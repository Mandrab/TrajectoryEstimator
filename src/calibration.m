function camera_params = calibration(images_files, pattern_size)
% Calibrate the camera through use of passed calibration images
% Input:
%   images_files: files of the calibration images
%   pattern_size: size of a square of the chessboard
% Output:
%   camera_params: parameters of the camera

    images_paths = string(missing);
    for idx = 1:length(images_files)
        image_file = images_files(idx);
        images_paths(idx) = image_file.folder + "/" + image_file.name;
    end

    % detect checkerboards in images
    [image_points, board_size, images_used] = ...
        detectCheckerboardPoints(images_paths);
    images_paths = images_paths(images_used);

    % read the first image to obtain image size
    original_image = imread(images_paths(1));
    [mrows, ncols, ~] = size(original_image);

    % generate world coordinates of the corners of the squares
    world_points = generateCheckerboardPoints(board_size, pattern_size);

    % calibrate the camera
    [camera_params, ~, ~] = estimateCameraParameters( ...
        image_points, world_points, 'EstimateSkew', false, ...
        'EstimateTangentialDistortion', false, ...
        'NumRadialDistortionCoefficients', 3, 'WorldUnits', ...
        'millimeters', 'InitialIntrinsicMatrix', [], ...
        'InitialRadialDistortion', [], 'ImageSize', [mrows, ncols] ...
    );
end
