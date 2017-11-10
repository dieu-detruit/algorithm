def combination(n, k)
	if k > n then
		return 0
	elsif k==0 then
		return 1
	else
		return combination(n-1, k-1) + combination(n-1, k)
	end
end

print("C(4, 2) = ", combination(4, 2), "\n")
