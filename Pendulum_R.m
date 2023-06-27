% Parameters

gravity = 9.81;             % Acceleration due to gravity (m/s^2)

pendulumLength = 1.0;       % Length of the pendulum (m)

initialAngle = pi/4;        % Initial angle of the pendulum (rad)

timeStep = 0.01;            % Time step for simulation (s)

totalTime = 10;             % Total simulation time (s)


% Create video file

outputVideo = VideoWriter('pendulum_video.avi');

open(outputVideo);


% Simulation loop

t = 0:timeStep:totalTime;

theta = initialAngle * cos(sqrt(gravity/pendulumLength) * t);  % Pendulum angle as a function of time


for i = 1:length(t)

    % Calculate position of the ball

    x = pendulumLength * sin(theta(i));

    y = -pendulumLength * cos(theta(i));

    

    % Plot the pendulum and ball

    plot([0, x], [0, y], 'b', 'LineWidth', 2);    % Pendulum rod

    hold on;

    plot(x, y, 'ro', 'MarkerSize', 10);           % Ball

    hold off;

    

    axis([-pendulumLength, pendulumLength, -pendulumLength, 0.2]);

    axis equal;

    xlabel('X');

    ylabel('Y');

    title('Pendulum Motion');

    

    % Capture frame and write to video

    frame = getframe(gcf);

    writeVideo(outputVideo, frame);

    

    % Pause for a short time to control the animation speed

    pause(0.01);

end


% Close video file

close(outputVideo);

