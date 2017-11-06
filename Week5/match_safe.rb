def match_safe(str, target)
	strlen = str.length
	tarlen = target.length

	begin
		strlen.times do |i|
			break if strlen < tarlen + i
			return i if str[i..i+tarlen-1] == target
		end
	end

	return -1
end

print("match_safe(\"abcdefg\", \"ef\") = ", match_safe("abcdefg", "ef"), "\n")
print("match_safe(\"abcdefg\", \"ez\") = ", match_safe("abcdefg", "ez"), "\n")

