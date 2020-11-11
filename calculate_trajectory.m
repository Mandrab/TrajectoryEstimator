function points = calculate_trajectory(balls)
% Predict the trajectory of the ball
% Input:
%   balls: a collection containing the ball's positions and radius
% Output:
%   points: the visited and predicted points of the trajectory of the ball

    % extracts 2d points TODO maybe move outside
    points = zeros(length(balls), 2);
    for idx = 1:length(balls)
        points(idx, :) = balls(idx).image_position;
    end
    x = points(:, 1);
    y = points(:, 2);
    
    % fit the points with a parabola
    f0 = polyfit(x, y, 3);
    
    % predict next points
    x1 = linspace(0, 1080, 100); %  TODO image size
    f1 = polyval(f0, x1);
    
    % generate balls 'track' as output
    %points = [x1' f1'];
    points = [x1(length(x):end)' f1(length(y):end)'];
    
    % drops already passed points from prediction
    if x(1) > x(end)
        mask = points(:,1) < x(end);
    else
        mask = points(:,1) > x(end);
    end
    points = points(mask,:);
    points = [x y; points];
end
