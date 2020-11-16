function points = calculate_trajectory(balls, area_size)
% Predict the trajectory of the ball
% Input:
%   balls: a collection containing the ball's positions and radius
%   area_size: size of the area in which calculate the trajectory
% Output:
%   points: the visited and predicted points of the trajectory of the ball

    % area starting point
    starting_point = 0;

    % number to point to evaluate in the range
    point_in_range = 100;

    % degree of polinomial fit
    polinomial_degree = 3;

    % index of columns
    x_column = 1;
    y_column = 2;

    % width idx in the area tuple
    area_width_idx = 1;

    % extracts 2d points
    points = zeros(length(balls), y_column);
    for idx = 1:length(balls)
        points(idx, :) = balls(idx).position;
    end
    x = points(:, x_column);
    y = points(:, y_column);

    % fit the points with a parabola
    f0 = polyfit(x, y, polinomial_degree);

    % predict next points
    x1 = linspace(starting_point, area_size(area_width_idx), point_in_range);
    f1 = polyval(f0, x1);

    % generate balls 'track' as output
    points = [x1(length(x):end)' f1(length(y):end)'];

    % drops already passed points from prediction
    if x(1) > x(end)
        mask = points(:, x_column) < x(end);
    else
        mask = points(:, x_column) > x(end);
    end
    points = points(mask,:);
    points = [x y; points];
end
