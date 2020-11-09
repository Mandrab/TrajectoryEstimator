function cameraParams = calibration(images_files, checkboard_size)

    images_paths = string(missing);
    for idx = 1:length(images_files)
        image_file = images_files(idx);
        images_paths(idx) = image_file.folder + "/" + image_file.name;
    end

    % Detect checkerboards in images
    [imagePoints, boardSize, imagesUsed] = detectCheckerboardPoints(images_paths);
    images_paths = images_paths(imagesUsed);

    % Read the first image to obtain image size
    originalImage = imread(images_paths(1));
    [mrows, ncols, ~] = size(originalImage);

    % Generate world coordinates of the corners of the squares
    worldPoints = generateCheckerboardPoints(boardSize, checkboard_size);

    % Calibrate the camera
    [cameraParams, ~, estimationErrors] = estimateCameraParameters( ...
        imagePoints, worldPoints, 'EstimateSkew', false, ...
        'EstimateTangentialDistortion', false, ...
        'NumRadialDistortionCoefficients', 3, 'WorldUnits', ...
        'millimeters', 'InitialIntrinsicMatrix', [], ...
        'InitialRadialDistortion', [], 'ImageSize', [mrows, ncols] ...
    );

    % Display parameter estimation errors
    displayErrors(estimationErrors, cameraParams);
end