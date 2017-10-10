include(Math)

def quadratic(a, b, c) # a*x**2 + b*x + c = 0の小さくない方の解を求める(ただしb**2-4*a*c>0とする)
   (-b + sqrt(b ** 2 - 4*a*c))/2
end 

print("a = ")
a = STDIN.gets.to_i

print("b = ")
b = STDIN.gets.to_i

print("c = ")
c = STDIN.gets.to_i

printf( "the solutionr(that is not smaller) = %4.5f", quadratic(a, b, c))

