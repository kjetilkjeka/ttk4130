function y_next = implicit_euler_next_step( f, h, y, t )
%EULER_NEXT_STEP gives the next step of the explicit euler soliver
%   y_next = y + h*f(y)

F = @(y_next) y + h*f(y_next, t+h) - y_next;
y_next = fsolve(F, y);

end

