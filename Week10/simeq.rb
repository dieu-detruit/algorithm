def gj(a) # Gauss - Jordan method without pivoting
	row = a.length()
	col = a[0].length()
	for k in 0..(col-2)
		akk = a[k][k]
		for i in 0..(col-1) # normalize row k
		a[k][i]=a[k][i ]*1.0/akk
		end
		
		for i in 0..(row-1) # eliminate column k
			if i != k # of all rows but k
				aik = a[i][k]
				for j in k..(col-1)
					a[i][j] = a[i][j] - aik * a[k][j]
				end
			end
		end
	end
	return a
end

def maxrow(a, k)
	return (0..a.length-1).inject(0){|maxindex, i|
		a[maxindex][k].abs < a[i][k].abs ? i : maxindex
	}
end

def swap(a, k, max)
	a[k], a[max] = a[max], a[k]
end

def gjp(a) # Gauss - Jordan method WITH pivoting
	row = a.length()
	col = a [0].length()
	
	for k in 0..(col-2)
		max = maxrow(a, k)
		swap(a, k, max)
		akk = a[k][k]
		
		for i in 0..(col-1) # normalize row k
			a[k][i]=a[k][i]*1.0/akk
		end
		
		for i in 0..(row-1) # eliminate column k
			if i != k # of all rows but k
				aik = a[i][k]
				for j in k..(col-1)
					a[i][j] = a[i][j] - aik * a[k][j]
				end
			end
		end
	end
	return a
end

a = [[1.0, -50.0, 3.0, -90.0], [-85.0, 2.0, -25.0, -6.0], [79.0, 5.0, 30.0, -1.0]]

p gj(a)

p gjp(a)




