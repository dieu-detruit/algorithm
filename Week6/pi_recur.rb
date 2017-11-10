def pi_recur(rep)

item = 2.0
sum = 0.0

rep.times do |k|
	sum += item
	item = (k+1.0)/(2.0*k+3.0)*item
end

return sum
end


print("pi nearly equal ", pi_recur(10000), "\n")
