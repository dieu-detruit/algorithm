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

def align(s,t)
	m = s.length
	n = t.length
	a = Array.new(m+1){Array.new(n+1)}
	a[0][0] = 0

	for j in 1..n
		a[0][j] = a[0][j-1] + g
	end

	for i in 1..m
		a[i][0] = a[i-1][0] + g
	end

	for i in 1..m
		for j in 1..n
			a[i][j] = max(a[i][j-1] + g, a[i-1][j-1] + q(s[i-1], t[j-1]), a[i-1][j] + g)
		end
	end
	return a
end

def align_dp(s, t)
	align(s, t)[s.length][t.length]
end

def spell(dict, word)
	max = align_dp(dict[0], word)
	max_word = dict[0]
	1.upto(dict.length-1) do |i|
		if temp = align_dp(dict[i], word) > max then
			max = temp
			max_word = dict[i]
		end
	end
	return max_word
end

p spell(["align", "airline", "engine", "arrow"], "arigne")
