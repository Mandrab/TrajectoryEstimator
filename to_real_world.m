function coordinate = to_real_world(position, radius, camera_model, ball_size)
    disp(camera_model)
    k = camera_model.Intrinsics.IntrinsicMatrix;
    coordinate = k \ [position 1]';
    
    fx = camera_model.Intrinsics.FocalLength(1);
    z = fx * radius / ball_size;
    aa = coordinate(1:2);
    coordinate = [coordinate(1:2)' z]';
end