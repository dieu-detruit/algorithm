
require './bench.rb'

def comb_recur(n, k)
	return 0 if n<k
	return 1 if k=0
	return n if k=1

	return comb_recur(n-1, k) + comb_recur(n-1, k-1)
end

def comb_recur_mult(n, k)
	return 0 if n<k
	return 1 if k=0

	return n * comb_recur_mult(n-1, k-1) / k
end


def comb_rep(n, k)


end
