def multMat(x, y)

	m = x.length
	n = x[0].length
	k = y[0].length

	if n != y.length then
		print "Multi Matrix is not defined"
	end 

	matrix = Array.new(m){Array.new(k){0}}
	
	m.times do |i|
		k.times do |j|
			n.times do |s|
				matrix[i][j] += x[i][s] * y[s][j]
			end
		end
	end


	matrix
end


a = multMat([[1, 5],[3, 1], [2, 2]], [[2, 3, 1], [4, 1, 2]])


print(a[0][0], ", ", a[0][1], ", ", a[0][2], "\n")
print(a[1][0], ", ", a[1][1], ", ", a[1][2], "\n")
print(a[2][0], ", ", a[2][1], ", ", a[2][2], "\n")
