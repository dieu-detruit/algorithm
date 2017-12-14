#行列を用いたフィボナッチ数の一般項の計算
# [[Fn+1], [Fn]] = [[1,1],[1,0]]^n * [[1],[1]]

include (Math)
require 'matrix'

# nは正とする
def matrix_pow(mat, n)
	if n%2 == 0 then
		return Matrix[[1, 0], [0, 1]] if n==0
		temp = matrix_pow(mat, n/2)
		return temp * temp
	else
		return matrix_pow(mat, n-1) * mat
	end
end

def fib_matrix(n)

	mat = Matrix[[1, 1], [1, 0]]
	vec = Vector[1, 1]

	temp = matrix_pow(mat, n) * vec

	p matrix_pow(mat, 2)


	return temp[1]
end

p fib_matrix(10)
