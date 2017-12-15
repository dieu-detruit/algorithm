#piの近似
#四分円の面積から求める
#y = sqrt(1-x^2) (0<x<1)

include (Math)

def f(x)
	return sqrt(1-x*x)
end

def area_circle(n)
	dx = 1.0 / n.to_f
	return dx / 2.0 * (0..(n-1)).inject(0){|sum, i|
		sum + f(i.to_f * dx) + f((i+1).to_f * dx)
	}
end

def pi(n)
	return 4.0 * area_circle(n)
end

1.upto(30) do |i|
	print(i, ", ", pi(i), "\n")
end

6.upto(40) do |i|
	print(i*5, ", ", pi(i*5), "\n")
end
