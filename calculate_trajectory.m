function [outputArg1,outputArg2] = calculate_trajectory(balls)
    x = [];
    y = [];
    for idx = 1:length(balls)
        x(idx) = balls(idx).image_position(1);
        y(idx) = balls(idx).image_position(2);
        fprintf("x %d y %d\n", x(idx), y(idx));
    end
    p = polyfit(x,y,2);
    %plot(x,polyval(p,x));
end
