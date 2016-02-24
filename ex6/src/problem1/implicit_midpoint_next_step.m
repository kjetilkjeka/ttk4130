function y_next = implicit_midpoint_next_step( f, h, y, t )
%EULER_NEXT_STEP gives the next step of the explicit euler soliver
%   y_next = y + h*f(y)

F = @(y_next) y + h*f( (y+y_next)/2, t+h/2) - y_next;
y_next = fsolve(F, y);

end
