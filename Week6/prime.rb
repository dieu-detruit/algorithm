include (Math)

class PrimitivePrimeJudger

	def initialize()
		@primes = Array[2, 3]
	end

	def calc_prime(target)
		n = @primes.last + 2
		flag = true
		until @primes.last > target do
			root = sqrt(n)
			@primes.each do |p|
				break if p > root
				if n % p == 0 then
					flag = false
					break
				end
			end	

			if flag then
				@primes.push(n)
			end
			n += 2
			flag = true
		end
	end

	def is_prime(n)
		root = sqrt(n)
		calc_prime(root) if @primes.last < root
		
		@primes.each do |p|
			break if p > root
			return false if n % p == 0
		end
		return true
	end
end


judger = PrimitivePrimeJudger.new

print("334 is ", judger.is_prime(334) ? "prime" : "not prime", "\n")
print("1213 is ", judger.is_prime(1213) ? "prime" : "not prime", "\n")
