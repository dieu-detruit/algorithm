def maxrow(a, k)
	return (0..a.length-1).inject(0){|maxindex, i|
		a[maxindex][k].abs < a[i][k].abs ? i : maxindex
	}
end

def swap(a, k, max)
	a[k], a[max] = a[max], a[k]
end

def inverse(a)
	# a should be regular and square
	row = a.length
	print "row = ", row, "\n"
	# combine a and unit matrix E
	row.times{ |i|
		row.times{ |j|
			a[i].push(i==j ? 1.0 : 0.0)
		}
	}

	p a

	for k in 0..(row-1)
		max = k+maxrow(a[k..row-1], k)
		swap(a, k, max)
		akk = a[k][k]
		
		for i in 0..(2*row-1) # normalize row k
			a[k][i]=a[k][i]*1.0/akk
		end
		
		p a

		for i in 0..(row-1) # eliminate column k
			if i != k # of all rows but k
				aik = a[i][k]
				for j in k..(2*row-1)
					a[i][j] = a[i][j] - aik * a[k][j]
				end
			end
		end
		p a
	end

	p a
	inv = Array.new(row)
	row.times{ |i|
		inv[i] = a[i][row..2*row-1]
	}
	return inv
end

p inverse([[4.0, 1.0], [3.0, 2.0]])
