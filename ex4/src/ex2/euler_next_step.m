function y_next = euler_next_step( f, h, y, t )
%EULER_NEXT_STEP gives the next step of the explicit euler soliver
%   y_next = y + h*f(y)

y_next = y + h*f(y, t);

end

