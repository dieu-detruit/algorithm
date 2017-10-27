def power(x, y)
	return 1 if y == 0
	return power(x, y-1)*x if y>0
	return power(x, y+1)/x if y<0
end
