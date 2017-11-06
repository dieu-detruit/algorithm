def reverse(str)
	# 文字列の長さ
	len = str.length

	result = ""
	
	# ひっくりかえす
	len.times do |i|
		result += str[len-i-1]
	end
	return result
end
