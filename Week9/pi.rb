#piの近似
#四分円の面積から求める
#y = sqrt(1-x^2) (0<x<1)

include (Math)

def f(x)
	return sqrt(1-x*x)
end

def area_circle(n)
	dx = 1.0 / n.to_f
	return (1..(n-1)).inject {|sum, i|
		sum + f(i.to_f * dx) + f((i+1).to_f * dx)
	} * dx * 0.5
end

def pi(n)
	return 4.0 * area_circle(n)
end

test = [5, 10, 20, 50, 100, 200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 100000, 200000, 500000, 1000000]

test.each {|i|
	print(i, ", ", pi(i), "\n")
}


