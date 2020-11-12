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

    k = camera_model.Intrinsics.IntrinsicMatrix;
    coordinate = k \ [position 1]';

    fx = camera_model.Intrinsics.FocalLength(1);
    z = fx * radius / ball_size;
    coordinate = [coordinate(1:2); z'];
end
