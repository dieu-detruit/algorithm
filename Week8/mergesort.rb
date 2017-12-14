def is_even(n)
	return n%2==0
end

def merge(a,b)
	c = Array.new(a.length()+b.length())
	ia = 0
	ib = 0
	ic = 0
	while ia < a.length() && ib < b.length()
		if a[ia] < b[ib]
			c[ic] = a[ia]
			ia = ia + 1
			ic = ic + 1
		else
			c[ic] = b[ib]
			ib = ib + 1
			ic = ic + 1
		end
	end

	if ia == a.length() then
		# bが余ったとき
		for k in ib..(b.length-1)
			c[a.length + k] = b[k]
		end
	else
		# aが余ったとき
		for k in ia..(a.length-1)
			c[b.length + k] = a[k]
		end
	end
	
	c
end

def mergesort(a)
	n = a.length()
	from = Array.new(n){Array.new(1)}
	for i in 0..(n-1)
		from[i][0] = a[i]
	end

	while n > 1
		to = Array.new(n/2)
		for i in 0..(n/2-1)
			to[i] = merge(from[i*2], from[i*2+1])
		end
	
		if !is_even(n)
			to[(n+1)/2-1]=from[n-1]
		end

		from=to
		n=(n+1)/2
	end
	from[0]
end

def make_gray(n)
	Array.new(n) { rand(0) }
end

show mergesort(make_gray(100))
