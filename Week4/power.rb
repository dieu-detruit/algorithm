# yは整数とし、0^0は未定義とする
def power(x, y)
	
	begin
		raise RangeError if y.floor != y
		if y==0 then
			raise RangeError if x==0
			return 1
		elsif y>0 then
			prod = 1.0
			y.times do
				prod *= x
			end
			return prod
		else
			prod = 1.0
			(-y).times do
				prod /= x
			end
		end
	rescue RangeError => error
		p error
	end	
end
