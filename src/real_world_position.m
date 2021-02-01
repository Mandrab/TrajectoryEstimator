function coordinate = real_world_position(position, radius, ...
        camera_model, ball_size)
% From ball position in the image calculate its position in the 'world'
% Input:
%   position: the position in the image
%   radius: of the ball in the image
%   camera_model: model of the calibrated camera
%   ball_size: size of the ball in the real world
% Output:
%   coordinate: of the ball in the real world

    % range of x and y in tuple
    xy_range = 1:2;

    % get intrinsic matrix from camera model
    k = camera_model.Intrinsics.IntrinsicMatrix;

    % get world coordinate from homogeneous form
    coordinate = k \ [position 1]';

    % get x focal lenght from camera matrix
    fx = camera_model.Intrinsics.FocalLength(1);

    % calculate distance based on ball size in image and reality
    z = fx * ball_size / radius;

    % reshape coordinate in form (x,y,z) world
    coordinate = [z .* coordinate(xy_range); z];
end
