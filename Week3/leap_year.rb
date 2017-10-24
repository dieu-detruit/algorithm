=begin
うるう年の定義は、
(i)4の倍数ならばうるう年
(ii)100の倍数かつ400の倍数ではないときうるう年でない

=end


def is_leap_year(year)
	if year % 400 == 0 then
		return true
	elsif year % 100 == 0 then
		return false
	elsif year % 4 == 0 then
		return true
	end
end
