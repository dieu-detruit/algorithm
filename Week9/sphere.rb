# Monte Carlo法による球の体積近似


def vol_sphere(n)
	sum = 0
	n.times do
		x, y, z = rand, rand, rand
		sum += 1 if x*x+y*y+z*z < 1
	end

	return 8.0 * sum.to_f / n.to_f
end


test = [5, 10, 20, 50, 100, 200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 100000, 200000, 500000, 1000000, 2000000, 5000000, 10000000]

test.each do |i|
	p vol_sphere(i)
end
