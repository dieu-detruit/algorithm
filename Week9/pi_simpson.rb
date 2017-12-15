# Simpsonの公式を用いた円周率の近似

include (Math)

def f(x)
	return sqrt(1-x*x)
end

def area_circle(n)
	dx = 0.5 / n.to_f
	return dx / 3.0 * (0..(n-1)).inject(0){|sum, i|
		sum + f(2.0*i.to_f*dx) + 4.0*f((2.0*i.to_f+1.0)*dx) + f((2.0*i.to_f+2.0)*dx)
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
=begin
test = [5, 10, 20, 50, 100, 200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 100000, 200000, 500000, 1000000, 2000000, 5000000]

test.each {|i|
	print(i, ", ", pi(i), "\n")
}
=end
