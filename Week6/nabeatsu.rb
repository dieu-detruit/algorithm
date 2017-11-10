def is_aho(num)

	return true if num % 3 == 0
	return true if num.to_s.index("3") != nil

	return false
end

1.upto(333) do |i|
	print(is_aho(i) ? "aho" : i, "\n")
end
