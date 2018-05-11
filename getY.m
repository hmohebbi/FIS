function y = getY( p1, p2, x )
%get y (membership) for x input
m = (p2(2) - p1(2)) ./ (p2(1) - p1(1));

y = m.*(x-p1(1))+p1(2);

end

