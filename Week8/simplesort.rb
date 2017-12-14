#simplesort.rb

def min_index(a, i)
	min = a[i]
	index = i
	for k in i..(a.length-1)
		if a[k] < min then
			min = a[k]
			index = k
		end
	end
	return index
end

def simplesort(a)
  for i in 0..(a.length()-1)
	  k = min_index(a,i)
	  v = a[i]
	  a[i] = a[k]
	  a[k] = v
  end
  return a
end
