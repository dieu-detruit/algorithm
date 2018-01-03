def g()
	return -2
end

def q(c, d)
	return (c == d) ? 2 : -1
end

def max(*args)
	return args.inject(args[0]) { |max, item|
		max < item ? item : max
	}
end

def align_sub(s,t,i,j)
	if i==0 || j==0
		i*g + j*g
	else
		v0 = align_sub(s,t,i, j-1) + g()
		v1 = align_sub(s,t,i-1,j-1) + q(s[i-1],t[j-1])
		v2 = align_sub(s,t,i-1,j) + g()
		max(v0,max(v1,v2))
	end
end

def align_rec(s,t)
	align_sub(s,t,s.length,t.length)
end

p align_rec("AAC", "ATAG")
