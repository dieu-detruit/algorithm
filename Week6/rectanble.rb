# 整長方形の問題


=begin
# 2つの異なる平方数の和として表現できる(h**2 + w**2)より大きい最小の組を求める
# 2次元上での二分探索法を試す
class DiagonalComp
	

	def initialize()
		# 1から150までの整数の二乗を保存しておく
		@square = Array.new(150)
		150.times do |i|
			@square[i] = (i+1)**2
		end

		# 1から150までの横長整長方形を対角線の長さ順に保存しておく
		@rectangle = Array[Array[1, 2, 5], Array[1, 3, 10]]

		2.upto(150) do |height|
			1.upto(height-1) do |width|
				temp = norm(height, width)
				flag = false
				
				0.upto((height-1)*(height-2)/2-1) do |k|
					if @rectangle[k][2] > temp then
						@rectangle.insert(k, Array[height, width, temp])
						flag = true
						break
					elsif @rectangle[k][2] == temp then
						if @rectangle[k][0] > height then
							@rectangle.insert(k, [height, width, temp])
							flag = true
							break
						end
					end
				end

				if !(flag) then
					@rectangle.push([height, width, temp])
				end
			end
		end
	end

	def norm(h, w)
		return @square[h - 1] + @square[w - 1]
	end

	def ceil(height, weight)
		norm_sq = norm(height, weight)
		temp = 150*149/2
		index = temp/2
		while temp>0
			if @rectangle[index][2] == norm_sq then
				if @rectangle[index][0] == height then
					# 一致したらそれより一つ大きいやつがこたえ
					return @rectangle[index+1]
				elsif @rectangle[index][0] > height then
					index -= temp
				elsif @rectangle[index][0] < height then
					index += temp
				end
			elsif @rectangle[index][2] > norm_sq
				index -= temp	
			elsif @rectangle[index][2] < norm_sq
				index += temp
			end
			temp /= 2
		end
	end
end


comp = DiagonalComp.new
print(comp.ceil(98,100))
=end



class DiagonalComp
	def initialize(max)
		@max = max
		# 平方数を保存しておく
		@square = Array.new
		1.upto(@max) do |k|
			@square.push(k**2)
		end
	end

	def norm_sq(height, width)
		return @square[height-1] + @square[width-1]
	end

	# 与えた長さの対角線をもつ整長方形を高さが大きい順の配列にして返す
	def find_diagonal(diag)
		result = Array.new
		(@max-1).downto(1) do |big|
			next if big > diag

			(big-1).downto(0) do |small|
				break if norm_sq(big, small) < diag
				result.push(Array[small, big]) if norm_sq(big, small) == diag
			end
		end
		
		return result
	end

	def ceil(height, width)
		diag = norm_sq(height, width)
		same = find_diagonal(diag)

		if !(same.empty?) then
			temp = Array[width, height*2]
			same.each do |rect|
				temp = rect if rect[0] > height && rect[0] < temp[0]
			end
			return temp if temp[0] != width
		end

		target_diag = diag+1
		while true do
			find_list = find_diagonal(target_diag)
			if !(find_list.empty?) then
				return find_list[0]
			end
			target_diag += 1
		end
	end
end

inst = DiagonalComp.new(150)
print("ceil(99, 100) = ", inst.ceil(99, 100), "\n")



