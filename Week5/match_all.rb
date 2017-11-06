def match_all(str, target)

	strlen = str.length
	tarlen = target.length

	result = Array.new

	begin
		strlen.times do |i|
			break if strlen < tarlen + i
			if str[i..i+tarlen-1] == target then
				result.push(i)
			end
		end
	end

	return result
end

a = match_all("abcdabcdabcd", "bc")
if a.length > 0 then
	p "match_all(\"abcdabcdabcd\", \"bc\") = "

	a.each do |i|	
		print("match: ", i, "\n")
	end
end
