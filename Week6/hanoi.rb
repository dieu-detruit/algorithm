# Tower of Hanoi algorithm
# 大きいほうから1~nとする
class Hanoi

	def initialize(disk_num)
		@disk_num = disk_num
		@tower = Array.new(3){Array.new}
		
		1.upto(@disk_num) do |i|
			@tower[0].push(i)
		end
		
		print(@tower[0], @tower[1], @tower[2], "\n")
	end
	
	def move(org, dest)
		if !(@tower[org].empty?) then
			@tower[dest].push(@tower[org].pop)
			print(@tower[0], @tower[1], @tower[2], "\n")
		end
	end
	
	def other(a, b)
		sum = a + b
		case sum
		when 1 then
			return 2
		when 2 then
			return 1
		when 3 then
			return 0
		end	
	end
	
	def solve(n=@disk_num, org=0, dest=2)
		if n == 1 then
			move(org, dest)
		else
			solve(n-1, org, other(org, dest))
			move(org, dest)
			solve(n-1, other(org, dest), dest)
		end
	end
end


3.upto(10) do |i|
	print("tower of hanoi, the number of disk = ", i, "\n")

	hanoi = Hanoi.new(i)
	hanoi.solve
end



