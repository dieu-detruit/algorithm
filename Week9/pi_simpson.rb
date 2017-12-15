# Simpsonの公式を用いた円周率の近似

include (Math)

def f(x)
	return sqrt(1-x*x)
end

def area_circle(n)
	dx = 0.5 / n.to_f
	return (1..(n-1)).inject {|sum, i|
		sum + f(2.0*i.to_f*dx) + 4.0*f((2.0*i.to_f+1.0)*dx) + f((2.0*i.to_f+2.0)*dx)
	} * dx / 3.0
end

def pi(n)
	return 4.0 * area_circle(n)
end

test = [5, 10, 20, 50, 100, 200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 100000, 200000, 500000, 1000000]

test.each {|i|
	print(i, ", ", pi(i), "\n")
}


